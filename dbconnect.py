import requests
import json
import configparser
import mysql.connector
import fixerio
from datetime import datetime
from mysql.connector import Error

class dbConnect:
    def __init__(self):
        #####################################################################
        #instantiate
        config = configparser.ConfigParser()
        #parse existing file
        config.read('config.ini')

        #read values from a section DATABASE
        self.db_user = config.get('DATABASE','DB_USER')
        self.db_pass = config.get('DATABASE','DB_PASS')
        self.db_name = config.get('DATABASE','DB_NAME')
        self.db_port = config.get('DATABASE','DB_PORT')
        self.db_host = config.get('DATABASE','DB_HOST')

        #read values from a section DATABASE
        self.fixer_api_key = config.get('FIXER','FIXER_IO_API_KEY')
        self.fixer_api_pass = config.get('FIXER','FIXER_IO_API_PASS')
        self.fixer_base_url = config.get('FIXER','FIXER_IO_BASE_URL')
        self.fixer_endpoint = config.get('FIXER','FIXER_IO_ENDPOINT')

        #read values from a section DATABASE
        self.db_val_user = config.get('DATABASE_VALIDATION','DB_VAL_USER')
        self.db_val_pass = config.get('DATABASE_VALIDATION','DB_VAL_PASS')
        
        #display result
#        print("This is database connect file")
#        print(self.db_user,self.db_pass,self.db_name,self.db_port,self.db_host)
#        print(self.fixer_api_key,self.fixer_api_pass,self.fixer_base_url,self.fixer_endpoint)
        #####################################################################

    def connect_db(self):
        connection = None
        try:
            connection = mysql.connector.connect(
                host = self.db_host,
                user = self.db_user,
                passwd = self.db_pass,
                database = self.db_name 
            )
            print("connection successful")
        except Error as e:
            print("The error {e} occurred",e)
        
        return connection

    def db_get_config(self):
        self.connection = mysql.connector.connect(host= self.db_host,
                                                  user= self.db_user,
                                                  passwd= self.db_pass,
                                                  db= self.db_name)

        self.cursor2 = self.connection.cursor(buffered=True)
        self.cursor = self.connection.cursor(buffered=True)
        return self.cursor,self.cursor2
    
    def db_store_data(self):
        
        try:
            self.db_update_data()

            query = "select curr_id from curr_list"
            dbConnect.db_get_config(self)
            self.cursor2.execute(query)
            
            result = fixerio.fixerIOCollector().connect_fixerio_api() #to fetch result variable            
            
            self.base_curr = result['base']
            self.date = result['date']
            self.source_id = 'fixer.io'
            self.today = datetime.now()

            for currency in self.cursor2:
                val = result['rates'][currency[0]]
                
                insert_tuple1 = (str(self.base_curr),str(currency[0]),str(self.date),str(self.today),str(val),str(self.source_id))
                #query = "insert into test (base_curr,to_curr,rate) VALUES(%s,%s,%s) "

                query2 = "insert into rates (from_curr,to_curr,timestamp_created,timestamp_data,amount,source_id) VALUES(%s,%s,%s,%s,%s,%s) "
                self.cursor.execute(query2,insert_tuple1)
                self.connection.commit() 
            print("exit")
          
        except mysql.connector.Error as error:
            print("Error",error)

        finally:
            if(self.connection.is_connected()):
                self.cursor.close()
                self.connection.close()
                print("MYSQL connection is closed")        

    def db_update_data(self):
        
        try:
            
            query = "select curr_id from curr_list"
            dbConnect.db_get_config(self)
            self.cursor2.execute(query)
            
            result = fixerio.fixerIOCollector().connect_fixerio_api() #to fetch result variable            
            self.today = datetime.now()

            for currency in self.cursor2:
                val = result['rates'][currency[0]]
                insert_tuple1 = (str(self.today),str(val),str(currency))
                
                query2 = "UPDATE rates SET timestamp_data = %s,amount=%s WHERE to_curr=%s"
                self.cursor.execute(query2,insert_tuple1)
                self.connection.commit() 
            print("exit")
          
        except mysql.connector.Error as error:
            print("Error",error)

        finally:
            if(self.connection.is_connected()):
                self.cursor.close()
                self.connection.close()
                print("MYSQL connection is closed")        

        if __name__ == "__main__":
            dbConnect()