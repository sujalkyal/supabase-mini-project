curl -X POST https://jccnegfihersnchwfnba.supabase.co/auth/v1/signup \
  -H "Content-Type: application/json" \
  -H "apikey: <anon_public_key>" \
  -d '{
    "email": "sujalrandom1@gmail.com",
    "password": "123456"
  }'

curl -X POST https://jccnegfihersnchwfnba.functions.supabase.co/post_notes \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImhUSzduSEF2UmpxZ0UyZFoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2pjY25lZ2ZpaGVyc25jaHdmbmJhLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiI0NjUxMDA5YS0xYmMxLTQ5MjctOWE2Ni03N2E5MjViNjcwYWIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2MDA0ODg4LCJpYXQiOjE3NDYwMDEyODgsImVtYWlsIjoic3VqYWxyYW5kb20xQGdtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWxfdmVyaWZpZWQiOnRydWV9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzQ2MDAxMjg4fV0sInNlc3Npb25faWQiOiJmZTEyMDJlYy01OTliLTQ4ZjgtYWQ0YS0zYWM0MmVhODUyNzgiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.sYUN7L3drkCtdYPkQyU-V2SR773Uc6vcNPuhC9cFcsM" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "My test note",
    "content": "This is a test note",
    "tags": ["personal", "quick"]
  }'

curl -X GET https://jccnegfihersnchwfnba.functions.supabase.co/get_notes \
    -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImhUSzduSEF2UmpxZ0UyZFoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2pjY25lZ2ZpaGVyc25jaHdmbmJhLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiI0NjUxMDA5YS0xYmMxLTQ5MjctOWE2Ni03N2E5MjViNjcwYWIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2MDA0ODg4LCJpYXQiOjE3NDYwMDEyODgsImVtYWlsIjoic3VqYWxyYW5kb20xQGdtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWxfdmVyaWZpZWQiOnRydWV9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzQ2MDAxMjg4fV0sInNlc3Npb25faWQiOiJmZTEyMDJlYy01OTliLTQ4ZjgtYWQ0YS0zYWM0MmVhODUyNzgiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.sYUN7L3drkCtdYPkQyU-V2SR773Uc6vcNPuhC9cFcsM"

