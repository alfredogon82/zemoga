<?php


class Database{

    public function conn() {

        $dbhost = "localhost";
        $dbname = "zemoga";        
        $dbuser = "root";
        $dbpass = "1q2w3e4r5T";

        if($conn = new PDO("mysql:host=".$dbhost.";dbname=".$dbname, $dbuser, $dbpass,array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'))){
            return($conn);
         }
         else {
            return null;
        }
    }
}

