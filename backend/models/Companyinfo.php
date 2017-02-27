<?php

namespace backend\models;

use Yii;
use backend\models\Invoice;
use backend\models\Company;
/**
 * This is the model class for table "companyinfo".
 *
 * @property integer $id
 * @property string $companyname
 * @property string $dbname
 * @property double $driver_fee
 * @property double $client_fee
 * @property double $subscription_fee
 */
class Companyinfo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'companyinfo';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [[ 'dbname', 'driver_fee', 'client_fee', 'subscription_fee'], 'required'],
            [['driver_fee', 'client_fee', 'subscription_fee'], 'number'],
            [['companyname', 'dbname'], 'string', 'max' => 255],
            ['dbname', 'unique'],
            [['companyname'], 'required', 'on' => 'update']
        ];
    }

    public function update($runValidation = true, $attributeNames = null)
    {
        $this->scenario = 'update';
        return parent::update($runValidation, $attributeNames);
    }
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'companyname' => 'Company Name',
            'dbname' => 'Dbname(Client ID)',
            'driver_fee' => 'Driver Fee',
            'client_fee' => 'Client Fee',
            'subscription_fee' => 'Subscription Fee',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInvoices()
    {
        return $this->hasMany(Invoice::className(), ['id' => 'company']);
    }

    /**
     * autofill company name from clients `mycompany` table when creating new company info
     */
    public function beforeSave($insert){
        if(!$this->isNewRecord) return true;
        if (parent::beforeSave($insert)) {
            try{
              $client = Company::getByDbname($this->dbname);
            }catch(\yii\db\Exception $e){
                Yii::$app->session->setFlash('error',$e->getMessage());
            }
            if($client){
                $this->companyname = $client['Name'];
                return true;
            }else{
                Yii::$app->session->setFlash('error','Error connecting to '.$this->dbname.' database');
                return false;
            }
         } else {
                return false;
         }
    }
}
