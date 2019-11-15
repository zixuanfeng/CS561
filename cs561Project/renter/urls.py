from django.urls import path
from django.conf.urls import url
from . import views
from . import views
app_name="renter"
urlpatterns = [
    path('renter_view/', views.renter_view, name="renter_view"),
    path('renter_list/', views.renter_list, name="renter_list"),
    path('payment_page/', views.payment_page, name="payment_page"),
    url(r'^renter_list/(?P<warehouse_id>[0-9]+)$', views.order_check, name='order_check'),
    path('get_password/', views.get_password, name="get_password"),
    # path('checking_renting/', views.checking_renting, name="checking_renting"),
    # path('personal_information/', views.personal_information, name="personal_information"),
    ]
