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
    path('edit_info/', views.edit_info, name="edit_info"),
    path('check_own_warehouse/', views.check_own_warehouse, name="check_own_warehouse"),
     path(
        'password_change/',
        auth_views.PasswordChangeView.as_view(
            template_name='lender/password_change.html'
        ),
        name='password_change'
    ),
    path(
        'password_change_done/',
        auth_views.PasswordChangeDoneView.as_view(
            template_name='lender/password_change_done.html'
        ),
        name='password_change_done'
    ),
    ]