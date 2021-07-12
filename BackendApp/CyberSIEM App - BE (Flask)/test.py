import pyodbc

conn = pyodbc.connect(
                'Driver={SQL Server};'
                f'Server=10.0.28.50;'
                f'Database=Platform;'
                f'UID=sa;'
                f'PWD=balaGan)(12;',
                timeout=5
            )

cursor = conn.cursor()
cursor.execute('select * from dbo.ArcSight_Rules')
rows = cursor.fetchall()

for row in rows:
    print(row)