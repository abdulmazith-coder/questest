from rest_framework.views import APIView
from rest_framework.response import Response
from main.ai_automation.gemini_ai import *
from main.supabase_connection import supabase
from main.validate.validate_jwt import *
from main.supabase_connection import supabase
import jwt
import time

class Generate(APIView):
    def post(self, request): 
        token = request.headers.get('Authorization')
        if not token:
            return Response({'message': 'Token is required'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            jwt_token = token.split(' ')[1]

            # Decode JWT manually to check expiry before calling supabase
            try:
                decoded = jwt.decode(jwt_token, options={"verify_signature": False})
                # Exp claim check
                if 'exp' in decoded:
                    
                    if decoded['exp'] < int(time.time()):
                        return Response({'message': 'Token expired, please login again'}, status=status.HTTP_401_UNAUTHORIZED)
            except jwt.ExpiredSignatureError:
                return Response({'message': 'Token expired, please login again'}, status=status.HTTP_401_UNAUTHORIZED)
            except jwt.InvalidTokenError:
                return Response({'message': 'Invalid token'}, status=status.HTTP_401_UNAUTHORIZED)

            # If not expired → fetch user from Supabase
            users = supabase.auth.get_user(jwt_token)
            
        except Exception as e:
            return Response({'message': f'Authentication failed: {str(e)}'}, status=status.HTTP_401_UNAUTHORIZED)

        uid = request.data.get('uid')
        institution_name = request.data.get('institution_name')
        subject = request.data.get('subject')
        subject_code = request.data.get('subject_code')
        deparmant = request.data.get('deparmant')
        semester = request.data.get('semester')
        examtype = request.data.get('examtype')
        totalmark = request.data.get('totalmark')
        timing = request.data.get('timing')
        prompt = request.data.get('prompt')

        if(not institution_name or not subject or not subject_code or not deparmant or not semester or not examtype or not totalmark or not timing or not prompt or not uid):
            return Response({'message': 'All fields are required'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            response = ask_Gemini(prompt)

            if response is not None:
                supabase.table('question').insert({
                    "uid": uid,
                    'institution_name': institution_name,
                    'subject': subject,
                    'subject_code': subject_code,
                    'deparmant': deparmant,
                    'semester': semester,
                    'examtype': examtype,
                    'totalmark': totalmark,
                    'timing': timing,
                    'prompt': prompt,
                    'response': response
                }).execute()

                return Response({'message': 'Generate successfully'}, status=status.HTTP_201_CREATED)
            else:
                return Response({'message': 'Error in Generate try again'}, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)
