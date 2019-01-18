import hashlib
import random
import time
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from womai.models import *



'''
cookie 注册 登录 退出
'''
# def index(request):
#     #获取cookie
#     name = request.COOKIES.get('username')
#     #将获取到的value返回到首页进行判断
#     return render(request,'index.html',context={'name':name})
# def register(request):
#     if request.method == 'GET':
#         return render(request,'register.html')
#     elif request.method == 'POST':
#         # 获取post请求的数据，并且加入到数据库中
#         user = User()
#         user.name = request.POST.get('username')
#         user.pwd = request.POST.get('password1')
#         user.emph = request.POST.get('emph')
#         user.phonenum = request.POST.get('phonenumber')
#         user.save()
#         #设置cookie,需要response对象
#         response = redirect('wm:index')
#         response.set_cookie('username',user.name,max_age=((60*60*24)*7))
#         #返回首页的时候，我们需要获取cookie
#         return response
# def logout(request):
#     response = redirect('wm:index')
#     response.delete_cookie('username')
#     return response
# def login(request):
#     if request.method == 'GET':
#         return render(request,'Login.html')
#     elif request.method == 'POST':
#         name = request.POST.get('username')
#         pwd = request.POST.get('password')
#         user = User.objects.filter(name=name).filter(pwd=pwd)
#         if user.count():
#             response = redirect('wm:index')
#             response.set_cookie('username',name)
#             return response
#         else:
#             return render(request,'Login.html',context={'warning':"用户名或者密码不正确"})




'''
session 注册 登录 退出
'''
# def index(request):
#     #获取session
#     name = request.session.get('username')
#     #将获取到的value返回到首页进行判断
#     return render(request,'index.html',context={'name':name})
# def register(request):
#     if request.method == 'GET':
#         return render(request,'register.html')
#     elif request.method == 'POST':
#         # 获取post请求的数据，并且加入到数据库中
#         user = User()
#         user.name = request.POST.get('username')
#         user.pwd = request.POST.get('password1')
#         user.emph = request.POST.get('emph')
#         user.phonenum = request.POST.get('phonenumber')
#         user.save()
#
#         #设置session,需要request对象
#         request.session['username'] = user.name
#         #返回首页的时候，我们需要获取session
#         return redirect('wm:index')
# def logout(request):
#     #第一种，先通过客户端cookie删除 sessionid,再去服务端删除session
#     # response = redirect('wm:index')
#     # response.delete_cookie('sessionid')
#     # del request.session['username']
#     # return response
#
#     #第二种，直接在服务端清空
#     request.session.flush()
#     return redirect('wm:index')
#
#
# def login(request):
#     if request.method == 'GET':
#         return render(request,'Login.html')
#     elif request.method == 'POST':
#         name = request.POST.get('username')
#         pwd = request.POST.get('password')
#         user = User.objects.filter(name=name).filter(pwd=pwd)
#         if user.count():
#             #设置session
#             request.session['username'] = name
#             return redirect('wm:index')
#         else:
#             return render(request,'Login.html',context={'warning':"用户名或者密码不正确"})


'''

token，结合session使用
实现登录、注册、退出
'''

'''
    import hashlib
    m = hashlib.md5()
    m.update(b"Nobody inspects")
    m.update(b" the spammish repetition")
    m.digest()

   '''
#首先得封装一个函数，生成token
def generate_token():
    #token 必须要做到唯一保存在数据库中，常使用时间戳拼接各种字符串
    token = str(time.time) + str(random.random)
    s = hashlib.sha224()
    s.update(token.encode('utf-8'))
    return s.hexdigest()

#加密密码
def generate_pwd(password):
    s = hashlib.md5()
    s.update(password.encode('utf-8'))
    return s.hexdigest()


#获取token
def gettoken(request):
    # 通过session, 获取token
    token = request.session.get('token')
    # 通过获取的token，获取对象
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
        name = user.name
    else:
        name = None
    return name

#首页
def index(request):
    token = request.session.get('token')
    # 通过获取的token，获取对象
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
        name = user.name
    else:
        name = None

    imgs = Banner.objects.all()

    return render(request,'index.html',context={'name':name,'imgs':imgs})

def register(request):
    if request.method == 'GET':
        return render(request,'register.html')
    elif request.method == 'POST':
        # 获取post请求的数据，并且加入到数据库中
        user = User()
        user.name = request.POST.get('username')
        user.pwd = generate_pwd(request.POST.get('password'))
        user.email = request.POST.get('email')
        user.phonenum = request.POST.get('phonenum')
        user.token = generate_token()
        user.save()

        #通过session,需要request对象,这是token
        request.session['token'] = user.token
        #返回首页的时候，我们需要获取session
        return redirect('wm:index')

def logout(request):
    #第一种，先通过客户端cookie删除 sessionid,再去服务端删除session
    # response = redirect('wm:index')
    # response.delete_cookie('sessionid')
    # del request.session['username']
    # return response

    #第二种，直接在服务端清空
    request.session.flush()
    return redirect('wm:index')

def login(request):
    if request.method == 'GET':
        return render(request,'Login.html')
    elif request.method == 'POST':
        phonenum = request.POST.get('phonenum')
        pwd = generate_pwd(request.POST.get('password'))

        try:
            user = User.objects.get(phonenum=phonenum)
            if user.pwd == pwd:
                user.token = generate_token()
                user.save()
                request.session['token'] = user.token
                return redirect('wm:index')
            else:
                return render(request,'Login.html',{'error':'密码不对'})
        except:
            return render(request,'Login.html',{'error':'账号不存在'})


