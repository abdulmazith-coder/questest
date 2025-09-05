from rest_framework.views import APIView
from rest_framework.response import Response
from main.supabase_connection import supabase
from rest_framework import status
import jwt
import time

class Userprofile(APIView):
    def get(self, request, pk):
        # --- Authorization check ---
        token = request.headers.get('Authorization')
        if not token:
            return Response({'message': 'Token is required'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            jwt_token = token.split(' ')[1]

            # Decode JWT to check expiry
            try:
                decoded = jwt.decode(jwt_token, options={"verify_signature": False})
                if 'exp' in decoded:
                    if decoded['exp'] < int(time.time()):
                        return Response({'message': 'Token expired, please login again'}, status=status.HTTP_401_UNAUTHORIZED)
            except jwt.ExpiredSignatureError:
                return Response({'message': 'Token expired, please login again'}, status=status.HTTP_401_UNAUTHORIZED)
            except jwt.InvalidTokenError:
                return Response({'message': 'Invalid token'}, status=status.HTTP_401_UNAUTHORIZED)

        except Exception as e:
            return Response({'message': f'Authentication failed: {str(e)}'}, status=status.HTTP_401_UNAUTHORIZED)

        # --- UID check ---
        if not pk:
            return Response({'message': 'UID is required'}, status=status.HTTP_400_BAD_REQUEST)

        # --- Fetch user profile ---
        try:
            data = supabase.table('users').select('*').eq("id", pk).single().execute()

            if not data.data:
                return Response({'message': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

            return Response(data.data, status=status.HTTP_200_OK)

        except Exception as e:
            return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)
