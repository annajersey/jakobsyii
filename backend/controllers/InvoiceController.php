<?php

namespace backend\controllers;

use Yii;
use backend\models\Invoice;
use backend\models\InvoiceSearch;
use backend\models\InvoiceSend;
use backend\models\ProductSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;
use mPDF;
use backend\models\Encrypt;
/**
 * InvoiceController implements the CRUD actions for Invoice model.
 */
class InvoiceController extends Controller
{
    /**
     * @inheritdoc
     */
     public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Invoice models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new InvoiceSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
		$dataProvider->pagination->pageSize=15;
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Invoice model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $query = $model->getInvoicesends();

        $sendingdataProvider = new ActiveDataProvider([
            'query' => $query
        ]);
        $productsDataProvider = new ActiveDataProvider([
            'query' => $model->getProducts()
        ]);
        $company = $model->getCompanyData();
        $taxgroups = $model->getTaxGroups(); 
        return $this->render('view', [
            'model' => $this->findModel($id),
            'sendingdataProvider' => $sendingdataProvider,
            'productsDataProvider' => $productsDataProvider,
            'company' => $company,
             'taxgroups' =>  $taxgroups
        ]);
    }

    /**
     * Creates a new Invoice model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Invoice();
        $selection = Yii::$app->request->post('selection');
        if(empty($selection)) {
            Yii::$app->session->setFlash('error', 'Products not selected');
            return $this->redirect(Yii::$app->request->referrer);
        }
        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search([]);
        $dataProvider->query->where('id in ('.implode(',',$selection).')');
        $model->product_ids=$selection;
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            
            return $this->render('create', [
                'model' => $model,
                'productsDataProvider' => $dataProvider,
            ]);
        }
    }

    /**
     * Updates an existing Invoice model.
     * If update is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
//    public function actionUpdate($id)
//    {
//        $model = $this->findModel($id);
//
//        if ($model->load(Yii::$app->request->post()) && $model->save()) {
//            return $this->redirect(['index', 'id' => $model->id]);
//        } else {
//            return $this->render('update', [
//                'model' => $model,
//            ]);
//        }
//    }

    /**
     * Deletes an existing Invoice model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Invoice model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Invoice the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Invoice::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
	
   
    public function actionBulk(){
        $ids = Yii::$app->request->post('selection');
        if(empty($ids)){
            Yii::$app->session->setFlash('error', 'Please select invoices');
            return $this->redirect(Yii::$app->request->referrer);
        }
        
        if(null !== Yii::$app->request->post('action_send')){
            $this->Sendall($ids);
        }
        
        if(null !==Yii::$app->request->post('action_paid')){
            foreach($ids as $id){
                $model=$this->findModel($id);
                $model->status=3;
                $model->save(['status']);
            }
            Yii::$app->session->setFlash('success', 'Statuses was changed to "paid"');
            return $this->redirect(Yii::$app->request->referrer);
        }
    }
    
    /**
     * Mark invoice as paid.
     * @param integer $id
     * @return mixed
     */
    public function actionPaid($id)
    {
        $model=$this->findModel($id);
        $model->status=3;
        $model->save(['status']);
        Yii::$app->session->setFlash('success', 'Status was changed to "paid"');
	return $this->redirect(Yii::$app->request->referrer);
    }
    
    /**
     * Bulk send invoice emails.
     * @return mixed
     */
    private function Sendall($ids)
    {
	$success = true;
        foreach($ids as $id){
                if(!$this->sendinvoice($id)) $success = false;
        }
        if($success) Yii::$app->session->setFlash('success', 'Emails was send');
	return $this->redirect(Yii::$app->request->referrer);
    }
    
    /**
     * Sends invoice email.
     * @param integer $id
     * @return mixed
     */
    public function actionSend($id)
    {
        $this->sendinvoice($id);
	return $this->redirect(Yii::$app->request->referrer);
    }
    
   
    
    /**
     * Sends invoice email for given invoice id and saves pdf file on server.
     * @param integer $id
     * @return boolean
     */
    function sendinvoice($id){
        $model=$this->findModel($id);
        $productsDataProvider = new ActiveDataProvider([
            'query' => $model->getProducts()
        ]);
        $subject='Invoice #'.$model->number;
        $message='Invoice attached';
        $mpdf=new mPDF();
        $company = $model->getCompanyData();
        $taxgroups = $model->getTaxGroups(); 
        $mpdf->WriteHTML($this->renderPartial('pdf',['model' => $model,'productsDataProvider'=>$productsDataProvider,'company'=>$company,'taxgroups'=>$taxgroups]));
        $path = $mpdf->Output('', 'S'); 
        try{
            $mail = new Yii::$app->mail2;
            $mail->compose()
             ->setFrom([Yii::$app->params['adminEmail']=>Yii::$app->params['SiteName']])
             ->setTo([$model->email])
             ->setSubject($subject)
             ->setTextBody($message)
             ->attachContent($path, 
                     ['fileName' => 'Invoice #'.$model->number.'.pdf', 
                      'contentType' => 'application/pdf'])
             ->send();
             Yii::$app->session->setFlash('success', 'Email was send');
             if($model->status==1){
                $model->status=2;
                $model->save(['status']);
             }
             $invoiceSend = new InvoiceSend();
             $invoiceSend->invoice_id = $model->id;
             $invoiceSend->email = $model->email;     
             $invoiceSend->date = date('Y-m-d H:i',time());   
             $invoiceSend->save();
             $fn='invoices/Invoice #'.$model->number.'.pdf';
             if (file_exists($fn)) unlink($fn);
             $mpdf->Output($fn,'F');
             return true;
        }catch (Exception $e) {
                Yii::$app->session->setFlash('error', $e->getmessage());
                return false;
        }
        return false;
    }
    

	
}
