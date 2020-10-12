import mysql.connector
import json
import requests

class connect:
    #print("test...")
    connection = None
    host = '127.0.0.1'
    connection = mysql.connector.connect(
        host = host,
        user = 'root',
        passwd = '',
        database = 'test' 
    )
    print("connection successful")
    cursor = connection.cursor()

    query = "select curr from temp"
    cursor.execute(query)
    
    for curr in cursor:
        print("res",curr)
        for c in curr:
            print("resss",c)
            query = "insert into temp(curr,value) values(%s,%s)"
            tuple_insert = (c,'1.2')
            cursor.execute(query,tuple_insert)
            print("test2")
            connection.commit()

    for curr in cursor:
        print(curr)
        for c in curr:
            print("test")
            query = "insert into temp(curr,value) values(%s,%s)"
            tuple_insert = ('USD','1.2')
            #cursor.execute(query,tuple_insert)
            print("test2")
            #connection.commit()
    print("done")

    #print("result is",res)

if __name__ == "__main__":
    connect()
        