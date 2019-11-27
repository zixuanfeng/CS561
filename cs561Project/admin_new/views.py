from django.shortcuts import render
from django.shortcuts import render
#from django.shortcuts import loader
# Create your views here.
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from account.models import Warehouse
from account.models import User
import random
@login_required
def view_lender(request):
    all_lender = User.objects.filter(root=1)
    context = {'all_lender': all_lender}
    return render(request, 'admin_new/admin_view_lender.html', context)
@login_required
def view_renter(request):
    all_renter = User.objects.filter(root=2)
    context = {'all_renter': all_renter}
    return render(request, 'admin_new/admin_view_renter.html', context)
@login_required
def view_warehouse_list(request):
    all_warehouse = Warehouse.objects.filter()
    context = {'all_warehouse': all_warehouse}
    return render(request, 'admin_new/admin_view_warehouse.html', context)
@login_required
def view_warehouse_list_manage(request):
    all_warehouse = Warehouse.objects.filter()
    context = {'all_warehouse': all_warehouse}
    return render(request, 'admin_new/admin_view_manage_warehouse.html', context)
@login_required
def Warehouse_manage(request,warehouse_id):
    TheWarehouse = Warehouse.objects.get(warehouse_id = warehouse_id)
    context = {'The_Warehouse' : TheWarehouse}
    return render(request, 'admin_new/manage_warehouse_confirm.html', context )
@login_required
def admin_new_view(request):
    return render(request, 'admin_new/admin_view.html')
@login_required
def warehouse_del(request,warehouse_id):
    TheWarehouse = Warehouse.objects.get(warehouse_id = warehouse_id)
    TheWarehouse.delete()
    return render(request, 'admin_new/warehouse_del_success.html')
@login_required
def manage_account_lender(request):
    manage_account_lender = User.objects.filter(root=1)
    context = {'all_account': manage_account_lender}
    return render(request, 'admin_new/admin_manage_account_lender.html', context)    
@login_required
def manage_account_renter(request):
    manage_account_renter = User.objects.filter(root=2)
    context = {'all_account': manage_account_renter}
    return render(request, 'admin_new/admin_manage_account_renter.html', context)

@login_required
def manage_account_renter_del(request,user_id):
    user = User.objects.get(user_id = user_id)
    user.delete()
    return render(request, 'admin_new/renter_del_success.html')
@login_required
def manage_account_lender_del(request,user_id):
    user = User.objects.get(user_id = user_id)
    user.delete()
    return render(request, 'admin_new/lender_del_success.html')
@login_required
def manage_account_renter_manage(request,user_id):
    user = User.objects.get(user_id = user_id)
    context = {'confirm' : user}
    return render(request, 'admin_new/manage_renter_confirm.html', context )
@login_required
def manage_account_lender_manage(request,user_id):
    user = User.objects.get(user_id = user_id)
    context = {'confirm' : user}
    return render(request, 'admin_new/manage_lender_confirm.html', context )
