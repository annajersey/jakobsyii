<?php

namespace backend\models;
use backend\models\Tax;
use backend\models\Companyinfo;
use Yii;

/**
 * This is the model class for table "products".
 *
 * @property integer $id
 * @property string $name
 * @property double $price
 * @property integer $tax_id

 *
 * @property Tax $tax
 */
class Product extends \yii\db\ActiveRecord
{
  public $company_id;
  public $fee;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'products';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tax_id'], 'required'],
            [['name', 'price'], 'required', 'on' => 'create'],
            [['company_id', 'fee'], 'required', 'on' => 'create-fee'],
            [['price'], 'number'],
            [['tax_id'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['tax_id'], 'exist', 'skipOnError' => true, 'targetClass' => Tax::className(), 'targetAttribute' => ['tax_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'price' => 'Net Price',
            'tax_id' => 'Tax',
            'taxvalue' => 'Tax Amount',
            'fullprice' => 'Full Price',
            'tax.name'=>'Tax'
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTax()
    {
        return $this->hasOne(Tax::className(), ['id' => 'tax_id']);
    }

    public function getInvoices() {
        return $this->hasMany(Invoice::className(), ['id' => 'invoice_id'])
          ->viaTable('invoice_products', ['product_id' => 'id']);
    }

    public function getTaxValue(){
        $tax = $this->getTax()->one();
        return $this->price*$tax->percent/100;
    }
    
    public function getTaxstring(){
        $tax = $this->getTax()->one();
        return $tax->name.' ('.$tax->percent.'%)';
    }
    
    public function getFullPrice(){
        $tax = $this->getTax()->one();
        return $this->price+$this->price*$tax->percent/100;
    }
    
    /**
     * in case of products based on company fee
     */
    public function beforeSave($insert)
    {
	if (parent::beforeSave($insert)) {
            if($this->isNewRecord && $this->scenario == 'create-fee'){
                $companyinfo = Companyinfo::findOne($this->company_id);
                switch($this->fee){
                    case 1: {
                        $driversNum = Company::driversNum($companyinfo->dbname);
                        echo $companyinfo->dbname.' '.$driversNum.' '.$companyinfo->driver_fee.PHP_EOL;
                        $this->price = $companyinfo->driver_fee*$driversNum; 
                        $this->name = $companyinfo->companyname.' Driver Fee '.date('Y-m-d'); 
                        break;
                    }
                    case 2: {
                        $clientsNum = Company::clientsNum($companyinfo->dbname);
                        $this->price = $companyinfo->client_fee*$clientsNum; 
                        $this->name = $companyinfo->companyname.' Client Fee '.date('Y-m-d'); 
                        break;
                    }
                     case 3: {
                        $this->price = $companyinfo->subscription_fee; 
                        $this->name = $companyinfo->companyname.' Subscription Fee '.date('Y-m-d'); 
                        break;
                    }
                }
                return true;
            }else{
                return true;
            }   
        } else {
            return false;
        }
    }
}
