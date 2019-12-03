from django.shortcuts import render
#from django.shortcuts import loader
# Create your views here.
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from account.models import Warehouse
from account.models import User,RenterAccount
from account.models import RentOrder
import random 
from django.utils.timezone import datetime
from django.utils import timezone
from .forms import updateForm,rechargeForm
@login_required
def checking_renting(request):
    renting_list=Warehouse.objects.filter(warehouse_currentuser_use_id=request.user.user_id)
    return render(request, 'renter/checking_renting.html',{'renting_list':renting_list })
@login_required
def recharge(request):
    renter = RenterAccount.objects.get(user_id=request.user.user_id)
    if request.method == 'POST':
        renter = RenterAccount.objects.get(user_id=request.user.user_id)
        renter.balance=renter.balance+int(request.POST.get('amount'))
        renter.save()
        return render(request, 'renter/recharge_success.html')
    else:
        form = rechargeForm()
    return render(
        request,
        'renter/recharge.html',
        {'current_amount': renter.balance,"recharge_form":form})
@login_required
def edit_info(request):
    user = User.objects.get(user_id=request.user.user_id)
    if request.method == 'POST':
        user = User.objects.get(user_id=request.user.user_id)
        user.email=request.POST.get('email')
        user.first_name=request.POST.get('first_name')
        user.last_name=request.POST.get('last_name')
        user.save()
        return render(request, 'renter/update_success.html')
    else:
        form = updateForm()
    return render(
        request,
        'renter/edit_info.html',
        {'user_info': user,"user_update":form})
@login_required
def renter_view(request):
    #template = loader.get_template('')
    return render(request, 'renter/renter_view.html')

@login_required
def renter_list(request):
    #html = Warehouse.warehouse_id
    all_warehouses = Warehouse.objects.filter(warehouse_isavailable=1)
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
    TheWarehouse.warehouse_currentuser_use_id=request.user.user_id
    TheWarehouse.warehouse_isavailable=0
    TheWarehouse.save()
    CurrentOrderId = random.randint(0,9999)
    TheCurrentRent = RentOrder.objects.create(order_id=CurrentOrderId,user_id=request.user.user_id,order_date=datetime.now())
    context = {'The_Warehouse': TheWarehouse , 'The_Current_Rent' : TheCurrentRent}
    return render(request, 'renter/get_password.html',   context)



#def detail(request, warehouse_id):
    #return render(request, 'renter/payment-page.html')
