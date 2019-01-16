from django.conf.urls import url
from womai import views

urlpatterns = [
    #首页
    url(r'^$',views.index,name='index'),

    #注册后，自动登录，并且状态保持
    url(r'^register/$',views.register,name='register'),

    url(r'^logout/$',views.logout,name='logout'),

    #登录
    url(r'^login/$',views.login,name='login'),

    #ajax局部检测账号是否存在,就是手机号
    url(r'^check/$',views.check,name='check'),

    #商品列表
    url(r'shoplist/$',views.shoplist,name='shoplist'),

    #商品列表
    url(r'^detail/$',views.detail,name='detail'),

    #购物车
    url(r'^cart/$',views.cart,name='cart'),

    #添加商品,ajax路由
    url(r'addcart/$',views.addcart,name='addcart'),

    #在购物车中增加商品数量
    url(r'addgoodsnumber/$',views.addgoodsnumber,name='addgoodsnumber'),
    #在购物车中增加商品数量
    url(r'cutgoodsnumber/$',views.cutgoodsnumber,name='cutgoodsnumber'),
    #在购物车中删除商品
    url(r'delgoodsnumber/$',views.delgoodsnumber,name='delgoodsnumber'),




]