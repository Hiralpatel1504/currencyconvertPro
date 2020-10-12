<?php

class post
{
    //db stuff
    private $conn;
    private $table = 'rates';

    //post properties
    public $id;
    public $from_curr;
    public $to_curr;
    public $timestamp_created;
    public $timestamp_data;
    public $amount;
    public $source_id;
    
    //constructor with db connection

    public function __construct($db){
        $this->conn = $db;
    }
    
    public function read()
    {
        $fromcurr = $_GET['fromcurr'];
        $tocurr = $_GET['tocurr'];
        //echo "tocurr".$tocurr;
        # create query
        /*$query = 'SELECT
            id,
            from_curr,
            to_curr,
            timestamp_created,
            timestamp_data,
            amount,
            source_id
            FROM
            ' . $this->table;*/
        $query ="select * from ".$this->table." where to_curr='$tocurr'";
        //prepare statement
        $stmt = $this->conn->prepare($query);
        
        //execute query
        $stmt->execute();
        
        return $stmt;
    }
    public function convert($query)
    {
        $fromcurr = $_GET['fromcurr'];
        $tocurr = $_GET['tocurr'];
        
        $this->query = $query;
        //$query ="select * from ".$this->table." where to_curr='$fromcurr'";
        //prepare statement
        $stmt = $this->conn->prepare($query);
        
        //execute query
        $stmt->execute();
        
        return $stmt;
        
    }
}
?>