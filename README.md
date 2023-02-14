# Cloud Run Static Site

An example of a GCP Cloud Run deployment hosting a static website, with the Docker image hosted in Artifact Registry.

## Setup and deploying

In order to run this yourself:

- Set all the required environment variables (see .env.example)
- Run `make init`
- Run `make deploy`
- For subsequent deploys, just run `make deploy`

## Running locally.

For local development, you may want to use you own static site generator or local http server. If you want to test the final app in docker. Run `make run` and visit `http://localhost:3000`.
