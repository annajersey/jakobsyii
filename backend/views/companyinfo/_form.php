<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Companyinfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="companyinfo-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php if(!$model->isNewRecord) echo $form->field($model, 'companyname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'dbname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'driver_fee')->textInput() ?>

    <?= $form->field($model, 'client_fee')->textInput() ?>

    <?= $form->field($model, 'subscription_fee')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
