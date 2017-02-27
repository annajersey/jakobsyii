<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Tax;
use yii\helpers\ArrayHelper;
use backend\models\Companyinfo;

/* @var $this yii\web\View */
/* @var $model backend\models\Product */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'company_id')->dropDownList(ArrayHelper::map(Companyinfo::find()->all(),'id','companyname')) ?>

    <?= $form->field($model, 'fee')->dropDownList([1=>'Driver Fee',2=>'Client Fee',3=>'Subscription Fee']) ?>

    <?// $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?// $form->field($model, 'price')->textInput() ?>

    <?= $form->field($model, 'tax_id')->dropDownList(ArrayHelper::map(Tax::find()->all(),'id','name')) ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
