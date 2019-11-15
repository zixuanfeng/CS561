from django.urls import path
from django.conf.urls import url
from . import views
from . import views
from django.contrib.auth import views as auth_views
app_name="lender"
urlpatterns = [
    path('lender_view/', views.lender_view, name="lender_view"),
    path('update_warehouse/', views.update_warehouse, name="update_warehouse"),
    path('update_warehouse_success/', views.update_warehouse_success, name="update_warehouse_success"),
    ]