# First Approach

# Step-1 - Build the image 
docker build -t ml-model .

# Step-2 - Test & run the image locally 
docker run -v "$(pwd)/:/app" ml-model
# or to bind the port explicitly
docker run -v "$(pwd)/:/app" -p 8081:8081 ml-model
# or to add the environment variable for the service account
docker run -v "$(pwd)/:/app" -p 8081:8081 -e GOOGLE_APPLICATION_CREDENTIALS="./secrets/ferrous-depth-436501-q2-e52c5f556e64.json" ml-model

# Step-3 - List the images locally 
docker image ls

# Optional - Delete the existing image 
docker rmi ml-model

# Step-4 - Tag the image locally 
docker tag ml-model gcr.io/{your-project-id}/ml-model

# Step-5 - Push the image to Google Cloud Registry 

docker push gcr.io/{your-project-id}/ml-model

# Step-6 - Pull the image to Local system & run it locally 
docker pull gcr.io/{your-project-id}/ml-model
docker run -v "$(pwd)/:/app" gcr.io/{your-project-id}/ml-model


# Deploy image to cloud run 

gcloud run deploy ml-model --image  gcr.io/{your-project-id}/ml-model --region us-central1

gcloud run deploy ml-model \
  --source . \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --max-instances 4 \
  --min-instances 2 