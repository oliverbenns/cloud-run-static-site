.PHONY: build deploy run

build:
	docker build --platform linux/amd64 -t ${IMAGE_TAG} .

push: build
	gcloud auth configure-docker ${IMAGE_TAG} --quiet
	docker push ${IMAGE_TAG}

deploy: push
	# TODO: Deploynew release of cloud run. ${CLOUD_RUN_ID}
	# Will need to get latest tag

run: build
	docker run -p 3000:80 ${IMAGE_TAG} 
