<?php
use \yii\web\Request;
$baseUrl = str_replace('/backend/web', '', (new Request)->getBaseUrl());
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
		'urlManager' => [
			'baseUrl' => $baseUrl,
			'class' => 'yii\web\UrlManager',
			// Disable index.php
			'showScriptName' => false,
			// Disable r= routes
			'enablePrettyUrl' => true,
			'rules' => array(
					'<controller:\w+>/<id:\d+>' => '<controller>/view',
					'<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
					'<controller:\w+>/<action:\w+>' => '<controller>/<action>',
			),
        ],
		// 'mail' => [
			// 'class' => 'yii\swiftmailer\Mailer',
			// 'viewPath' => '@backend/mail',
			// 'useFileTransport' => false,
			// 'transport' => [
				// 'class' => 'Swift_SmtpTransport',
				// 'host' => 'smtp.gmail.com',
				// 'username' => 'lbitestme@gmail.com',
				// 'password' => '111111a',
				// 'port' => '587',
				// 'encryption' => 'tls'
				
			// ],
		// ],
		 'mail2' => [
            'class'            => 'zyx\phpmailer\Mailer',
            'viewPath'         => '@common/mail',
            'useFileTransport' => false,
			'config'           => [
                'mailer'     => 'mail',
            ],
        ],
		'formatter' => [
			//'locale'=>'nb_NO',
			'class' => 'yii\i18n\Formatter',
			'dateFormat' => 'yyyy.MM.dd',
			'decimalSeparator' => ',',
			'thousandSeparator' => '.',
			'currencyCode' => 'EUR', //'USD'
			'nullDisplay' => '',          
		],
	
		
    ],
	
];
