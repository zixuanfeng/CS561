from django.urls import path
from django.contrib.auth import views as auth_views

from . import views
urlpatterns = [
    path('', views.index, name='index'),
    path('signup/', views.signup, name="signup"),
    path('login/',auth_views.LoginView.as_view(template_name='account/log-in-page.html'),name='login'),
    path('pay/', views.pay, name="pay"),
    path('board/', views.board, name='board'),
    path('logout/',auth_views.LogoutView.as_view(template_name='account/log-out-page.html'),name='logout'
    ),
]