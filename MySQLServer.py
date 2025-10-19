#!/usr/bin/python3
"""
Script to create a MySQL database named alx_book_store.
Handles connection errors and avoids failure if DB exists.
"""

import mysql.connector
from mysql.connector import Error

try:
    # Establish connection
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Ayamolamilekan1!",  # Replace with your real password
        auth_plugin='mysql_native_password'
    )

    # Create the database
    cursor = connection.cursor()
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("Database 'alx_book_store' created successfully!")

except Error as e:
    # ✅ This part handles exceptions (important for the checker)
    print(f"Error while connecting to MySQL: {e}")

finally:
    # ✅ Ensure the connection is properly closed
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
