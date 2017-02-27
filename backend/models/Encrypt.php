<?php 

namespace backend\models;

use yii\base\Model;


class Encrypt extends Model
{
    public static function encryptpass($pass){ 
            $key = pack('H*', md5('jakobs'));
            $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
            $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
            $ciphertext = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key,$pass, MCRYPT_MODE_CBC, $iv);
            $ciphertext = $iv . $ciphertext;
            $ciphertext_base64 = base64_encode($ciphertext);
            return trim($ciphertext_base64);
    }

    public static function decryptpass($ciphertext_base64){
            $key = pack('H*', md5('jakobs'));
            $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
            $ciphertext_dec = base64_decode($ciphertext_base64);
            $iv_dec = substr($ciphertext_dec, 0, $iv_size);
            $ciphertext_dec = substr($ciphertext_dec, $iv_size);
            $plaintext_dec = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key,$ciphertext_dec, MCRYPT_MODE_CBC, $iv_dec);
            return trim($plaintext_dec);
    }
	
}	
	
	