from rest_framework.views import APIView
from rest_framework.response import Response
from main.supabase_connection import supabase
from rest_framework import status


class GetInstitutionData(APIView):
    def get(self, request,pk):
        # uid = request.query_params.get('uid')
        if not pk :
            return Response({'message': 'UID is required'}, status=status.HTTP_400_BAD_REQUEST)
        try:
            data = supabase.table('question').select('*').eq("uid",pk).single().execute()
            return Response(data.data, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({'message': str(e)}, status=status.HTTP_400_BAD_REQUEST)