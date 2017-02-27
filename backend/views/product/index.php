<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\models\Tax;
use yii\helpers\ArrayHelper;
use  yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\ProductSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
$this->params['breadcrumbs'][] = $this->title;
?>
<?=Html::beginForm(['invoice/create'],'post');?>

<div class="product-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <div class="row">
		<div class="col-md-12">
		<?= Html::a('Create Product', ['create'], ['class' => 'f-left btn btn-success']) ?>
                <?= Html::SubmitButton('Create Invoice', ['class' => 'f-right btn btn-info','onclick'=>'if(!$(".table input[type=checkbox]:checked").length) {alert("Select Products"); return false}']);?>
		</div>
</div>
    <br>
    <?= Html::a('Create Product Based On Company Fee', ['create-fee'], ['class' => 'btn btn-success']) ?>
    <br><br>
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
            'name',
            ['format' => 'Currency','attribute' => 'price'],
            ['attribute'=>'tax_id',
             'format' => 'raw',
             'filter'=>
              Html::activeDropDownList($searchModel,'tax_id',ArrayHelper::map(Tax::find()->all(),'id','name'),
              ['class'=>"form-control",'prompt'=>'Select']),
              'value'=> function($data){
                 return $data['tax_id'] ? $data['taxstring'] : '<span class="gray">removed tax</span>';
              }
            ],
               
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
<?= Html::endForm();?> 
