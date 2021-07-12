import pyodbc

class PlatformDB:
    
    def __init__(self, server, database, user, password) -> None:
        
        self.connection_string = f'Driver=SQL Server; \
                                   Server={server}; \
                                   Database={database}; \
                                   UID={user}; \
                                   PWD={password};'

    
    def GetRules(self):
        try:
            conn = pyodbc.connect(self.connection_string, timeout=10)
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM dbo.ArcSight_Rules")
            
            return {
                'rules':
                    [dict(zip([column[0] for column in cursor.description], row)) for row in cursor.fetchall()]
            }
            
        except Exception as e:
            raise Exception(e)
        
        finally:
            conn.close()
        