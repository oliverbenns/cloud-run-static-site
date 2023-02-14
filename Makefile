.PHONY: build deploy run

IMAGE_TAG := ${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/${APP_NAME}


init:
	gcloud artifacts repositories create ${REPO_NAME} --repository-format=docker --project=${PROJECT_ID} --location=${REGION}

build:
	docker build --platform linux/amd64 -t ${IMAGE_TAG} .

push: build
	gcloud auth configure-docker ${IMAGE_TAG} --quiet
	docker push ${IMAGE_TAG}

deploy: push
	gcloud run deploy ${APP_NAME} --project=${PROJECT_ID} --image=${IMAGE_TAG} --port=80 --region=${REGION} --allow-unauthenticated

run: build
	docker run -p 3000:80 ${IMAGE_TAG} 
