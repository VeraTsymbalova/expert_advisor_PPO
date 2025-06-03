import torch
import onnxruntime as ort
import numpy as np
from schema import MarketData

model_path = "PPO.onnx"
session = ort.InferenceSession(model_path)

def preprocess(data: MarketData):
    return np.array([[data.price]], dtype=np.float32)

def predict_action(data: MarketData) -> int:
    input_tensor = preprocess(data)
    outputs = session.run(None, {session.get_inputs()[0].name: input_tensor})
    action = int(np.argmax(outputs[0]))
    return action
