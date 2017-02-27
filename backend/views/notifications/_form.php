<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Companyinfo;
use yii\helpers\ArrayHelper;
use kartik\datetime\DateTimePicker;
/* @var $this yii\web\View */
/* @var $model backend\models\Notification */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="notification-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'company')->dropDownList(ArrayHelper::map(Companyinfo::find()->all(),'id','companyname')) ?>

    <?= $form->field($model, 'message')->textarea(['rows' => 6]) ?>

    
   
    <?=  $form->field($model, 'from')->widget(DateTimePicker::classname(), [
		'options' => ['placeholder' => 'Select Due Date'],
		'convertFormat' => true,
		'pluginOptions' => [
			'autoclose' => true,
			'format' => 'yyyy-MM-dd H:i',
			'todayHighlight' => true,
			'autoclose' => true,
			
		]
	]);	
     ?>	

    <?=  $form->field($model, 'to')->widget(DateTimePicker::classname(), [
		'options' => ['placeholder' => 'Select Due Date'],
		'convertFormat' => true,
		'pluginOptions' => [
			'autoclose' => true,
			'format' => 'yyyy-MM-dd H:i',
			'todayHighlight' => true,
			'autoclose' => true,
			
		]
	]);	
     ?>	

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
