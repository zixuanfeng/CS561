from django.shortcuts import render
#from django.shortcuts import loader
# Create your views here.
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from account.models import Warehouse
from account.models import User
import random


# @login_required
# def checking_renting(request):
   
#     renting_list=Warehouse.objects.get(warehouse_currentow)
#     user = User.objects.get(Q(username=username)|Q(email=username))
#     return render(request, 'renter/checking_renting.html')

# @login_required
# def personal_information(request,username,email):
#     if request.method == 'POST':
#         name=username
#         mail=email
#         if name == ''|mail == '':
#             return render(request, 'renter/personal_information.html')
#         user = User.objects.get(user_id=request.user.user_id)
#         user.email=email
#         user.username=name
#         user.save()
#         return render(request, 'renter/update_success.html')
#     else:
#         user = User.objects.get(user_id=request.user.user_id)
#     return render(
#         request,
#         'renter/personal_information.html',
#         {'user_info': user}
#     )

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
def payment_page(request):
    return render(request, 'renter/payment_page.html')


@login_required
def get_password(request):
    raran = random.randint(0, 999999999)
    context = {'raran' : raran}
    return render(request, 'renter/get_password.html' , context)



#def detail(request, warehouse_id):
    #return render(request, 'renter/payment-page.html')