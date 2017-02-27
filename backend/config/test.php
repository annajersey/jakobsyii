<?php

$config =  yii\helpers\ArrayHelper::merge(
    require(__DIR__ . '/main.php'),
    require(__DIR__ . '/main-local.php'),
    [
        'id' => 'app-backend-tests',
        'components' => [
            'db' => [
                'dsn' => 'mysql:host=localhost;dbname=jakobs_yii',
            ]
        ]        
    ]
);
return $config;