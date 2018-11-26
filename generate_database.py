import database_connection


class DnD5eSpellDatabase:
    def __init__(self, database_filename):

        with open("create_dnd_spell_list.sql", 'r') as sql_file:
            raw_creation_text_lines = sql_file.readlines()
        with open("insert_dnd_spell_list.sql", 'r') as sql_file:
            raw_insert_text_lines = sql_file.readlines()

        sql_queries = self._extract_sql_from_database_creation(raw_creation_text_lines)
        insert_queries = self._extract_sql_from_table_insertion(raw_insert_text_lines)

        db_conn = database_connection.DatabaseConnection(database_filename)
        with db_conn as cursor:
            for sql_query in sql_queries[2:]:
                cursor.execute(sql_query)

        db_conn = database_connection.DatabaseConnection(database_filename)
        with db_conn as cursor:
            for insert_query in insert_queries[1:]:
                print(insert_query)
                cursor.execute(insert_query)

    @staticmethod
    def _extract_sql_from_database_creation(raw_text_lines):
        """Not meant to be a generic extractor.  Made specifically for a specific file."""
        cleaned_lines = []
        for line in raw_text_lines:
            sans_new_strings = line.replace('\n', '')
            sans_tabs = sans_new_strings.replace('\t', '')
            cleaned_lines.append(sans_tabs)

        sql_queries = []
        sql_query = []
        for line in cleaned_lines:
            if line == '':
                sql_queries.append(''.join(sql_query))
                sql_query.clear()
            else:
                sql_query.append(line)
        sql_queries.append(''.join(sql_query))

        return sql_queries

    @staticmethod
    def _extract_sql_from_table_insertion(raw_text_lines):
        valid_lines = []
        for line in raw_text_lines:
            removed_new_lines = line.replace('\n', '')
            if removed_new_lines is not '':
                valid_lines.append(removed_new_lines)

        return valid_lines
