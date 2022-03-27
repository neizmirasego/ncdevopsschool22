import sqlite3

connection = sqlite3.connect('database.db')


with open('schema.sql') as f:
    connection.executescript(f.read())

cur = connection.cursor()

cur.execute("INSERT INTO posts (title, content, image) VALUES (?, ?, ?)",
            ('First Post', 'Content for the first post', '123')
            )

cur.execute("INSERT INTO posts (title, content, image) VALUES (?, ?, ?)",
            ('Second Post', 'Content for the second post', '123')
            )

connection.commit()
connection.close()