def detail(request):
    token = request.session.get('token')
    # 通过获取的token，获取对象
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
        name = user.name
    else:
        name = None
    #在商品列表点击图片后,获取对应的cookie
    index = request.COOKIES.get('index')


    shop = Shoplist.objects.get(id=int(index) + 1)
    shopzoom = shop.zoom
    pathlist = shopzoom.split(',')

    shopsmall = shop.small
    shopsmallpath = shopsmall.split(',')

    data = {
        'name':name,
        'shop':shop,
        'pathlist':pathlist,
        'shopsmallpath':shopsmallpath,
    }
    return render(request,'detail.html',data)

def cart(request):
    token = request.session.get('token')
    # 通过获取的token，获取对象
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
        name = user.name
    else:
        name = None
    #通过token获取用户,通过用户获取到Cart对象
    user = User.objects.get(token=token)

    carts = Cart.objects.filter(user=user).exclude(number=0)
    return render(request,'cart.html',{'name':name,'carts':carts})


def shoplist(request):
    token = request.session.get('token')
    # 通过获取的token，获取对象
    users = User.objects.filter(token=token)
    if users.count():
        user = users.first()
        name = user.name
    else:
        name = None
    shoplists = Shoplist.objects.all()

    return render(request,'shoplist.html',context={'name':name,'shoplists':shoplists})


#ajax 局部请求,请求代码在register.js文件中
def check(request):
    phonenum = request.GET.get('phone')
    users = User.objects.filter(phonenum=phonenum)
    if users.exists():
        return JsonResponse({'msg':'账号已存在','status':0})
    else:
        return JsonResponse({'msg':'账号可以使用','status':1})


#ajax,局部请求,请求代码在detail.js文件中
def addcart(request):
    token = request.session.get('token')
    if token:
        #获取商品id
        shopid = int(request.GET.get('shopid'))
        #获取商品数量
        number = int(request.GET.get('number'))


        #尽管在js文件中已经转成int形式了,但是通过请求得到的数据是str类型的,需要进行转换
        # shopid = request.GET.get('shopid')
        # number = request.GET.get('number')
        # print(type(shopid))
        # print(type(shopid))


        #获取用户以及商品对象
        user = User.objects.get(token=token)
        goods = Shoplist.objects.get(pk=shopid)


        #添加购物车
        #需要做一次判断,购物车中是否有该商品,如果有,直接加数量,如果没有,则增加一条记录
        carts = Cart.objects.filter(user=user).filter(goods=goods)

        if carts.exists():  #购物车中有该商品
            cart = carts.first()
            print(type(cart.number))
            print(type(number))
            cart.number += number
            cart.save()
            return JsonResponse({'msg':'增加成功','status':1})
        else:       #购物车中没有该商品
            cart = Cart()
            cart.user = user
            cart.goods = goods
            cart.number = number
            cart.save()
        return JsonResponse({'msg':'添加成功','status':1})
    else:
        #重定向出有问题,出现了login.html的代码,原因是ajax请求用于数据,而不能做出重定向,我们可以去客户端进行重定向
        return JsonResponse({'msg':'添加失败','status':0})


def addgoodsnumber(request):
    goodid = int(request.GET.get('goodid'))
    goods = Shoplist.objects.get(pk=goodid)

    token = request.session.get('token')
    user = User.objects.get(token=token)

    carts = Cart.objects.filter(user=user).filter(goods=goods)
    cart = carts.first()

    cart.number += 1
    cart.save()

    number = cart.number

    return JsonResponse({'msg':'增加成功','status':1,'number':number})


def cutgoodsnumber(request):
    goodid = int(request.GET.get('goodid'))
    goods = Shoplist.objects.get(pk=goodid)

    token = request.session.get('token')
    user = User.objects.get(token=token)

    carts = Cart.objects.filter(user=user).filter(goods=goods)
    cart = carts.first()

    cart.number -= 1
    cart.save()

    number = cart.number

    return JsonResponse({'msg': '减少成功', 'status': 1, 'number': number})


def delgoodsnumber(request):
    goodid = int(request.GET.get('goodid'))
    goods = Shoplist.objects.get(pk=goodid)

    token = request.session.get('token')
    user = User.objects.get(token=token)

    carts = Cart.objects.filter(user=user).filter(goods=goods)
    cart = carts.first()

    cart.number = 0
    cart.save()

    number = cart.number

    return JsonResponse({'msg': '减少成功', 'status': 1, 'number': number})

def changestatus(request):
    cartid = int(request.GET.get('cartid'))
    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect
    cart.save()
    return JsonResponse({'msg':'请求成功'})

def changeallstatus(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user)
    for cart in carts:
        cart.isselect = not cart.isselect
        cart.save()
    return JsonResponse({'msg':'请求成功'})


def generate_identifire():
    tempstr = str(int(time.time())) + str(random.random())
    return tempstr



def order(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    #创建订单对象
    order = Order()
    order.user = user
    order.identifier = generate_identifire()
    order.save()


    carts = Cart.objects.filter(user=user).filter(isselect=True).exclude(number=0)
    #遍历购物车对象,创建多个商品订单对象
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.goods = cart.goods
        orderGoods.number = cart.number
        orderGoods.save()

        #创建一个商品订单对象,就将一个购物车对象的数量改成0
        cart.number = 0

    data = {
        'msg':'成功',
        'status':1,
        'identifier':order.identifier
    }
    return JsonResponse(data)


def orderdetail(request,identifier):
    return render(request,'orderdetail.html')