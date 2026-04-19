import mysql.connector

def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="yourpassword",
        database="little_lemon"
    )

def get_max_quantity():
    conn = connect_db()
    cursor = conn.cursor()

    cursor.callproc('GetMaxQuantity')

    for result in cursor.stored_results():
        print("Max Quantity:", result.fetchall())

    conn.close()

if __name__ == "__main__":
    get_max_quantity()