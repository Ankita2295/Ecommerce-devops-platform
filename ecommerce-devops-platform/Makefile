.PHONY: start stop health test build scan k8s

start:
	./scripts/start.sh

stop:
	./scripts/stop.sh

health:
	./scripts/health-check.sh

build:
	docker build -t ecommerce-devops-platform:local .

test:
	python3 -m compileall app

scan:
	./security/trivy-scan.sh ecommerce-devops-platform:local

k8s:
	kubectl apply -f k8s/
