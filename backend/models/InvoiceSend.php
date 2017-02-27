<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "invoice_send".
 *
 * @property integer $id
 * @property integer $invoice_id
 * @property string $email
 * @property string $date
 *
 * @property Invoice $invoice
 */
class InvoiceSend extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'invoice_send';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['invoice_id'], 'integer'],
            [['email', 'date'], 'required'],
            [['date'], 'safe'],
            [['email'], 'string', 'max' => 255],
            [['invoice_id'], 'exist', 'skipOnError' => true, 'targetClass' => Invoice::className(), 'targetAttribute' => ['invoice_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'invoice_id' => 'Invoice ID',
            'email' => 'Email',
            'date' => 'Date',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInvoice()
    {
        return $this->hasOne(Invoice::className(), ['id' => 'invoice_id']);
    }
}
