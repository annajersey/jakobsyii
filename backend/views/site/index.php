<?php
use yii\helpers\Html;
use  yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>Superadmin Panel</h1>

       <!-- <p class="lead">You have successfully created your Yii-powered application.</p> -->
        <p><?php echo Html::a('Companies Info', ['/companyinfo/index'], ['class' => 'btn btn-success',]); ?></p>
        <p><?php echo Html::a('Login As Admin', ['/companies/loginas'], ['class' => 'btn btn-success',]); ?></p>
        <p><?php echo Html::a('Alerting System', ['/companies/notify'], ['class' => 'btn btn-success',]); ?></p>
        <p><?php echo Html::a('Manage Notifications', ['/notifications/index'], ['class' => 'btn btn-success',]); ?></p>
        <p><?php echo Html::a('Invoicing System', ['/invoice/index'], ['class' => 'btn btn-success',]); ?></p>
        <p><?php echo Html::a('Products', ['/product/index'], ['class' => 'btn btn-success',]); ?></p>
        <p><?php echo Html::a('Taxes', ['/tax/index'], ['class' => 'btn btn-success',]); ?></p>
        <p><?php echo Html::a('Create New Company', ['/companies/create'], ['class' => 'btn btn-success',]); ?></p>
    </div>

    <!--<div class="body-content">

        <div class="row">
            <div class="col-lg-4">
                <h2>Heading</h2>

                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.</p>

                <p><a class="btn btn-default" href="http://www.yiiframework.com/doc/">Yii Documentation &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Heading</h2>

                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.</p>

                <p><a class="btn btn-default" href="http://www.yiiframework.com/forum/">Yii Forum &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Heading</h2>

                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.</p>

                <p><a class="btn btn-default" href="http://www.yiiframework.com/extensions/">Yii Extensions &raquo;</a></p>
            </div>
        </div>

    </div>-->
</div>
