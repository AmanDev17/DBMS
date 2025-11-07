import mysql.connector

# Connect to MySQL
mydb = mysql.connector.connect(
    host="localhost",
    user="Mohit",
    password="Mohit@123",
    database="exp"
)

mycursor = mydb.cursor()

choice = "0"

while choice != "5":
    print("\n-------- STUDENT DATABASE MENU --------")
    print("1. Insert Record")
    print("2. Update Record")
    print("3. Delete Record")
    print("4. Display All Records")
    print("5. Exit")

    choice = input("Enter your choice (1-5): ")

    if choice == "1":
        # INSERT
        prn = input("Enter PRN: ")
        name = input("Enter Name: ")

        sql = "INSERT INTO Student (PRN, Name) VALUES (%s, %s)"
        val = (prn, name)
        mycursor.execute(sql, val)
        mydb.commit()

        print("✔ Record Inserted Successfully.")

    elif choice == "2":
        # UPDATE
        prn = input("Enter PRN of student to update: ")
        new_name = input("Enter new name: ")

        sql = "UPDATE Student SET Name = %s WHERE PRN = %s"
        val = (new_name, prn)
        mycursor.execute(sql, val)
        mydb.commit()

        print("✔ Record Updated Successfully.")

    elif choice == "3":
        # DELETE
        prn = input("Enter PRN of student to delete: ")

        sql = "DELETE FROM Student WHERE PRN = %s"
        val = (prn,)
        mycursor.execute(sql, val)
        mydb.commit()

        print("✔ Record Deleted Successfully.")

    elif choice == "4":
        # DISPLAY
        mycursor.execute("SELECT * FROM Student")
        result = mycursor.fetchall()

        print("\n----- Student Records -----")
        for row in result:
            print("PRN:", row[0], "| Name:", row[1])

    elif choice == "5":
        print("Exiting Program. Goodbye!")

    else:
        print("Invalid Input. Please enter between 1 to 5.")

mycursor.close()
mydb.close()