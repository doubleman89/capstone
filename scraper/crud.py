import uuid
from models import PropertyModel,PropertyScrapeEvent
from datetime import datetime,date

def create_entry(data:dict):
    newData =data.copy()
    newData["date"] = date.today()
    return PropertyModel.create(**data)


def create_scrape_entry(data:dict):
    newData =data.copy()
    newData['uuid'] = uuid.uuid1() # includes timestamp
    return PropertyScrapeEvent.create(**newData)

def add_scrape_event(data:dict):
    property =create_entry(data)
    scrape_obj = create_scrape_entry(data)
    return property,scrape_obj