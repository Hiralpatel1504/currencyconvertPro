import requests
import sys
import json
import configparser
from dbconnect import dbConnect

class fixerIOCollector:
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
#        print("This is fixer connection file")
#        print(self.db_user,self.db_pass,self.db_name,self.db_port,self.db_host)
#        print(self.fixer_api_key,self.fixer_api_pass,self.fixer_base_url,self.fixer_endpoint)
        #####################################################################
      
    def connect_fixerio_api(self):

        #symbols = 'INR , EUR , CAD'
        #connect to fixer io api
        main_url = self.fixer_base_url + self.fixer_endpoint +'?access_key='+ self.fixer_api_key +'&from='
            
        #return response object
        req_ob = requests.get(main_url)

        #json method return json format
        result = req_ob.json()
        return result

        if __name__ == "__main__":
            fixerIOCollector()
