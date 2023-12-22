from django.http import HttpResponse
from django.views import View
from django.shortcuts import render, redirect
from .models import Login
from Chat.models import Chat_Group,detail_group
from django.contrib.auth.hashers import check_password,make_password
from django.shortcuts import redirect, reverse
import os
from django.db import connection
from datetime import datetime
from django.conf import settings


# Create your views here.
class login(View):
    def get(self,request):
        if 'user_id' in request.session:
            return redirect('login:list_users')
        else:
            return render(request,'login/login.html')
        
    def post(self, request):
        email = request.POST['email']
        password = request.POST['password']
        # Sử dụng mô hình Login để xác thực
        try:
            user = Login.objects.get(email=email)
        except Login.DoesNotExist:
            user = None
        if user is not None and check_password(password, user.password):
            # Đăng nhập người dùng nếu xác thực thành công
            #login(request, user)
            request.session['user_id'] = user.id
            
            return redirect('login:list_users')
        else:
            return HttpResponse('Đăng nhập không thành công. Vui lòng kiểm tra lại thông tin đăng nhập.')
class log_out(View):
    def get(self,request):
        del request.session['user_id']
        return redirect('login:login')
class sign_up(View):
    def get(self, request):
        
        return render(request, 'sign_up/sign_up.html')

    def post(self, request):
        email = request.POST.get('email')
        password = request.POST.get('password')
        name = request.POST.get('name')
        
        # Kiểm tra xem người dùng đã tồn tại chưa
        if Login.objects.filter(email=email).exists():
            return HttpResponse("email đã tồn tại")

        # Xử lý ảnh
        image = request.FILES.get('image')  
        # Lưu ảnh vào thư mục static/image
        if image:
            destination_path = os.path.join('static', 'image', image.name)
            with open(destination_path, 'wb') as destination:
                for chunk in image.chunks():
                    destination.write(chunk)
            url = 'image/'+image.name
        # Tạo một bản ghi mới trong mô hình Login
        hashed_password = make_password(password)
        new_user = Login(email=email, password=hashed_password, name=name,  url_image=url)
        new_user.save()

        # Chuyển hướng hoặc render trang tùy thuộc vào yêu cầu của bạn
        return redirect('login:login') 
class list_user(View):
    def get(self,request):
        # clien = login.objects.all()
        if 'user_id' in request.session:
            obj = Login.objects.filter(id=request.session['user_id'])
            users = Login.objects.exclude(id=request.session['user_id'])
        
            # Gộp hai từ điển thành một
            context = {'users': users, 'obj': obj.first()} 

            return render(request, 'List_user/List_user.html', context)
        else:
            return redirect('login:login')
class list_group(View):
    def get(self,request):
        # clien = login.objects.all()
        if 'user_id' in request.session:
            user = format(request.session['user_id']) 
            query = '''
                SELECT * FROM chat_detail_group
                JOIN chat_chat_group ON chat_chat_group.id = chat_detail_group.id_group
                WHERE chat_detail_group.id_user = %s
            '''
            obj = Login.objects.filter(id=request.session['user_id'])
            group = detail_group.objects.raw(query, [user])
            # Gộp hai từ điển thành một 
            context = {'group': group ,'obj': obj.first()} 
            return render(request, 'list_group/list_group.html', context)
        else:
            return redirect('login:login')
class add_group(View):
    def get(self, request):
        if 'user_id' in request.session:
            obj = Login.objects.filter(id=request.session['user_id'])
            users = Login.objects.all()
            # Gộp hai từ điển thành một
            context = {'users': users, 'obj': obj.first()} 

            return render(request, 'list_group/add_group.html', context)
        else:
            return redirect('login:login')
    def post(self, request, *args, **kwargs):
        name = request.POST.get('name')
        members = request.POST.getlist('men[]')
        # Xử lý ảnh
        image = request.FILES.get('image')  

        # Lưu ảnh vào thư mục static/image
        if image:
            destination_path = os.path.join('static', 'image', image.name)
            with open(destination_path, 'wb') as destination:
                for chunk in image.chunks():
                    destination.write(chunk)
        url = 'image/'+image.name

        # Tạo một nhóm mới
        new_group = Chat_Group(name_group=name, url_image=url)
        new_group.save()

        # Lấy ID của nhóm vừa tạo ra
        created_group_id = new_group.id

        # Thêm các thành viên vào nhóm
        for member in members:
            detail_group.objects.get_or_create(id_group=created_group_id, id_user=member)

        # Chuyển hướng hoặc render trang tùy thuộc vào yêu cầu của bạn
        return redirect('login:list_groups')
class search_file(View):
    def post(self, request):
        
        key = request.POST.get('search')
        query = '''
              SELECT * FROM chat_group_chat
                JOIN login_login ON login_login.id = chat_group_chat.id_user
                JOIN chat_chat_group ON chat_chat_group.id = chat_group_chat.id_group
                WHERE chat_group_chat.url_file LIKE %s
            '''
        group = Login.objects.raw(query, [ f'%{key}%'])
        query2 = '''
              SELECT * FROM chat_chat_box
                JOIN login_login ON login_login.id = chat_chat_box.id_in 
                WHERE chat_chat_box.url_file LIKE %s
            '''
        users = Login.objects.raw(query2, [ f'%{key}%'])
        info = Login.objects.filter(id=request.session['user_id'])
        context = { 'WS_URL': settings.WS_URL,'users': users,'group': group,'info': info.first()} 
        return render(request, 'search_file/search_file_all.html',context )
class share_file(View):
    def get(self, request):
        if 'user_id' in request.session:
            request.session['file'] = request.GET.get('file')
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
            return render(request, 'share_file/share_file_all.html', context)
        else:
            return redirect('login:login')       
    def post(self, request):
        if 'user_id' in request.session:
           
            user = request.session['user_id'] 
            groups = request.POST.getlist('group[]')
            users = request.POST.getlist('user[]')
            
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
            
            del request.session['file']
            return redirect(reverse('login:list_users'))
        else:
            return redirect('login:login')   

        