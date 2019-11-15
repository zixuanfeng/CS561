from django.urls import path
from django.conf.urls import url
from . import views
from . import views

urlpatterns = [
    path('renter_view/', views.renter_view, name="renter_view"),
    path('renter_list/', views.renter_list, name="renter_list"),
    url(r'^payment_page/(?P<warehouse_id>[0-9]+)$', views.payment_page, name="payment_page"),
    url(r'^renter_list/(?P<warehouse_id>[0-9]+)$', views.order_check, name='order_check'),
    url(r'^get_password/(?P<warehouse_id>[0-9]+)$', views.get_password, name="get_password"),
    ]
