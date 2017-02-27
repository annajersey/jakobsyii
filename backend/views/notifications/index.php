<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\models\Companyinfo;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\NotificationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Notifications';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="notification-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    
    <?=Html::beginForm(['notifications/bulkdelete'],'post');?>
    <div class="row">
	<div class="col-md-12">
            <?= Html::SubmitButton('Delete Selected', ['class' => 'f-right btn btn-info','data-confirm'=>'Remove selected notifications?']);?>
         </div>   
    </div>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],
            ['class' => 'yii\grid\CheckboxColumn',
            'checkboxOptions' => function($model) {
                    return ["value" => $model['id']];
            },],   
            'id',
            
            [
                'attribute'=>'companyinfo.companyname',
                'filter'=>Html::activeDropDownList($searchModel,'company',ArrayHelper::map(Companyinfo::find()->all(),'id','companyname'),['class'=>"form-control",'prompt'=>'Any Company']),
            ],
			[
				'attribute' => 'message',
				'contentOptions' => ['style' => 'white-space:normal;'],
			],
            
            'from',
            'to',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?= Html::endForm();?> 
</div>
