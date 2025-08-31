from rest_framework.response import Response
from rest_framework import status
from main.supabase_connection import supabase


def validate_JWT(token):
     if not token :
            return Response({'message': 'Token is required'}, status=status.HTTP_400_BAD_REQUEST)

     try:

         jwt_token = token.split(' ')[1]
            
         users = supabase.auth.get_user(jwt_token)

        

     except Exception:
        return Response({"error": "Invalid or expired token"}, status=status.HTTP_401_UNAUTHORIZED)