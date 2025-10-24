import mysql.connector
from mysql.connector import Error

try:
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Ayamolamilekan1!",
        auth_plugin='mysql_native_password'
    )

    if mydb.is_connected():
        mycursor = mydb.cursor()

        mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        print("Database 'alx_book_store' created successfully!")

except Error as e:
    print("Error while connecting to MySQL", e)

finally:
    if 'mydb' in locals() and mydb.is_connected():
        mycursor.close()
        mydb.close()
        print("MySQL connection is closed.")
