from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from main.supabase_connection import supabase



class Signup(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')
        username = request.data.get('username')


        if(not email or not password or not username):
            return Response({'message': 'Email and password & username are required'}, status=status.HTTP_400_BAD_REQUEST)

        
        try:
            users = supabase.auth.sign_up({
                'email': email,
                'password': password
            })
        
            if(users.user.id != None):
                supabase.table('users').insert({
                'id': users.user.id,
                'email': email,
                'username': username
            }).execute()
            return Response({'message': True}, status=status.HTTP_201_CREATED)

            return Response({'message': 'Error in signup try again'}, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)




class Login(APIView):

    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')

        if(not email or not password ):
            return Response({'message': 'Email and password are required'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            sessions = supabase.auth.sign_in_with_password({
                'email':email,
                'password':password
            })
          
            return Response({
                "access_token" : sessions.session.access_token,
                "refresh_token" : sessions.session.refresh_token,
                "userid": sessions.user.id,
                'message': True
            }, status=status.HTTP_201_CREATED)

            return Response({'message': 'Error in login try again'}, status=status.HTTP_400_BAD_REQUEST)
        
        except Exception as e:
            return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)
