# Cloud Run Static Site

WIP

An example of a GCP Cloud Run deployment hosting a static website, with the Docker image hosted in Artifact Registry.

## Setup

In order to run this yourself:

- Create the Artifact Repository in GCP.
- Set the `IMAGE_TAG` env var as seen in `.env.example`
- Run `make push` to build the initial image and push to Artifact Repository
- Create a Cloud Run instance based on the published image.
- Set the `CLOUD_RUN_ID` env var for future deploys.

## Deploying new revisions

Once the infrastructure is setup correctly following the above, any additional changes will only require running `make deploy`.

## Running locally.

For local development, you may want to use you own static site generator or local http server. If you want to test the final app in docker. Run `make run` and visit `http://localhost:3000`.
