<?php

namespace console\controllers;

use yii\console\Controller;
use backend\models\Invoice;
use backend\models\Product;
use backend\models\Companyinfo;
use backend\models\Tax;
/**
 * Invoice controller
 */
class InvoiceController extends Controller {

    public function actionIndex($fee=0,$tax_id=0) {
		if(empty($fee)){ 
                    die('Specify fee type for invoices.'. PHP_EOL 
                        .'1 - driver based fee'
                        . PHP_EOL .'2 - client based fee.'
                        . PHP_EOL .'3 - subscription fee');
                }
                if(empty($tax_id)){ 
                    $taxes = Tax::find()->all();
                    echo('Specify TAX ID:'. PHP_EOL);
                    foreach($taxes as $tax){
                        echo $tax->name.'('.$tax->percent.'%) - '.$tax->id. PHP_EOL;
                    }
                    die();
                }
                
		$companies = Companyinfo::find()->all();
		foreach($companies as $company){
                    $product = new Product(['scenario' => 'create-fee']);
                    $product->company_id=$company->id;
                    $product->tax_id=$tax_id;
                    $product->fee=$fee;
                    $product->save();
                    
                    $invoice = new Invoice();
                    $invoice->company=$company->id;
                    $invoice->product_ids=[$product->id];
                    switch($fee){
                        case 1: $invoice->description='Driver fee'; break;
                        case 2: $invoice->description='Client Fee'; break;
                        case 3: $invoice->description='Subscription Fee'; break;
                        default: die('wrong fee type');
                    }
                    $invoice->duedate_time=date('Y-m-d H:i',time()+86400);
                    $invoice->created_time=date('Y-m-d H:i',time());
                    $invoice->status=1;
                  
                    try{
                        $invoice->save(false);
                     }
                     catch(\Exception $e){
                            echo $e->getmessage().PHP_EOL; continue;
                    }
                    $e = 'Genegare invoice #'.$invoice->number.' ('.$invoice->description.') for company '.$company->companyname. PHP_EOL;

                    file_put_contents('cron.log', $e, FILE_APPEND);

		}
    }



}
