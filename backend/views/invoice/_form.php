<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Companyinfo;
use backend\models\Products;
use backend\models\Tax;
use yii\helpers\ArrayHelper;
use kartik\datetime\DateTimePicker;
use  yii\widgets\Pjax;
use yii\grid\GridView;
/* @var $this yii\web\View */
/* @var $model backend\models\Invoice */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="invoice-form">

    <?php $form = ActiveForm::begin(); ?>
    
    <?= $form->field($model, 'company')->dropDownList(ArrayHelper::map(Companyinfo::find()->all(),'id','companyname')) ?>

    <?php //$form->field($model, 'amount')->textInput() ?>
    <?php $due_value = $model->isNewRecord ? date('Y-m-d H:i',time()+86400) : $model->duedate_time; ?>
    <?=  $form->field($model, 'duedate_time')->widget(DateTimePicker::classname(), [
		'options' => ['placeholder' => 'Select Due Date','value'=>$due_value],
		'convertFormat' => true,
		'pluginOptions' => [
			'autoclose' => true,
			'format' => 'yyyy-MM-dd H:i',
			'todayHighlight' => true,
			'autoclose' => true,
			
		]
	]);	?>	

    <?php // $form->field($model, 'status')->dropDownList(['1'=>'New','2'=>'Sent','3'=>'Paid']); ?>
    <?= $form->field($model, 'status')->hiddenInput(['value'=> 1])->label(false); ?>
	
    <? if(!$model->isNewRecord) echo  $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'description')->textInput() ?>
     
    
    <label class="control-label">Selected Products:</label>
    <?php $productsDataProvider->sort = false; ?>
    <?php $productsDataProvider->pagination = false; ?>
   
         <?= GridView::widget([
         'id'=>'invoice-products',
        'dataProvider' => $productsDataProvider,
        'columns' => [
            
            ['class' => 'yii\grid\CheckboxColumn',
             'headerOptions' => ['class'=>'hidden'],
             'contentOptions' => ['class' => 'hidden'],   
            'checkboxOptions' => function($model) {
                    return ["value" => $model['id'],"checked"=>true];
            },],
            'id',
            'name',
            ['format' => 'Currency','attribute' => 'price'],
            ['attribute'=>'tax_id',
             'format' => 'raw',
             
              'value'=> function($data){
                 return $data['tax']['name'].' ('.$data['tax']['percent'].'%)';
              }
            ],
               ['format' => 'Currency','attribute' => 'taxvalue'],       
            ['format' => 'Currency','attribute' => 'fullprice'],  
          
               
            
        ],
    ]); ?>
    
  
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
