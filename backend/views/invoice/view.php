<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;
use  yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $model backend\models\Invoice */

$this->title = 'Invoice #'.$model->number;
$this->params['breadcrumbs'][] = ['label' => 'Invoices', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="invoice-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?php $sendLable = $model->status==1 ? 'Send' : 'Send Again';?>
        <?= Html::a($sendLable, ['send', 'id' => $model->id], [
            'class' => 'btn btn-success',
            'data' => [
                'confirm' => 'Are you sure you want send email?',
                'method' => 'post',
            ],
        ]) ?>
		<?php //Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
         <?php if($model->status!=3) echo Html::a(' Mark as Paid ', ['paid', 'id' => $model->id], [
            'class' => 'btn btn-info',
            'data' => [
                'confirm' => 'Are you sure you want to mark invoice as paid?',
                'method' => 'post',
            ],
        ]) ?>
                
           <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
		
    </p>
    <p>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'companyinfo.companyname',
            ['attribute' => 'amount','format' => ['currency']],
            'created_time',
            'duedate_time',
            'number',
            'statusstring',
            'email:email',
	    'description'
        ],
    ]) ?>
    </p>
    <br>
    <h4>Receiving Company:</h4>
    <table class="table table-striped table-bordered detail-view">
           <tr><th>Name</th><td><?= $company['Name'] ?></td> </tr>
           <tr><th>Address</th><td><?= $company['Address_visit'] ?></td></tr>
           <tr><th>Zip</th><td><?= $company['Zip_visit'] ?></td></tr>
           <tr><th>Place</th><td><?= $company['Place_visit'] ?></td></tr>
           <tr><th>Contact Email</th><td><?= $company['Notify_email'] ?></td></tr>
     </table>
    <br>
    <h4>Selected Products:</h4>
   
    <?php $productsDataProvider->sort = false; ?>
    <?php $productsDataProvider->pagination = false; ?>
         <?= GridView::widget([
             
        'dataProvider' => $productsDataProvider,
        'columns' => [
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
    
    <div>
         <h4>Totals:</h4>
        <?php 
        $nettotal = 0;
        $total = 0;
        foreach($productsDataProvider->models as $product){
            $nettotal+=$product->price;
            $total += $product->fullprice;
        }
        ?>
       
       <table class="table table-striped table-bordered detail-view">
           <tr><th>Tax</th><th>Tax Percent</th><th>Total Price For Tax Group</th></tr>
        <?php foreach($taxgroups as $taxgroup){ ?>
         <tr>
        <td><?php echo $taxgroup['tax']->name; ?></td>
        <td><?php echo $taxgroup['tax']->percent; ?>% </td>
        <td><?= Yii::$app->formatter->asCurrency($taxgroup['total']); ?></td>
        <tr> 
        <?php } ?>
        </table>
        <br>
        <table class="table table-striped table-bordered detail-view">
            <tr><th>Net Price Total</th><td><?= Yii::$app->formatter->asCurrency($nettotal); ?></td></tr>
            <tr><th>Total</th><td><?= Yii::$app->formatter->asCurrency($total); ?></td></tr>
        </table>
    </div>
    <p>
    <?php 
   
    if($sendingdataProvider->totalCount > 0){?>
    <h4>Sending History:</h4>
    <?php Pjax::begin(); ?>
     <?= GridView::widget([
        'dataProvider' => $sendingdataProvider,
        'columns' => [
           
            'email:email',
            'date',
        ],
    ]); ?>
    <?php Pjax::end(); ?>
     <?php } ?>
     </p>    
</div>
