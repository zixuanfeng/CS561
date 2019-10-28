from django.urls import path
from django.conf.urls import url

from . import views

urlpatterns = [
    path('renter_view/', views.renter_view, name="renter_view"),
    path('renter_list/', views.renter_list, name="renter_list"),
    #path('payment_page/', views.payment_page, name="payment_page"),
    url(r'^renter_list/', views.order_check, name='order_check'),

    ]
    #