from django.shortcuts import render
from django.http import HttpResponse
from django.views import View
from .models import Chat_Box, Chat_Group,Group_Chat,detail_group
from Login.models import Login
from django.conf import settings
from django.shortcuts import redirect
from django.shortcuts import redirect, reverse
import json
from django.db.models import Q
import os
from Login.models import Login
from django.db import connection
from datetime import datetime
# Create your views here.

class ChatBox(View):
    def get(self,request):
        id_value = request.GET.get('id')
        obj = Chat_Box.objects.filter(
        Q(id_in=id_value, id_out=request.session['user_id']) | 
        Q(id_out=id_value, id_in=request.session['user_id'])
        )
        info = Login.objects.filter(id=id_value)
        context = {'id_value': id_value, 'WS_URL': settings.WS_URL,'obj': obj,'info': info.first()} 
        return render(request, 'Chat/chat.html',context )
    def post(self, request):
        id_out_value = request.session['user_id']
        id_in = request.POST.get('incoming_id')
        text = request.POST.get('message')

        # Kiểm tra xem có tệp nào được tải lên không
        file = request.FILES.get('file')

        if file:
            destination_path = os.path.join('static', 'file', file.name)
            with open(destination_path, 'wb') as destination:
                for chunk in file.chunks():
                    destination.write(chunk)
            url = 'file/'+file.name
            # Lưu thông tin về tệp trong cơ sở dữ liệu
            new_mes = Chat_Box(id_in=id_in, id_out=id_out_value, url_file=url)
        else:
            # Lưu chỉ tin nhắn văn bản nếu không có tệp nào được tải lên
            new_mes = Chat_Box(id_in=id_in, id_out=id_out_value, mes=text)

        new_mes.save()

        return redirect(reverse('Chat:Chat') + f'?id={id_in}')
class ChatBox_group(View):
    def get(self,request):
        if 'user_id' in request.session:
            id_value = format(request.GET.get('id'))
            info = Chat_Group.objects.filter(id=id_value)
            user = format(request.session['user_id']) 
            query = '''
                SELECT * FROM `chat_group_chat` JOIN login_login ON login_login.id = chat_group_chat.id_user WHERE chat_group_chat.id_group = %s
            '''
            obj = Group_Chat.objects.raw(query, [id_value])
            
            context = {'id_value': id_value, 'WS_URL': settings.WS_URL,'obj': obj,'info': info.first(),'user': user} 
            return render(request, 'Chat_group/chat_group.html',context )
        else:
            return redirect('login:login')
        
    def post(self, request):
        id_out_value = request.session['user_id']
        id_in = request.POST.get('incoming_id')
        text = request.POST.get('message')

        # Kiểm tra xem có tệp nào được tải lên không
        file = request.FILES.get('file')

        if file:
            destination_path = os.path.join('static', 'file', file.name)
            with open(destination_path, 'wb') as destination:
                for chunk in file.chunks():
                    destination.write(chunk)
            # Lưu thông tin về tệp trong cơ sở dữ liệu
                    # return HttpResponse(file.name)
            url = 'file/'+file.name
            new_mes = Group_Chat(id_user=id_out_value, id_group=id_in, url_file=url)
        else:
            # Lưu chỉ tin nhắn văn bản nếu không có tệp nào được tải lên
            new_mes = Group_Chat(id_user=id_out_value, id_group=id_in, mes=text)

        new_mes.save()

        return redirect(reverse('Chat:Chat_group') + f'?id={id_in}')
class add_menber(View):
    def get(self,request):
        id_value = request.GET.get('id')
        query = '''
              SELECT * FROM `login_login` WHERE id not in (SELECT id_user FROM chat_detail_group WHERE chat_detail_group.id_group=  %s)
            '''
        obj = Login.objects.raw(query, [id_value])
        info = Chat_Group.objects.filter(id=id_value)
        context = {'id_value': id_value, 'WS_URL': settings.WS_URL,'obj': obj,'info': info.first()} 
        return render(request, 'add_menber/add_menber.html',context )
    def post(self, request):
        members = request.POST.getlist('men[]')
        id_value = request.GET.get('id')
        # Thêm các thành viên vào nhóm
        for member in members:
            detail_group.objects.get_or_create(id_group=id_value, id_user=member)
       
        return redirect(reverse('Chat:Chat_group') + f'?id={id_value}')
class search_fil_group(View):
    def get(self,request):
        id_value = request.GET.get('id')
        query = '''
              SELECT * FROM `chat_group_chat` JOIN login_login ON login_login.id = chat_group_chat.id_user WHERE chat_group_chat.url_file IS NOT NULL and chat_group_chat.id_group =  %s
            '''
        obj = Login.objects.raw(query, [id_value])
        info = Chat_Group.objects.filter(id=id_value)
        context = {'id_value': id_value, 'WS_URL': settings.WS_URL,'obj': obj,'info': info.first()} 
        return render(request, 'search_file/search_file.html',context )
    def post(self, request):
        id_value = request.GET.get('id')
        key = request.POST.get('search')
        query = '''
              SELECT * FROM chat_group_chat
                JOIN login_login ON login_login.id = chat_group_chat.id_user
                WHERE chat_group_chat.id_group = %s
                AND chat_group_chat.url_file LIKE %s
            '''
        obj = Login.objects.raw(query, [id_value, f'%{key}%'])
        info = Chat_Group.objects.filter(id=id_value)
        context = {'id_value': id_value, 'WS_URL': settings.WS_URL,'obj': obj,'info': info.first()} 
        return render(request, 'search_file/search_file.html',context )
class share_file_group(View):
    def get(self, request):
        if 'user_id' in request.session:
            request.session['file'] = request.GET.get('file')
            request.session['id_group'] = request.GET.get('id')
            user = format(request.session['user_id']) 
            query = '''
                SELECT * FROM chat_detail_group
                JOIN chat_chat_group ON chat_chat_group.id = chat_detail_group.id_group
                WHERE chat_detail_group.id_user = %s
            '''
            users = Login.objects.exclude(id=request.session['user_id'])
            obj = Login.objects.filter(id=request.session['user_id'])
            group = detail_group.objects.raw(query, [user])
            # Gộp hai từ điển thành một 
            context = {'group': group ,'obj': obj.first(),'users': users,} 
            return render(request, 'share_file/share_file.html', context)
        else:
            return redirect('login:login')       
    def post(self, request):
        if 'user_id' in request.session:
           
            user = request.session['user_id'] 
            groups = request.POST.getlist('group[]')
            users = request.POST.getlist('user[]')
            id_value = request.session['id_group']
            url_flie = request.session['file']
            # Lấy thời gian hiện tại
            current_time = datetime.now()
            # Thêm các thành viên vào nhóm (chat_group_chat) và ghi lại thời gian
            query_group_chat = '''
                INSERT INTO `chat_group_chat` (`id_user`, `id_group`, `url_file`, `time`) VALUES (%s, %s, %s, %s)
            '''
            for group in groups:
                with connection.cursor() as cursor:
                    cursor.execute(query_group_chat, [user, group, url_flie, current_time])
                connection.commit()
                
            query = '''
                INSERT INTO `chat_chat_box`( `id_in`, `id_out`, `url_file`) VALUES (%s, %s, %s)
            '''

            # Thêm các thành viên vào nhóm
            for user_in in users:
                with connection.cursor() as cursor:
                    cursor.execute(query, [user_in, user, url_flie])
                connection.commit()
            del request.session['id_group']
            del request.session['file']
            return redirect(reverse('Chat:search_file') + f'?id={id_value}')
        else:
            return redirect('login:login')   
