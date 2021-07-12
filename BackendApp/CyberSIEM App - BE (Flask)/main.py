from fastapi import FastAPI
# Internal Packages


# External Packages
import fastapi # python -m uvicorn main:app --reload

# Internal Packages
from logger import logging
from db import PlatformDB

app = FastAPI()
db = PlatformDB('141.226.188.153', 'Platform', 'sa', 'balaGan)(12')

@app.get("/rules")
def getRules():
    return db.GetRules()
