from pydantic import BaseModel

class MarketData(BaseModel):
    price: float

class ActionResponse(BaseModel):
    action: int
