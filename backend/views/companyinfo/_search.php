<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CompanyinfoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="companyinfo-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'companyname') ?>

    <?= $form->field($model, 'dbname') ?>

    <?= $form->field($model, 'driver_fee') ?>

    <?= $form->field($model, 'client_fee') ?>

    <?php echo $form->field($model, 'subscription_fee') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
