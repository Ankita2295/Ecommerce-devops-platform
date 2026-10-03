import os
import time
from flask import Flask, jsonify, render_template
from prometheus_client import Counter, Histogram, generate_latest, CONTENT_TYPE_LATEST

app = Flask(__name__)

REQUESTS = Counter(
    "ecommerce_http_requests_total",
    "Total HTTP requests",
    ["method", "endpoint", "status"],
)
LATENCY = Histogram(
    "ecommerce_http_request_duration_seconds",
    "HTTP request latency",
    ["endpoint"],
)

PRODUCTS = [
    {"id": 1, "name": "Cloud Runner Shoes", "price": 89.99},
    {"id": 2, "name": "DevOps Hoodie", "price": 49.99},
    {"id": 3, "name": "Kubernetes Mug", "price": 19.99},
]

@app.before_request
def before_request():
    from flask import g
    g.started_at = time.perf_counter()

@app.after_request
def after_request(response):
    from flask import request, g
    elapsed = time.perf_counter() - getattr(g, "started_at", time.perf_counter())
    REQUESTS.labels(request.method, request.path, response.status_code).inc()
    LATENCY.labels(request.path).observe(elapsed)
    return response

@app.get("/")
def home():
    return render_template("index.html", products=PRODUCTS, version=os.getenv("APP_VERSION", "1.0.0"))

@app.get("/api/products")
def products():
    return jsonify(PRODUCTS)

@app.get("/health")
def health():
    return jsonify({"status": "healthy", "version": os.getenv("APP_VERSION", "1.0.0")})

@app.get("/ready")
def ready():
    return jsonify({"status": "ready"})

@app.get("/metrics")
def metrics():
    return generate_latest(), 200, {"Content-Type": CONTENT_TYPE_LATEST}

@app.get("/api/error")
def intentional_error():
    return jsonify({"error": "intentional test error"}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8080")))
