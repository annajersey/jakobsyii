<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "notification".
 *
 * @property integer $id
 * @property string $company
 * @property string $message
 * @property string $from
 * @property string $to
 */
class Notification extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'notification';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['company', 'message', 'from', 'to'], 'required'],
            [['message'], 'string'],
			[['message'], 'filter','filter'=>function($v){ return strip_tags($v, '<b><i>');}],
            [['from', 'to'], 'safe'],
            [['company'], 'string', 'max' => 255],
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
            'message' => 'Message',
            'from' => 'From',
            'to' => 'To',
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanyinfo()
    {
        return $this->hasOne(Companyinfo::className(), ['id' => 'company']);
    }
}
