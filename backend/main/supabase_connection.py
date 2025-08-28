from supabase import create_client , Client
from decouple import config

SUPABASE_URL = config("SUPABASE_Url")
SUPABASE_KEY = config("SUPABASE_Key")

supabase : Client = create_client(SUPABASE_URL, SUPABASE_KEY)
