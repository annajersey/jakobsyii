<?php

namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
use backend\models\Company;
use backend\models\Companyinfo;
use backend\models\InvoiceSend;
use backend\models\InvoiceProducts;
use backend\models\Tax;
use cornernote\linkall\LinkAllBehavior;
/**
 * This is the model class for table "invoice".
 *
 * @property integer $id
 * @property integer $company
 * @property double $amount
 * @property string $created_time
 * @property string $duedate_time
 * @property string $number
 * @property integer $status
 * @property string $email
 */
class Invoice extends \yii\db\ActiveRecord
{
   /**
     * @inheritdoc
     */
    public $product_ids;
     
    public static function tableName()
    {
        return 'invoice';
    }

    public function behaviors()
	{
		return [
			[
				'class' => TimestampBehavior::className(),
				'createdAtAttribute' => 'created_time',
				'updatedAtAttribute' => false,
				'value' => new Expression('CURRENT_TIMESTAMP'),
			],
                         [
				'class' => LinkAllBehavior::className(),
			 ],
		];
	}

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['company', 'duedate_time', 'status'], 'required'],
            [['company', 'status'], 'integer'],
            [['amount'], 'number'],
            [['created_time', 'duedate_time','statusstring','description'], 'safe'],
            [['number'], 'string', 'max' => 25],
            [['email'], 'string', 'max' => 255],
			[['email'], 'email'],
			[['email', 'amount'], 'required', 'on' => 'update']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'company' => 'Company',
            'amount' => 'Amount',
            'created_time' => 'Created Time',
            'duedate_time' => 'Duedate Time',
            'number' => 'Number',
            'status' => 'Status',
			'statusstring' => 'Status',
            'email' => 'Email',
			'description' => 'Description',
        ];
    }
	
    /**
     * generate number for new invoice, and autofill email field from company database, calculate amount
     */
    public function beforeSave($insert)
    {
	if(!$this->isNewRecord) return true;
        if (parent::beforeSave($insert)) {
            if(empty($this->product_ids)){
                 Yii::$app->session->setFlash('error', 'There are no products in invoice. Select products');
                 return false;
            }
            $model = Invoice::find()->orderBy(['id' => SORT_DESC])->one();
            if(!is_object($model))
                $this->number = $this->generateNumber(1);    
            else  
                $this->number = $this->generateNumber($model->id+1);
            $company = Company::findOne($this->company);
            if($company) $this->email = $company['Email'];
            
            $amount=0;
            foreach ($this->product_ids as $product_id) {
                $product = Product::findOne($product_id);
                $tax = Tax::findOne($product->tax_id);
                $amount+=$product->price+$product->price*$tax->percent/100;
            }
            
            $this->amount=$amount;
            return true;
            
        } else {
            return false;
        }
    }
    
    public function getStatusstring(){
        switch ($this->status) {
                case 1:
                        return "New";
                case 2:
                        return "Sent";
                case 3:
                        return "Paid";
                default:
                        return "N/A";
        }
    }
    
    /**
     * generate number for invoice
     * @param int $number
     */
    private function generateNumber($number)
    {
        for ($s = 0, $w = 2, $n = (string)$number, $i = strlen($n) - 1; $i >= 0; $i--, ($w % 2 ? $w++ : $w--)) $s += array_sum(str_split(($n{$i} * $w)));
        $mod= 10 - ($s % 10);
        if($mod > 9){
               $mod=0;
        }
       if(strlen(strval($number))<6)//If number is less than 6 add extra zero in front
        {
                $number=str_pad($number, 6, 0 , STR_PAD_LEFT);//Add the extra zero in front of the ID
        }
       return($number.$mod);
    }
    
    /**
     * extend core update function to add "scenario" param
     */
    public function update($runValidation = true, $attributeNames = null)
    {
            $this->scenario = 'update';
            return parent::update($runValidation, $attributeNames);
    }


    public function getCompanyData(){
        return Company::findOne($this->company);
        
    }
    
    public function getTaxGroups(){
        $taxgroups = [];
        foreach($this->getProducts()->all() as $product){
            $taxgroups[$product->tax_id]['tax']=$product->tax;
            $taxgroups[$product->tax_id]['total'] = isset($taxgroups[$product->tax_id]['total']) ? $taxgroups[$product->tax_id]['total'] : 0;
            $taxgroups[$product->tax_id]['total']+=$product->price*$product->tax->percent/100;
        }
        return $taxgroups;
    } 
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanyinfo()
    {
        return $this->hasOne(Companyinfo::className(), ['id' => 'company']);
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
	public function getInvoicesends()
    {
        return $this->hasMany(InvoiceSend::className(), ['invoice_id' => 'id']);
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
	public function getInvoiceProducts()
    {
        return $this->hasMany(InvoiceProducts::className(), ['invoice_id' => 'id']);
    }
    
    public function getProducts(){
        return $this->hasMany(Product::className(), ['id' => 'product_id'])
        ->viaTable('invoice_products', ['invoice_id' => 'id']);
    }
    
   
    
    public function afterSave($insert, $changedAttributes)
    {  
        if(empty($this->getProducts()->all())){
            $products = [];  
            if(empty($this->product_ids)){
                     Yii::$app->session->setFlash('error', 'There are no products in invoice. Select products');
                     return false;
             }
            foreach ($this->product_ids as $product_id) {
                $product = Product::findOne($product_id);
                if ($product) {
                    $products[] = $product;
                }
            }

            $this->linkAll('products', $products);
        }
        parent::afterSave($insert, $changedAttributes);
    }
    
    protected function findModel($id)
    {
        if (($model = Invoice::findOne($id)) !== null) {
            return $model;
        }
        throw new HttpException(404, 'The requested page does not exist.');
    }
}
