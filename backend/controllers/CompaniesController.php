<?php

namespace backend\controllers;

use Yii;
use yii\filters\AccessControl;
use backend\models\Company;
use yii\data\ArrayDataProvider;
use backend\models\Notification;
use yii\helpers\Url;
use backend\models\Encrypt;

class CompaniesController extends \yii\web\Controller
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
            
        ];
    }
	
    /**
     * Output list of admins for "login as"
     */
    public function actionLoginas(){
        $data = Company::getAdmins(); 
        $dataProvider = new ArrayDataProvider([
            'allModels' => $data,
            'sort' => [
                'attributes' => ['adminid', 'fullname', 'username','companyname','email','key'],
            ],
            'pagination' => [
                    'pageSize' => 10,
            ],
        ]);
        return $this->render('loginas',['dataProvider'=>$dataProvider]);
    }

    /**
     * Output list of companies and form to send emails and create notifications
     */
    public function actionNotify()
    {
        $data = Company::getCompanies(); 
        $dataProvider = new ArrayDataProvider([
            'allModels' => $data,
            'sort' => [
                    'attributes' => ['name', 'address','email','web','client_id'],
            ],
            'pagination' => [
                    'pageSize' => 10,
            ],
        ]);
        return $this->render('notify',['dataProvider'=>$dataProvider]);
    }
    
    
    public function actionCreate(){
        return $this->render('create',['newcompany'=>Yii::$app->session->get('newcompany')]);
    }

    /**
     * Creates new company panel by creating new database and fill it with init data from form
     * On success redirects to page with link to login to new panel
    */
    public function actionSavenew(){
        Yii::$app->session->set('newcompany', Yii::$app->request->post());
        $loginkey = Company::createnew(Yii::$app->request->post()); 
        if($loginkey)  Yii::$app->session->setFlash('success', 'Company was created');
        else return Yii::$app->response->redirect(['companies/create']);
         $key = Encrypt::encryptpass(Yii::$app->request->post('dbname'));
            $token=md5('jakobs');
            file_get_contents(Yii::$app->params['panelUrl'].'/action/addclientfolder.php?key='.$key.'&token='.$token);
        return Yii::$app->response->redirect(['companies/createsuccess','key' => $loginkey]);
    }

 
    
    public function actionCreatesuccess(){
            return $this->render('create-success',['key'=>Yii::$app->request->get('key')]);
    }	
    
    /**
     * Sends emails and creates notification for chosen companies
     */
    public function actionMakenotify(){
        $companies = Company::getCompanies(); 
        if(Yii::$app->request->post()){
            $by_email=Yii::$app->request->post('by_email');
            $by_notify=Yii::$app->request->post('by_notify');
            $subject=Yii::$app->request->post('subject');
            $message=Yii::$app->request->post('message');
            $selection=(array)Yii::$app->request->post('selection');
            $success=true;
            if(empty($selection)){Yii::$app->session->setFlash('error', 'Choose companies'); $success=false;}
            foreach($selection as $id){
                $email = $companies[$id]['email'];				
                if($by_email){
                    $send = Yii::$app->mail2->compose('notifycompanies',['m'=>$message,'company'=>$companies[$id]['name']])
                    ->setFrom([Yii::$app->params['adminEmail'],Yii::$app->params['SiteName']])
                    ->setTo($email)
                    ->setSubject($subject)
                    ->send();
                    if(!$send) {Yii::$app->session->setFlash('error', 'Error sending email to '.$email); $success=false;}
                }
                if($by_notify){
                    $model = new Notification();
                    $model->company=$id;
                    $model->message=$message;
                    $from = Yii::$app->request->post('from') ? Yii::$app->request->post('from') : date('Y-m-d H:i',time());
                    $model->from=$from;
                    $model->to=Yii::$app->request->post('to');
                    if(!$model->save()) {Yii::$app->session->setFlash('error', 'Error saving notification to '.$companies[$id]['name']); $success=false;}
                }	
            }
            if($success) Yii::$app->session->setFlash('success', 'Notifications was sent');
        }
        return Yii::$app->response->redirect('notify');
    }


}
