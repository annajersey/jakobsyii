<?php
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = 'New Company';
$this->params['breadcrumbs'][] = ['label' => 'Companies', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
    <h1><?= Html::encode($this->title) ?></h1>
	<?= Html::a('Login to new company panel    <span class="glyphicon glyphicon-log-in"></span>', Url::to(\Yii::$app->params['panelUrl'].'/action/loginas.php', true),
	[
			'class' => '',
			'target'=>'_blank',
			'data' => [
				'method' => 'post',
				'params' => [
				'key'=>$key,
				 ]
			],
	]
	); 
	?>
	
	

