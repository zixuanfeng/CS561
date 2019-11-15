from django.shortcuts import render
from django.shortcuts import render
#from django.shortcuts import loader
# Create your views here.
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from account.models import Warehouse
from account.models import User
import random
from .forms import updatewarehouseForm
# Create your views here.
@login_required
def lender_view(request):
    return render(request, 'lender/lender_view.html')
@login_required
def update_warehouse(request):
    if request.method == 'POST':
        id=random.randint(0,999999999)
        name=request.POST.get('name')
        size=request.POST.get('size')
        desc=request.POST.get('desc')
        image=request.POST.get('image')
        price=request.POST.get('price')
        cate=request.POST.get('cate')
        if request.POST.get('Is_avalible') == 'YES':
            Is_avalible=1
        else:
            Is_avalible=0
        # update={'warehouse_id':random.randint(0,999999999),'warehouse_name':name,'warehouse_size':size,'warehouse_desc':desc,'warehouse_image':image,'warehouse_price':price,'wareshouse_category':cate,'warehouse_isAvailable':Is_avalible,'warehouse_currentowenr_use_id':request.user.user_id}
        warehouse = Warehouse.objects.create(warehouse_id=id,warehouse_name=name,warehouse_size=size,warehouse_desc=desc,warehouse_image=image,warehouse_price=price,warehouse_category=cate,warehouse_isavailable=Is_avalible,warehouse_currentowenr_use_id=request.user.user_id)
        warehouse.save()
        TheWarehouse = Warehouse.objects.get(warehouse_id = id)
        return render(request, 'lender/update_check.html' , {'The_Warehouse':TheWarehouse} )
        
    else:
        form = updatewarehouseForm()
    return render(
        request,
        'lender/update_warehouse.html',
        {"warehouse_update":form}
    )
@login_required
def update_warehouse_success(request):
    return render(request, 'lender/update_warehouse_success.html')
