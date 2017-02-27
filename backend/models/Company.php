<?php
namespace backend\models;


use Yii;
use yii\base\Model;
use common\models\User;
use backend\models\Companyinfo;
use backend\models\Encrypt;


class Company extends Model
{
    public $fullname;
    public $username;
    public $email;
	
    /**
     * Creates new database with init data received from form
     * @param array $data
     */
    public static function createNew($data){
        $dbname=$data['dbname'];
        $path = (dirname(__DIR__)).'/sql';
        @unlink($path.'/jakobs_dump.sql');
        exec("mysqldump -u ".Yii::$app->params['panelDbUser']." -p".Yii::$app->params['panelDbPassword']." --no-data --skip-add-drop-table ".Yii::$app->params['panelDbName']." > ../sql/jakobs_dump.sql");
        try{
            Yii::$app->db->createCommand('CREATE DATABASE '.$dbname.';')->execute();
        }catch(\yii\db\Exception $e){
                if(strpos($e->getmessage(),'database exists')!==false)
                        Yii::$app->session->setFlash('error', 'Database already exists');
                else
                    Yii::$app->session->setFlash('error', $e->getmessage());
                return false;
        }
		
         $structure_sql = file_get_contents($path.'/jakobs_dump.sql');
         $data_sql = file_get_contents($path.'/data.sql');
        try{
            $newConnection = new \yii\db\Connection([
                    'dsn' => "mysql:host=localhost;dbname=".$dbname,
                    'username' => Yii::$app->db->username,
                    'password' =>  Yii::$app->db->password,
             ]);
        $newConnection->open();
        }catch(\Exception $e){
                Yii::$app->session->setFlash('error', $e->getmessage());
                return false;
        }
	$transaction = $newConnection->beginTransaction();
	try {
            $newConnection->createCommand($structure_sql)->execute();
            $newConnection->createCommand($data_sql)->execute();
            $Orderlistreload  = $data['orderlistreload']>2000 ? intval($data['orderlistreload']) : 2000;
            $Driverstatusreload  = $data['driverstatusreload']>2000 ? intval($data['driverstatusreload'])   : 2000;
            $Activeorderlistreload  = $data['activeorderlistreload']>2000 ? intval($data['activeorderlistreload']) :2000;
            $Drivermessagesreload  = $data['drivermessagesreload']>2000 ? intval($data['drivermessagesreload']) : 2000;
            $Mapreload  = $data['mapreload']>2000 ? intval($data['mapreload']) : 2000;
            $companyinfoquery="INSERT INTO mycompanyinfo SET
            Name = '".$data['name']."',
            Address_visit ='".$data['address_visit']."',
            Zip_visit ='".$data['zip_visit']."',
            Place_visit ='".$data['place_visit']."',
            Country_visit ='".$data['country_visit']."',
            Address_post ='".$data['address_post']."',
            Zip_post ='".$data['zip_post']."',
            Place_post ='".$data['place_post']."', 
            Country_post ='".$data['country_post']."', 
            Orgnr  = '".$data['orgnr']."',
            Bank_account  = '".$data['bank_account']."',
            Phone  = '".$data['phone']."',
            Fax = '".$data['fax']."',
            Email  = '".$data['email']."',
            System_email  = '".$data['system_email']."',
            Notify_email  = '".$data['notify_email']."',
            Receive_email  = '".$data['receive_email']."',
            Web  = '".$data['web']."',
            Base_url  = '".$data['base_url']."',
            Iban  = '".$data['iban']."',
            Swift  = '".$data['swift']."',
            Smtp_server  = '".$data['smtp_server']."',
            Smtp_username  = '".$data['smtp_username']."',
            Smtp_password  = '".$data['smtp_password']."',
            Invoice_export_email = '".$data['invoice_export_email']."',
            Invoice_export_format = '".intval($data['accexportformat'])."',
            Kjoreliste_pdalisens = '".$data['kjoreliste_pdalisens']."',
            Orderlistreload  = '".$Orderlistreload."',
            Driverstatusreload  = '".$Driverstatusreload."', 
            Activeorderlistreload  = '".$Activeorderlistreload."', 
            Drivermessagesreload  = '".$Drivermessagesreload."',
            Mapreload  = '".$Mapreload."',
            Map_lat  = '".$data['map_lat']."',
            Map_lng  = '".$data['map_lng']."',
            Google_key = '".$data['googleapikey']."',
            Stripe_secret_key = '".$data['Stripe_secret_key']."',
            Stripe_publishable_key = '".$data['Stripe_publishable_key']."',
            Cweb_ordertype = '".intval($data['cwebordertype'])."',
            Maxkolliweight = '".intval($data['maxkolliweight'])."',
            text_invoice  = '".$data['text_invoice']."'
            ";
            $newConnection->createCommand($companyinfoquery)->execute();
            $password=password_hash($data['admin_password'], PASSWORD_DEFAULT);
            $admincreatequery = "INSERT INTO `admin` (`Adminid`, `Permission`, `Active`, `Name_first`, `Name_last`, `Titleposition`, `Phone`, `Username`, `Password`, `Email`, `Notes`, `Sellerid`, `Isdispatch`, `Image`, `Avatar`, `Chat_allowed`, `Chat_updatetime`, `Employeegroup`, `Department`, `Aboutme`, `Protected`, `Allow_uploadfiles`, `Allow_deletefiles`, `Failed_login_attempts`, `Passwdupd_time`, `Prev_password`, `Regtime`, `Updatedtime`) VALUES (1, 1, 'Y', 'Admin', 'Admin', '', '12345678', '".$data['admin_username']."', '". $password."','". $data['admin_email']."' , '', 0, 'N', '', '', 'Y', 1480585104, 0, 1, '', 'Y', 'N', 'N', 0, 1480585104, '', 1480585104, 1480585104); INSERT INTO `admin2pages` ( `Adminid`, `Pageid`, `Pagename`) VALUES (1, 1, 'settings'),(1, 2, 'dispatch'),(1, 3, 'print'),(1, 4, 'ordersearch'),(1, 5, 'transportorder_new'),(1, 6, 'transportorder_edit'),(1, 7, 'prices'),(1, 9, 'reports'),(1, 10, 'drivers'),(1, 11, 'users'),(1, 12, 'invoice'),(1, 14, 'myaccount'),(1, 15, 'customer'),(1, 16, 'changelog'),(1, 17, 'order-pricing'),(1, 18, 'orders'),(1, 19, 'generate'),(1, 20, 'testpage'),(1, 21, 'superadmin'); INSERT INTO `admin_prefs` (`ID`, `Adminid`, `Dispatch_todayonly`, `Timeforward`, `Service_types`, `Vehicle_types`, `Orderlisttype`, `Orderlistsortby`, `Gpsactiveonly`, `Pricelistsortby`, `Pricelist_totime`, `Driverlist_activeonly`) VALUES (1, 1, '', 0, '7|6|2|1|8|9|10|11|12|13|', '1|2|3|4|5|6|7|8|9|10|', 1, 'Ts', 'Y', 'Customer', 1451343599, 'N');";
            $newConnection->createCommand($admincreatequery)->execute();
            $transaction->commit();
           
             $loginkey = self::getKey($data['admin_username'].$password.' '.$dbname);
             return $loginkey;
            }catch(\yii\db\Exception $e){
                    $transaction->rollBack();
                    throw $e;
            }
            return false;
	}
        
