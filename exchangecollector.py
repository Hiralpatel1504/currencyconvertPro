import configparser
from fixerio import fixerIOCollector
from dbconnect import dbConnect

fixeriocollector = fixerIOCollector()
dbconnect = dbConnect()

fixeriocollector.connect_fixerio_api()
dbconnect.db_store_data()
