from fastapi import FastAPI
from schema import MarketData, ActionResponse
from mql_bridge import predict_action

app = FastAPI()

@app.post("/predict", response_model=ActionResponse)
def predict(data: MarketData):
    action = predict_action(data)
    return ActionResponse(action=action)
