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

    path('manage_account_renter/', views.manage_account_renter, name="manage_account_renter"),
    url(r'^manage_account_renter/(?P<user_id>[0-9]+)$', views.manage_account_renter_manage, name='manage_account_renter_manage'),
    url(r'^manage_account_renter_del/(?P<user_id>[0-9]+)$', views.manage_account_renter_del, name='manage_account_renter_del'),

    path('manage_account_lender/', views.manage_account_lender, name="manage_account_lender"),
     url(r'^manage_account_lender_del/(?P<user_id>[0-9]+)$', views.manage_account_lender_del, name='manage_account_lender_del'),
     url(r'^manage_account_lender/(?P<user_id>[0-9]+)$', views.manage_account_lender_manage, name='manage_account_lender_manage'),
    ]