from django.shortcuts import render
#from django.shortcuts import loader
# Create your views here.
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from .models import Warehouse
from .models import User
from .models import RentOrder
import random
from django.utils.timezone import datetime

@login_required
def renter_view(request):
    #template = loader.get_template('')
    return render(request, 'renter/renter_view.html')

@login_required
def renter_list(request):
    #html = Warehouse.warehouse_id
    all_warehouses = Warehouse.objects.all()
    context = {'all_warehouses': all_warehouses}

    return render(request, 'renter/renter_list.html', context)
@login_required
def order_check(request, warehouse_id):
    TheWarehouse = Warehouse.objects.get(warehouse_id = warehouse_id)
    context = {'The_Warehouse' : TheWarehouse}
    return render(request, 'renter/order_check.html', context )

@login_required
def payment_page(request,warehouse_id):
    TheWarehouse = Warehouse.objects.get(warehouse_id=warehouse_id)
    context = {'The_Warehouse': TheWarehouse}
    return render(request, 'renter/payment_page.html',context)


@login_required
def get_password(request,warehouse_id):
    TheWarehouse = Warehouse.objects.get(warehouse_id=warehouse_id)
    TheWarehouse.current_password = random.randint(0,999999999)
    TheWarehouse.warehouse_currentowenr_use_id=request.user.user_id
    TheWarehouse.save()
    CurrentOrderId = random.randint(0,9999)
    TheCurrentRent = RentOrder.objects.create(order_id=CurrentOrderId)
    TheCurrentRent.user_id = request.user.user_id
    today = datetime.today()
    TheCurrentRent.order_date = today
    context = {'The_Warehouse': TheWarehouse}
    return render(request, 'renter/get_password.html',  context)



#def detail(request, warehouse_id):
    #return render(request, 'renter/payment-page.html')