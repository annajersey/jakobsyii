<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Companyinfo */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Companies info', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="companyinfo-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'companyname',
            'dbname',
            ['attribute' => 'driver_fee','format' => ['currency']],
             ['attribute' => 'client_fee','format' => ['currency']],
             ['attribute' => 'subscription_fee','format' => ['currency']],
        ],
    ]) ?>

</div>
