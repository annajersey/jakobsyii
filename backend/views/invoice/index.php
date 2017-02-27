<?php

use yii\helpers\Html;
use yii\grid\GridView;
use  yii\widgets\Pjax;
use yii\helpers\ArrayHelper;
use backend\models\Companyinfo;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\InvoiceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Invoices';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="invoice-index">

    <h1><?= Html::encode($this->title) ?></h1>
    
   <?=Html::beginForm(['invoice/bulk'],'post');?>

	<div class="row">
		<div class="col-md-12">
		<?php // Html::a('Create Invoice', ['create'], ['class' => 'f-left btn btn-success']) ?>
                <?= Html::submitInput('Mark as Paid', ['name'=>'action_paid','class' => 'f-left btn btn-info','onclick'=>'if(!confirm("Mark selected as Paid?")) return false']);?>
		<?= Html::submitInput('Send Selected', ['name'=>'action_send','class' => 'f-right btn btn-info','onclick'=>'if(!confirm("Send Selected?")) return false']);?>
		</div>
	</div>
	<br>
    <?php Pjax::begin(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\CheckboxColumn',
            'checkboxOptions' => function($model) {
                    return ["value" => $model['id']];
            },],
            'id',
            ['attribute'=>'companyinfo.companyname',
              'format' => 'raw',
             'filter'=>Html::activeDropDownList($searchModel,'company',ArrayHelper::map(Companyinfo::find()->all(),'id','companyname'),['class'=>"form-control",'prompt'=>'Any Company']),
              'value'=> function($data){
                 return $data['company'] ? $data['companyinfo']['companyname'] : '<span class="gray">removed company</span>';
              }
            ],
            [
            'format' => 'Currency',
            'attribute' => 'amount',
            ], 
            'created_time',
            'duedate_time',
            'number',
            ['attribute' => 'statusstring',
	    'format' => 'raw',
            'filter'=>Html::activeDropDownList($searchModel,'status',[''=>'Any Status','1'=>'New','2'=>'Sent','3'=>'Paid'],['class'=>"form-control"]),
            'value' => function($data, $key, $index, $column) {
                   switch ($data['status']) {
                           case 1: $class="label-success";break;
                           case 2: $class="label-warning";break;
                           case 3: $class="label-info";break;
                           default:$class="label-default";break;
                   }
                    return '<span class="label '.$class.'">'.$data['statusstring'].'</span>';
             }
			],
            'email:email',
            'description',
            ['class' => 'yii\grid\ActionColumn','header' => 'Actions',
             'template' => '{view} {delete}',

            ],
        ],
    ]); ?>
	<?php Pjax::end(); ?>
	<?= Html::endForm();?> 
        <!--<h3>Search Invoices:</h3>-->
        <?php //echo $this->render('_search', ['model' => $searchModel]); ?>
</div>
