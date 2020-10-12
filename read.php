<?php

$fromcurr = $_GET['fromcurr'];
$tocurr = $_GET['tocurr'];
$amount = $_GET['amount'];

$req_method = $_SERVER["REQUEST_METHOD"];
//echo "request_method ".$req_method."   ";
//echo "fromcurr, tocurr and amount: ".$fromcurr ." ". $tocurr ." ". $amount ;

//headers
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json');

//initializing our api
include_once('../core/post.php');
include_once('../includes/config.php');

//initializing Db and connect
$database = new config();
$db = $database->connect();

//initialize post
$post = new post($db);

switch($req_method)
{
    case 'GET':
        //Case 1: currency/eur/usd..................................................
        //blog post query

        $query ="select * from rates where to_curr='$tocurr' AND timestamp_data=(select MAX(timestamp_data) from rates)";
        $result = $post->convert($query);
        //get the row count
        $num = $result->rowCount();

        if($num>0 && $fromcurr=="eur" && $tocurr=="usd"){
            $post_arr = array();
            $post_arr['data']= array();
            $amount_to_convert = $_GET['amount'];
            
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
                extract($row);
                $post_item = array(
                    //'id' => $id,
                    //'from_curr' => $from_curr,
                    //'to_curr' => $to_curr,
                    //'timestamp_created' => $timestamp_created,
                    'timestamp_data' => $timestamp_data,
                    'amount' => $amount
                    //'source_id' => $source_id
                );
 
                $eur_amount = $row['amount'];
                echo "  euro amount is: ".$eur_amount;

                //conversion to get 1 EUR value...
                $tocurr_amount = $amount_to_convert * $eur_amount;
                echo "  To currency value: ".$tocurr_amount;

                array_push($post_arr['data'],$post_item);
            }
            echo " The value of ".$amount_to_convert. " " . $fromcurr . " in " . $tocurr . " is = " . $tocurr_amount; 
            //convert to json and output
            print json_encode($post_arr,JSON_PRETTY_PRINT);
        }
        else{
            echo json_encode(
                array('message'=> 'no post found')
            );
        }      

        //Case 4: currency/aoa/usd/3000.44/date=yyyymmdd.....................................
        //blog post query

        $query = "select * from rates where to_curr='$fromcurr' AND timestamp_data=(select MAX(timestamp_data) from rates)";
        $result = $post->convert($query);
        //get the row count
        $num = $result->rowCount();
        if($num>0 && $fromcurr=="aoa" && $tocurr=="usd"){
            $post_arr = array();
            $post_arr['data']= array();
            $value_to_convert = $_GET['amount'];
        
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
                extract($row);
                $post_item = array(
                    'timestamp_data' => $timestamp_data,
                    'amount' => $amount
                );
 
                $aoa_amount = $row['amount'];
                echo "  aoa amount is:".$aoa_amount;
                array_push($post_arr['data'],$post_item);
            }
            
            $query = "select * from rates where to_curr='$tocurr' AND timestamp_data=(select MAX(timestamp_data) from rates)";
            $result = $post->convert($query);    
            
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
                extract($row);
                $post_item = array(
                    'timestamp_data' => $timestamp_data,
                    'amount' => $amount
                );
 
                $to_amount = $row['amount'];
                echo "  To currency value:".$to_amount;
                array_push($post_arr['data'],$post_item);
            }
            print json_encode($post_arr,JSON_PRETTY_PRINT);

            echo " The value of ".$value_to_convert. " " . $fromcurr . " in " . $tocurr . " is = " .($value_to_convert * $to_amount / $aoa_amount);
        }
        else{
            echo json_encode(
                array('message'=> 'no post found')
            );            
        }

        //Case 3: currency/usd/aoa?date=yyyymmdd..................................................
        //blog post query

        $today = date('Y-m-d'); //or I can use CURDATE() function...
        $query = "select * from rates where to_curr='$fromcurr' AND DATE(timestamp_data)='$today'";
        $result = $post->convert($query);
        //get the row count
        $num = $result->rowCount();
        if($num>0 && $fromcurr=="usd" && $tocurr=="aoa"){
            $post_arr = array();
            $post_arr['data']= array();
            $value_to_conv = $_GET['amount'];
        
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
                extract($row);
                $post_item = array(
                    'timestamp_data' => $timestamp_data,
                    'amount' => $amount
                );
 
                $usd_amount = $row['amount'];
                echo "  usd amount is:".$usd_amount;
                array_push($post_arr['data'],$post_item);
            }
            
            $query = "select * from rates where to_curr='$tocurr' AND timestamp_data=(select MAX(timestamp_data) from rates)";
            $result = $post->convert($query);    
            
            while($row = $result->fetch(PDO::FETCH_ASSOC)){
                extract($row);
                $post_item = array(
                    'timestamp_data' => $timestamp_data,
                    'amount' => $amount
                );
 
                $to_amount = $row['amount'];
                echo "  To currency value:".$to_amount;
                array_push($post_arr['data'],$post_item);
            }
            print json_encode($post_arr,JSON_PRETTY_PRINT);

            echo " The value of ".$value_to_conv. " " . $fromcurr . " in " . $tocurr . " is = " .($value_to_conv * $to_amount / $usd_amount);
        }
        else{
            echo json_encode(
                array('message'=> 'no post found')
            );            
        }
}

?>