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
    url(r'^addcart/$',views.addcart,name='addcart'),

    #在购物车中增加商品数量
    url(r'^addgoodsnumber/$',views.addgoodsnumber,name='addgoodsnumber'),
    #在购物车中增加商品数量
    url(r'^cutgoodsnumber/$',views.cutgoodsnumber,name='cutgoodsnumber'),
    #在购物车中删除商品
    url(r'^delgoodsnumber/$',views.delgoodsnumber,name='delgoodsnumber'),
    #改变某个用户单个购物车记录状态
    url(r'^changestatus/$',views.changestatus,name='changestatus'),
    #改变某个用户所有购物车记录状态
    url(r'^changeallstatus/$',views.changeallstatus,name='changeallstatus'),
    #点击下单
    url('^order/$',views.order,name='order'),

    #订单详情
    url('^orderdetail/(.+)/$',views.orderdetail,name='orderdetail'),
    # 支付
    url(r'^pay/$', views.pay, name='pay'),

    #支付完成后(服务端)
    url(r'^appnotify/$', views.appnotify, name='appnotify'),

    # 买家完成后回到哪个页面
    url(r'^returnview/$', views.returnview, name='returnview'),


]