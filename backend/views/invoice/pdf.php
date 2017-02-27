<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $model backend\models\Invoice */

$this->title = 'Invoice #'.$model->number;
$this->params['breadcrumbs'][] = ['label' => 'Invoices', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="invoice-view">

   
        <table>
            <tr class="dark"><td><img width="150" src="<?= Url::to(Yii::$app->urlManager->createUrl(Yii::$app->params['logo'])) ?>"></td></tr>
            <tr><td><?= 'Invoice #'.$model->number; ?></td></tr>
        </table>
        <table>
           <?php foreach(Yii::$app->params['CompanyInfo'] as $key=>$info) {?>
                <tr><td width=50% class="gray"><?php echo $key; ?></td><td><?php echo $info; ?></td></tr>
           <?php } ?>
        </table>
        <br>
        
        <table>
            <tr class="dark"><td>Receiving Company</td> </tr>
            <tr><td width=50% class="gray">Name</td><td><?= $company['Name'] ?></td> </tr>
            <tr><td class="gray">Address</td><td><?= $company['Address_visit'] ?></td></tr>
            <tr><td class="gray">Zip</td><td><?= $company['Zip_visit'] ?></td></tr>
            <tr><td class="gray">Place</td><td><?= $company['Place_visit'] ?></td></tr>
            <tr><td class="gray">Contact Email</td><td><?= $company['Notify_email'] ?></td></tr>
        </table>
        <br>
	<table>
            <tr class="dark"><td>Invoice Info</td></tr>
		<tr><td width=50% class="gray">Amount</td><td><?= Yii::$app->formatter->asCurrency($model->amount); ?></td></tr>
		<tr><td class="gray">Created Date</td><td><?= date('Y-m-d', strtotime($model->created_time)) ?></td></tr>             
                <tr><td class="gray">Due Date</td><td>
                <?= date('Y-m-d', strtotime($model->duedate_time)) ?></td></tr>
		<tr><td class="gray">Invoice Email</td><td><?= $model->email ?></td></tr>
		<tr><td class="gray">Invoice Sent</td><td><?= date('Y-m-d'); ?></td></tr>
		<tr><td class="gray">Description</td><td><?= $model->description ?></td></tr>
	</table>
        <br>
        Products
        <table>
            <tr class="dark"><td>Name</td><td>Net Price</td><td>Tax</td><td>Tax Amount</td><td>Price</td><tr>
        <?php 
        $nettotal = 0;
        $total = 0;
        foreach($productsDataProvider->models as $product){?>
          <tr>
               <td><?= $product->name ?></td>
               <td><?= Yii::$app->formatter->asCurrency($product->price); ?></td>
               <td><?= $product->tax->percent ?>%</td>
               <td><?=  Yii::$app->formatter->asCurrency($product->taxvalue); ?></td>
               <td><?= Yii::$app->formatter->asCurrency($product->fullprice); ?></td>
               
           <tr>  
        <?php 
        $nettotal+=$product->price;
        $total += $product->fullprice;
        } ?>
        </table>
        <br>
       <table>
           <tr class="dark"><td colspan="3">Totals</td></tr>
           <tr class="gray"><td width="20%">Tax</td><td>Tax Percent</td><td>Total Price For Tax Group</td></tr>
        <?php foreach($taxgroups as $taxgroup){ ?>
         <tr>
        <td><?php echo $taxgroup['tax']->name; ?></td>
        <td><?php echo $taxgroup['tax']->percent; ?>% </td>
        <td width="30%"><?= Yii::$app->formatter->asCurrency($taxgroup['total']); ?></td>
        <tr> 
        <?php } ?>
        </table>
        <br>
        <table>
            <tr><td class="gray">Net Price Total</td><td width="30%"><?= Yii::$app->formatter->asCurrency($nettotal); ?></td></tr>
            <tr><td class="gray">Total</td><td><?= Yii::$app->formatter->asCurrency($total); ?></td></tr>
        </table>
    
        
</div>

<style>
table{font-size:11px;}   
.dark{background:#6A6C6F; color:#ffffff;}
.dark td{color:#ffffff;}
table{border-collapse:collapse; width:100%}
.gray{background: #f9f9f9;}
table th, table td {
    border: 1px solid #ddd;
	line-height: 15px;;
    padding: 3px;
    vertical-align: top;
	text-align: left;
}
</style>
