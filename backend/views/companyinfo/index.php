<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CompanyinfoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Companies Info';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="companyinfo-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php //echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Add New Company Info', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'id',
            'companyname',
            'dbname',
            ['format' => 'Currency','attribute' => 'driver_fee'],   
            ['format' => 'Currency','attribute' => 'client_fee'],   
            ['format' => 'Currency','attribute' => 'subscription_fee'],   
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
