from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from main.supabase_connection import supabase



class RefreshToken(APIView):
    """Get new access token using refresh token"""

    def post(self, request):
        refresh_token = request.data.get("refresh_token")

        if not refresh_token:
            return Response({"error": "Refresh token required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            session = supabase.auth.refresh_session(refresh_token)
            return Response(
                {
                    "access_token": session.session.access_token,
                    "refresh_token": session.session.refresh_token,
                    "user": session.user.id,
                },
                status=status.HTTP_200_OK,
            )
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)