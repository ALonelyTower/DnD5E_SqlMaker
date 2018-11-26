import sqlite3
from sqlite3 import DatabaseError


class DatabaseConnection:
    def __init__(self, database_path):
        if database_path is None:
            raise TypeError("Database path must be set prior to access.")

        try:
            self._database_connection = sqlite3.connect(database_path)
        except DatabaseError as db_e:
            print(f"Error occurred in connecting to database: {db_e}")
            print(f"Database path given: {database_path}")

    def __enter__(self):
        return self._database_connection.cursor()

    def __exit__(self, except_type, except_value, traceback):
        if traceback is None:
            self._database_connection.commit()
            self._database_connection.close()
        else:
            self._database_connection.rollback()
            raise except_type(except_value)



