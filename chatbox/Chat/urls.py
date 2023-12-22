
from django.urls import path
from . import consumers
from . import views
from .consumers import ChatConsumer
app_name = 'Chat'
urlpatterns = [
    path('', views.ChatBox.as_view(),name='Chat'),
    path('group/', views.ChatBox_group.as_view(),name='Chat_group'),
    path('add_menber/', views.add_menber.as_view(),name='add_menber'),
    path('search_file/', views.search_fil_group.as_view(),name='search_file'),
    path('share_file/', views.share_file_group.as_view(),name='share_file'),
]



