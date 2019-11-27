from django.urls import path
from django.conf.urls import url
from . import views
from . import views
from django.contrib.auth import views as auth_views
app_name="admin_new"
urlpatterns = [
    path('admin_new_view/', views.admin_new_view, name="admin_new_view"),
    path('view_lender/', views.view_lender, name="view_lender"),
    path('view_renter/', views.view_renter, name="view_renter"),
    path('view_warehouse_list_manage/', views.view_warehouse_list_manage, name="view_warehouse_list_manage"),
    path('view_warehouse_list/', views.view_warehouse_list, name="view_warehouse_list"),
    # path('view_order/', views.view_order, name="view_order"),
    url(r'^view_warehouse_list/(?P<warehouse_id>[0-9]+)$', views.Warehouse_manage, name='Warehouse_manage'),
    url(r'^warehouse_del/(?P<warehouse_id>[0-9]+)$', views.warehouse_del, name='warehouse_del'),
    ]