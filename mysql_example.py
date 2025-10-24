import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
    user="root",
    password="Ayamolamilekan1!",
    database="mydb",
    auth_plugin='mysql_native_password'
)

mycursor = mydb.cursor()

mycursor.execute("""CREATE TABLE IF NOT EXISTS customers (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL UNIQUE)""")

print("Table created successfully!")

sql = "INSERT INTO customers (name, email) VALUES (%s, %s)"
val = ("John Doe", "john.doe@example.com")
mycursor.execute(sql, val)
mydb.commit()

print(mycursor.rowcount, "record(s) inserted.")

val = ("Michelle Arnold", "arnoldmichelle952@gmail.com")
mycursor.execute(sql, val)
mydb.commit()

print(mycursor.rowcount, "record(s) inserted.")

mycursor.execute("SELECT * FROM customers")
myresult = mycursor.fetchall()

print("Customers:")
for row in myresult:
    print(row)

sql = "UPDATE customers SET email = %s WHERE id = %s"
val = ("updated.email@example.com", 1)
mycursor.execute(sql, val)
mydb.commit()

print(mycursor.rowcount, "record(s) updated.")
print(myresult)

sql = "DELETE FROM customers WHERE id = 2"
mycursor.execute(sql)
mydb.commit()   

print(mycursor.rowcount, "record(s) deleted.")

mycursor.close()
mydb.close()

print("Database connection closed.")