from django.conf.urls import url
from womai import views

urlpatterns = [
    #首页
    url(r'^index/$',views.index,name='index'),

    #注册后，自动登录，并且状态保持
    url(r'^register/$',views.register,name='register'),

    url(r'^logout/$',views.logout,name='logout'),

    #登录
    url(r'^login/$',views.login,name='login'),

]