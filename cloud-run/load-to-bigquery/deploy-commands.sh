gcloud builds submit --region us-central1


  # Assign the roles 
  gcloud projects add-iam-policy-binding gcp-serverless-project-374110 \
  --member=serviceAccount:131640033627@cloudbuild.gserviceaccount.com --role=roles/iam.serviceAccountUser

  gcloud projects add-iam-policy-binding gcp-serverless-project-374110 \
  --member=serviceAccount:131640033627@cloudbuild.gserviceaccount.com --role=roles/run.admin


# My cloudbuild serviceAccount: 98179902139@cloudbuild.gserviceaccount.com
# My project number: 98179902139
# gcloud projects describe ferrous-depth-436501-q2 --format="value(projectNumber)"
# => got this project number: 98179902139



gcloud projects add-iam-policy-binding ferrous-depth-436501-q2 \
    --member=serviceAccount:98179902139@cloudbuild.gserviceaccount.com \
    --role=roles/storage.admin

gcloud projects add-iam-policy-binding ferrous-depth-436501-q2 \
    --member=serviceAccount:98179902139@cloudbuild.gserviceaccount.com \
    --role=roles/run.admin

gcloud projects add-iam-policy-binding ferrous-depth-436501-q2 \
    --member=serviceAccount:98179902139@cloudbuild.gserviceaccount.com \
    --role=roles/iam.serviceAccountUser
