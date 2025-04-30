// Handles POST /post_notes to insert a new note for verfied user – POST is used to safely send data in the request body for insertion.

import { serve } from "https://deno.land/std/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js";

serve(async (req) => {
  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_ANON_KEY")!,
    { global: { headers: { Authorization: req.headers.get("Authorization")! } } }
  );

  const { data: user, error: userError } = await supabase.auth.getUser();
  if (userError || !user?.user) {
    return new Response(JSON.stringify({ error: "Unauthorized" }), { status: 401 });
  }

  const body = await req.json();
  const { title, content, tags } = body;

  if (!title) {
    return new Response(JSON.stringify({ error: "Title is required" }), { status: 400 });
  }

  const { data, error } = await supabase
    .from("notes")
    .insert([{ title, content, tags, user_id: user.user.id }])
    .select();

  if (error) {
    return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  }

  return new Response(JSON.stringify(data), { status: 200 });
});
