<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Companyinfo;
use yii\helpers\ArrayHelper;
use kartik\datetime\DateTimePicker;
use yii\jui\DatePicker;
/* @var $this yii\web\View */
/* @var $model backend\models\InvoiceSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="invoice-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'company')->dropDownList(ArrayHelper::map(Companyinfo::find()->all(),'id','companyname'),['prompt'=>'Any Company']) ?>

   
<?= $form->field($model, 'created_time')->widget(\yii\jui\DatePicker::classname(), [
    'options' => ['class' => 'form-control'],
    'dateFormat' => 'yyyy-MM-dd',
]) ?>
    
    <?= $form->field($model, 'duedate_time')->widget(\yii\jui\DatePicker::classname(), [
    'options' => ['class' => 'form-control'],
    'dateFormat' => 'yyyy-MM-dd',
]) ?>


    <?php echo $form->field($model, 'number') ?>

    <?= $form->field($model, 'status')->dropDownList([''=>'Any Status','1'=>'New','2'=>'Sent','3'=>'Paid']); ?>


    <?php echo $form->field($model, 'email') ?>
    <?= $form->field($model, 'description') ?>
    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
