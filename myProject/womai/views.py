import hashlib
import random
import time
from django.http import HttpResponse
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

#
def generate_pwd(password):
    s = hashlib.md5()
    s.update(password.encode('utf-8'))
    return s.hexdigest()

def index(request):
    #通过session, 获取token
    token = request.session.get('token')
    #通过获取的token，获取对象
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
        user.pwd = generate_pwd(request.POST.get('password1'))
        user.emph = request.POST.get('emph')
        user.phonenum = request.POST.get('phonenumber')
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
        name = request.POST.get('username')
        pwd = generate_pwd(request.POST.get('password'))
        users = User.objects.filter(name=name).filter(pwd=pwd)
        if users.count():
            #重新通过session，设置token,token需要重新生成
            user= users.first()
            user.token = generate_token()
            user.save()
            request.session['token'] = user.token
            return redirect('wm:index')
        else:
            return HttpResponse('用户名或者密码不正确')





