<?php

namespace backend\controllers;

use Yii;
use backend\models\Notification;
use backend\models\NotificationSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\models\Encrypt;
/**
 * NotificationController implements the CRUD actions for Notification model.
 */
class NotificationsController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {	
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
					[
                        'allow' => true,
                        'actions' => ['getnotifications'],
                        'roles' => ['?'],
                    ],
                ],
            ],
        ];
    }

    /**
     * Lists all Notification models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new NotificationSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Notification model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Notification model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Notification();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Notification model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Notification model.
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
     * Finds the Notification model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Notification the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Notification::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
	 
    /**
     * Sends invoice email.
     */
    public function actionGetnotifications(){
        //header('Access-Control-Allow-Origin: '.Yii::$app->params['panelUrl'], false); 
        header('Access-Control-Allow-Origin: * ', false); 
        $company_db=Encrypt::decryptpass(Yii::$app->request->get('company'));
        $notifications =  Notification::find()
        ->joinWith(['companyinfo'])      
        ->where(['dbname' => $company_db])
        ->andWhere(['<=', 'from', date('Y-m-d H:i')])
        ->andWhere(['>=', 'to', date('Y-m-d H:i')])
        ->all();
        $result = [];
        foreach($notifications as $notify){
                $result[] = $notify->message;
        }
        echo json_encode($result);
        die();
    }
    
     /**
     * Bulk delete notifications.
     * @return mixed
     */
    public function actionBulkdelete()
    {
	$ids = Yii::$app->request->post('selection');
        if(empty($ids)){
            Yii::$app->session->setFlash('error', 'Nothing selected');
            return $this->redirect(Yii::$app->request->referrer);
        }
        
        foreach($ids as $id){
            $this->findModel($id)->delete();
        }
        Yii::$app->session->setFlash('success', 'Emails was send');
	return $this->redirect(Yii::$app->request->referrer);
    }
}
