<?php

use yii\helpers\Html;
use yii\grid\GridView;
use  yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Login as companies admins';
$this->params['breadcrumbs'][] = $this->title;
?>
<div>

    <h1><?= Html::encode($this->title) ?></h1>

    
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
           
			//['value' => function ($data) {return $data['adminid'];},'label'=>'ID'],
            'adminid',
	    'fullname', 
	    'username',
	    'companyname',
	    'email',
            [
                'format' => 'raw',
                'value' => function($data, $key, $index, $column) {
                        return Html::a(
						'<span class="glyphicon glyphicon-log-in"></span>', 
						Url::to(\Yii::$app->params['panelUrl'].'/action/loginas.php', true), 
						[
						'class' => '',
						'target'=>'_blank',
						'data' => [
							'method' => 'post',
							'params' => [
								'key'=>$data['key'],
								
							]
						],
						]);
                }
            ],

           
        ],
    ]); ?>
</div>