<?php
class config {

    private $host = 'localhost';
    private $dbname = 'test';
    private $username = 'root';
    private $password = '';
    private $conn;

    public function connect()
    {
        $this->conn = null;
    
        try
        {
            $this->conn = new PDO('mysql:host='. $this->host .';dbname='. $this->dbname ,
            $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //echo "Connection Successfull";
        }
        catch(PDOException $e)
        {
            echo 'Connection error: '.$e->getMessage();
        }
        return $this->conn;
    }
}

?>