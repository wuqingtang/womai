from django.db import models

class User(models.Model):
    name = models.CharField(max_length=30)
    phonenum = models.CharField(max_length=255,unique=True)
    pwd = models.CharField(max_length=255)
    email = models.CharField(max_length=50)
    token = models.CharField(max_length=255)

    def __str__(self):
        return self.name



class Banner(models.Model):
    bid = models.IntegerField()
    headImg = models.CharField(max_length=100)
    bgcolor = models.CharField(max_length=20)
    opicaty = models.IntegerField()

    def __str__(self):
        return str(self.bid)

'''
{	
		"id": 1001,
		"name": "【自营】蒙牛纯甄巴氏杀菌热处理风味酸牛奶利乐钻200g*24/箱",
		"price" : 84.90,
		"unit": "￥",
		"headImg": "img/indeximg/mad-01.jpg",
		"zoom": ["../img/detailimg/common1-01.jpg","../img/detailimg/common1-02.jpg","../img/detailimg/common1-03.jpg","../img/detailimg/common1-04.jpg"],
		"small":["../img/detailimg/small01-01.jpg","../img/detailimg/small01-02.jpg","../img/detailimg/small01-03.jpg","../img/detailimg/small01-04.jpg"]
		 
	},
	'''
class Shoplist(models.Model):
    sip = models.PositiveIntegerField()
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=8,decimal_places=2)
    headImg = models.CharField(max_length=100)
    unit = models.CharField(max_length=5)
    zoom = models.CharField(max_length=255)
    small = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class Cart(models.Model):
    user = models.ForeignKey(User)

    goods = models.ForeignKey(Shoplist)

    number = models.PositiveIntegerField()

    isselect = models.BooleanField(default=True)

    def __str__(self):
        return str(self.number)


#订单表,一个用户有多个订单
class Order(models.Model):

    user = models.ForeignKey(User)

    #订单的状态 未付款,付款,等等
    status = models.IntegerField(default=0)

    #订单创建时间,自动生成
    createtime = models.DateTimeField(auto_now_add=True)

    #订单编号
    identifier = models.CharField(max_length=256)

    def __str__(self):
        return self.identifier


#订单商品表
#一个订单 有多个商品
class OrderGoods(models.Model):
    # 订单
    order = models.ForeignKey(Order)
    # 商品
    goods = models.ForeignKey(Shoplist)
    # 商品规格
    number = models.IntegerField()

    def __str__(self):
        return str(self.number)







