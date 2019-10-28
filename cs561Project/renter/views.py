from django.shortcuts import render
#from django.shortcuts import loader
# Create your views here.

from django.http import HttpResponse
from account.models import Warehouse
from django.contrib.auth.decorators import login_required

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
def order_check(request):
    all_warehouses = Warehouse.objects.all()
    context = {'all_warehouses': all_warehouses}
    return render(request, 'renter/order_check.html')


#def detail(request, warehouse_id):
    #return render(request, 'renter/payment-page.html')