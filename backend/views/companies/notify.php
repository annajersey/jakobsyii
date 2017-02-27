<?php

use yii\helpers\Html;
use yii\grid\GridView;
use  yii\helpers\Url;
use kartik\datetime\DateTimePicker;
/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Notify companies';
$this->params['breadcrumbs'][] = $this->title;
?>
<p><?php echo Html::a('Manage Notifications', ['/notifications/index'], ['class' => 'btn f-right btn-success',]); ?></p>
<div>

    <h1><?= Html::encode($this->title) ?></h1>

    <?=Html::beginForm(['companies/makenotify'],'post');?>
	
   <?php //Html::dropDownList('action','',[''=>'Mark selected as: ','c'=>'Confirmed','nc'=>'No Confirmed'],['class'=>'dropdown',])?>
   
  
   <div class="clearfix">
    <div class="col-md-7">
        <div class="form-group required">
             <?= Html::label( 'Subject', 'subject',   ['class'=>'control-label'] ); ?>
             <?= Html::input( 'text', 'subject', '', ['class'=>'form-control','required'=>''] ); ?>
        </div>
        <div class="form-group required">
             <?= Html::label( 'Message', 'message',  ['class'=>'control-label'] ); ?>
             <?= Html::textarea( 'message', '',   ['class'=>'form-control','required'=>''] ); ?>
        </div>
        <div class="form-group required">
        <?= Html::checkbox ( 'by_email', false,  ['value'=>'1'] ); ?>
        <?= Html::label( 'Send By Email', 'by_email' ); ?>
        <br>
        <?= Html::checkbox ( 'by_notify', false,  ['value'=>'1','onclick'=>'$(".ifchecked").slideToggle()','autocomplete'=>'off'] ); ?>
        <?= Html::label( 'Show as Notification in Admin Panels', 'by_notify' ); ?>
        </div>
        <div class="ifchecked">
        <div class="form-group">
              <?php  
                     echo DateTimePicker::widget([
                             'name' => 'from',
                             'options' => ['placeholder' => 'From','value'=>date('Y-m-d H:i',time())],
                             'convertFormat' => true,
                             'pluginOptions' => [
                                     'format' => 'yyyy-MM-dd H:i',
                                     'todayHighlight' => true,
                                     'autoclose' => true,
                             ]
                     ]);
             ?>
             </div>		
             <div class="form-group">
             <?php  
                             echo DateTimePicker::widget([
                                     'name' => 'to',
                                     'options' => ['placeholder' => 'To'],
                                     'convertFormat' => true,
                                     'pluginOptions' => [
                                             'format' => 'yyyy-MM-dd H:i',
                                             'todayHighlight' => true,
                                             'autoclose' => true,
                                             'startDate'=> date('Y-m-d H:i',time())
                                     ]
                             ]);
             ?>	
             </div>
             </div>
    </div>
   </div><br>
   <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\CheckboxColumn',
			'checkboxOptions' => function($model) {
				return ["value" => $model['id']];
			},],
			'name', 'client_id','address','email','web'
          

           
        ],
    ]); ?>
	 <?=Html::submitButton('Send', ['class' => 'btn btn-info','onclick'=>'if(!$(".table input[type=checkbox]:checked").length) {alert("Select Companies"); return false}']);?>
	<?= Html::endForm();?> 
	
</div>