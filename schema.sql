
create table notes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  title text not null,
  content text,
  tags text[],
  is_archived boolean default false,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);