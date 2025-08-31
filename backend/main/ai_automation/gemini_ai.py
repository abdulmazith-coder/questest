from decouple import config
from rest_framework.response import Response
from rest_framework import status
from openai import OpenAI
import json


client = OpenAI(api_key=config("AI_KEY"),base_url=config("AI_BASEURL"))


def ask_Gemini(prompt):

    if not prompt:
        return Response({"error": "Prompt is required"}, status=status.HTTP_400_BAD_REQUEST)


    try:
        responsed = client.chat.completions.create(
            model= config("AI_MODELS"),
            messages=[
                {"role": "system", "content": "you are a teacher in college or school . you create the question paper based on . i Given prompt, you only create the question paper only , when i ask another Just say i am only Generate the question paper"},
                {"role": "user", "content": prompt}
            ],
            
            response_format={
                "type": "json_schema",
                "json_schema":{
                    "name": "question paper",
                    "schema":{
                         "type": "object",
                         "properties": {
                             "title": {"type": "string", "description": "The title of the story"},
                             "mcq": {"type": "string", "description": "here Mcq with options .  use this \n after one question finised"},
                             "fill_ups": {"type": "string", "description": "here fill_ups .  use this \n after one question finised"},
                             "very_short_answer": {"type": "string", "description": "here very_short_answer eg : 2 marks question answer .  use this \n after one question finised"},
                             "short_answer": {"type": "string", "description": "here short_answer eg : 5 marks question answer .  use this \n after one question finised"},
                             "long_answer": {"type": "string", "description": "here long_answer eg : 10 marks question answer .  use this \n after one question finised"},
                         },
                         "required": ["title","mcq","fill_ups","very_short_answer","short_answer","long_answer"]
                    }
                }
            }
        
        )
       

        raw_content = responsed.choices[0].message.content
        print(raw_content)
        try:
            decode_content = json.loads(raw_content)
            
        except json.JSONDecodeError:
             decode_content = raw_content 

        
        return decode_content
    

    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

    