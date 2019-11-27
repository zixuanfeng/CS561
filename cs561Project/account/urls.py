from django.urls import path
from django.contrib.auth import views as auth_views
from . import views
urlpatterns = [
    path('', views.index, name='index'),
    path('signup_for_leander/', views.signup_for_leander, name="signup_for_leander"),
    path('signup_for_renter/', views.signup_for_renter, name="signup_for_renter"),
    path('signup/', views.signup, name="signup"),
    path('login/',auth_views.LoginView.as_view(template_name='account/log-in-page.html'),name='login'),
    path('pay/', views.pay, name="pay"),
    path('board/', views.board, name='board'),
    path('logout/',auth_views.LogoutView.as_view(template_name='account/log-out-page.html'),name='logout'
    ),
    path('signup_for_admin/', views.signup_for_admin, name="signup_for_admin"),
]