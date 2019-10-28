from django.shortcuts import render
#from django.shortcuts import loader
# Create your views here.

from django.http import HttpResponse
from .models import Warehouse


def renter_view(request):
    #template = loader.get_template('')
    return render(request, 'renter/renter_view.html')


def renter_list(request):
    #html = Warehouse.warehouse_id
    all_warehouses = Warehouse.objects.all()
    context = {'all_warehouses': all_warehouses}

    return render(request, 'renter/renter_list.html', context)

def order_check(request):
    all_warehouses = Warehouse.objects.all()
    context = {'all_warehouses': all_warehouses}
    return render(request, 'renter/order_check.html')

#
#def detail(request, warehouse_id):
    #return render(request, 'renter/payment-page.html')