        /**
         * Find company info by retrieve it form according database
         * @param int $id
         * return array
         */
	public function findOne($id){
            $dbCredential = Companyinfo::findOne($id);
            return self::getByDbname($dbCredential->dbname);
	}
        
        public function driversNum($dbname){
            try{
		$cConnection = new \yii\db\Connection([
                    'dsn' => "mysql:host=".Yii::$app->params['companypanel-dbhost'].";dbname=".$dbname,
                    'username' => Yii::$app->params['companypanel-dbusername'],
                    'password' => Yii::$app->params['companypanel-dbpassword'],
		]);
		$cConnection->open();
            
                $cmd = $cConnection->createCommand("SELECT COUNT(*) as count FROM `drivers` ");
                $row = $cmd->queryOne();
                return $row['count'];
            }catch(\yii\db\Exception $e){
		Yii::$app->session->setFlash('error', $e->getmessage());
            }
            return false;
        }
        
         public function clientsNum($dbname){
            try{
		$cConnection = new \yii\db\Connection([
                    'dsn' => "mysql:host=".Yii::$app->params['companypanel-dbhost'].";dbname=".$dbname,
                    'username' => Yii::$app->params['companypanel-dbusername'],
                    'password' => Yii::$app->params['companypanel-dbpassword'],
		]);
		$cConnection->open();
            
                $cmd = $cConnection->createCommand("SELECT COUNT(*) as count FROM `customer` ");
                $row = $cmd->queryOne();
                return $row['count'];
            }catch(\yii\db\Exception $e){
		Yii::$app->session->setFlash('error', $e->getmessage());
            }
            return false;
        }
        /**
         * Connects to given database and retrieve info from `mycompanyinfo` table
         * @param string $dbname
         * return array
         */
        public static function getByDbname($dbname){
            try{
		$cConnection = new \yii\db\Connection([
                    'dsn' => "mysql:host=".Yii::$app->params['companypanel-dbhost'].";dbname=".$dbname,
                    'username' => Yii::$app->params['companypanel-dbusername'],
                    'password' => Yii::$app->params['companypanel-dbpassword'],
		]);
		$cConnection->open();
            
                $cmd = $cConnection->createCommand("SELECT * FROM mycompanyinfo");
                $row = $cmd->queryOne();
                return $row;
            }catch(\yii\db\Exception $e){
		Yii::$app->session->setFlash('error', $e->getmessage());
            }
            return false;
        }
        
