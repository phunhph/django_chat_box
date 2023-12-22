
from django.urls import path
from . import views
app_name='login'
urlpatterns = [
    path('', views.login.as_view()),
    path('login/', views.login.as_view(), name = 'login'),
    path('logout/', views.log_out.as_view(), name = 'logout'),
    path('Sign_up/', views.sign_up.as_view(),  name='Sign_up'),
    path('list_users/',views.list_user.as_view(),  name='list_users'),
    path('list_groups/',views.list_group.as_view(),  name='list_groups'),
    path('add_groups/',views.add_group.as_view(),  name='add_group'),
    path('search_file/', views.search_file.as_view(),name='search_file_all'),
    path('share_file/', views.share_file.as_view(),name='share_file_all'),
    # path('forgot/', views.forgot, name='forgot'),
]