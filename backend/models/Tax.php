<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "tax".
 *
 * @property integer $id
 * @property string $name
 * @property double $percent
 *
 * @property Products[] $products
 */
class Tax extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tax';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'percent'], 'required'],
            [['percent'], 'number'],
            [['name'], 'string', 'max' => 255],
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
            'percent' => 'Percent',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Products::className(), ['tax_id' => 'id']);
    }
}