     /**
     * Find all companies info by retrieve it form according databases
     * return array
     */   
    public static function getCompanies(){
        $dbCredentials = Companyinfo::find()->all();
        $companies=array();
        foreach($dbCredentials as $db){
            try{
                $yourConnection = new \yii\db\Connection([
                        'dsn' => "mysql:host=".Yii::$app->params['companypanel-dbhost'].";dbname=".$db->dbname,
                        'username' => Yii::$app->params['companypanel-dbusername'],
                        'password' => Yii::$app->params['companypanel-dbpassword'],
                 ]);

                $yourConnection->open();
                $cmd = $yourConnection->createCommand("SELECT * FROM mycompanyinfo");
                $row = $cmd->queryOne();
            }catch(\yii\db\Exception $e){
                    Yii::$app->session->setFlash('error', $e->getmessage());
                    continue;
            }
            $companies[$db->id]['name']=$row['Name'];
            $companies[$db->id]['address']=$row['Address_visit'];
            $companies[$db->id]['email']=$row['Email'];
            $companies[$db->id]['web']=$row['Web'];
            $companies[$db->id]['id']=$db->id;
            $companies[$db->id]['client_id']=$db->dbname;
        }

        return $companies;
    }
    
    /**
     * Find all admins info by retrieve it form according databases
     * return array
     */ 
    public static function getAdmins(){
	$dbCredentials = Companyinfo::find()->all();
        $admins=array();
        $i=0;
        foreach($dbCredentials as $db){
            try{
                $yourConnection = new \yii\db\Connection([
                        'dsn' => "mysql:host=".Yii::$app->params['companypanel-dbhost'].";dbname=".$db->dbname,
                        'username' => Yii::$app->params['companypanel-dbusername'],
                        'password' => Yii::$app->params['companypanel-dbpassword'],
                ]);
                $yourConnection->open();
                $cmd = $yourConnection->createCommand("SELECT a.Adminid,a.Name_first,a.Password,a.Name_last,a.Username,c.Name,a.Email  from admin a, mycompanyinfo c where Active !='N'");                      
                $result = $cmd->query();
            }catch(\yii\db\Exception $e){
                Yii::$app->session->setFlash('error', $e->getmessage());
                continue;
            }
            foreach($result as $row)
            {	
               $admins[$i]['adminid']=$row['Adminid'];
               $admins[$i]['fullname']=$row['Name_first'].' '.$row['Name_last'];
               $admins[$i]['username']=$row['Username'];
               $admins[$i]['email']=$row['Email'];
               $admins[$i]['companyname']=$row['Name'];
               $admins[$i]['key']=self::getKey($row['Username'].$row['Password'].' '.$db->dbname);
               $i++;
            }
        }
        return $admins;
    }
	
    /**
     * encrypts string
     * @param string $str
     * return string
     */ 
    public static function getKey($str){
         return Encrypt::encryptpass($str);
    }
        
       
    
}
