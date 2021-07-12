import logging
import logging.handlers as handlers


class Logger:
    
    def __init__(self, log_file_name:str, max_mb:int, num_log_files:int):
        
        handler = handlers.RotatingFileHandler(
            filename=log_file_name,
            mode='a',
            maxBytes=1024*1024*max_mb,
            backupCount=num_log_files,
            encoding=None,
            delay=0
        )

        logging.basicConfig(
            format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s',
            datefmt='%d/%m/%Y %H:%M:%S',
            level=logging.DEBUG,
            handlers = [handler]
        )