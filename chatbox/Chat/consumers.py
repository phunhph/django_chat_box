# consumers.py
import json
from channels.generic.websocket import AsyncWebsocketConsumer
from .models import Chat_Box

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        await self.accept()

    async def disconnect(self, close_code):
        pass

    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        id_in = 4
        id_out = 5
        message = "test"

        await self.save_message(id_in, id_out, message)

        await self.send(text_data=json.dumps({
            'message': message
        }))

    async def save_message(self, id_in, id_out, message):
        Chat_Box.objects.create(
            id_in=id_in,
            id_out=id_out,
            mes=message,
            statuts=0  # Adjust status as needed
        )
