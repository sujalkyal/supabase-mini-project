## Setup & Deployment Steps

1. **Create a Supabase Project** at [https://supabase.com](https://supabase.com)
2. **Add Environment Variables** in the Edge Function settings:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`
3. **Create the `notes` table** using the provided `schema.sql`:
   ```bash
   supabase db push
4. **Deploy the Edge Functions:
   ```bash
   supabase functions deploy post_notes
   supabase functions deploy get_notes

## Schema Design

### `schema.sql`
```sql
create table notes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null,
  title text not null,
  content text,
  tags text[],
  created_at timestamp with time zone default now()
);

### ✅ Why These Choices?

*   `uuid` for `id`: ensures unique note identifiers, scalable and secure.
    
*   `user_id`: links notes to users, enabling per-user access.
    
*   `text[] tags`: allows flexible tagging.
    
*   `created_at`: default timestamp for sorting or tracking.

## Edge Functions

### `post_notes.ts`
```ts
// Handles POST /post_notes to insert a new note for verfied user – POST is used to safely send data in the request body for insertion.

### `get_notes.ts`
```ts
// Handles GET /get_notes to fetch user notes – GET is ideal for data retrieval without modifying server state, using headers for auth.

## Demo: cURL Commands

### 1. Create a Note (POST `/post_notes`)
```bash
curl -X POST https://jccnegfihersnchwfnba.functions.supabase.co/post_notes \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImhUSzduSEF2UmpxZ0UyZFoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2pjY25lZ2ZpaGVyc25jaHdmbmJhLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiI0NjUxMDA5YS0xYmMxLTQ5MjctOWE2Ni03N2E5MjViNjcwYWIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2MDA0ODg4LCJpYXQiOjE3NDYwMDEyODgsImVtYWlsIjoic3VqYWxyYW5kb20xQGdtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWxfdmVyaWZpZWQiOnRydWV9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzQ2MDAxMjg4fV0sInNlc3Npb25faWQiOiJmZTEyMDJlYy01OTliLTQ4ZjgtYWQ0YS0zYWM0MmVhODUyNzgiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.sYUN7L3drkCtdYPkQyU-V2SR773Uc6vcNPuhC9cFcsM" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "My test note",
    "content": "This is a test note",
    "tags": ["personal", "quick"]
  }'

#### Expected Response

```json
[
  {
    "id": "uuid-generated-id",
    "user_id": "user-id",
    "title": "random_title",
    "content": "random_content",
    "tags": ["personal", "education"],
    "created_at": "time_stamp",
    "updated_st": "time_stamp"
  }
]

### 1. Get all Notes (GET `/get_notes`)
```bash
curl -X GET https://jccnegfihersnchwfnba.functions.supabase.co/get_notes \
    -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImhUSzduSEF2UmpxZ0UyZFoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2pjY25lZ2ZpaGVyc25jaHdmbmJhLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiI0NjUxMDA5YS0xYmMxLTQ5MjctOWE2Ni03N2E5MjViNjcwYWIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2MDA0ODg4LCJpYXQiOjE3NDYwMDEyODgsImVtYWlsIjoic3VqYWxyYW5kb20xQGdtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWxfdmVyaWZpZWQiOnRydWV9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzQ2MDAxMjg4fV0sInNlc3Npb25faWQiOiJmZTEyMDJlYy01OTliLTQ4ZjgtYWQ0YS0zYWM0MmVhODUyNzgiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.sYUN7L3drkCtdYPkQyU-V2SR773Uc6vcNPuhC9cFcsM"


#### Expected Response

```json
[
  {
    "id": "uuid-generated-id",
    "user_id": "user-id",
    "title": "random_title",
    "content": "random_content",
    "tags": ["personal", "education"],
    "created_at": "time_stamp",
    "updated_st": "time_stamp"
  }
]