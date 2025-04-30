// Handles GET /get_notes to fetch user notes – GET is ideal for data retrieval without modifying server state, using headers for auth.

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

  const { data, error } = await supabase
    .from("notes")
    .select("*")
    .eq("user_id", user.user.id);

  if (error) {
    return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  }

  return new Response(JSON.stringify(data), { status: 200 });
});
