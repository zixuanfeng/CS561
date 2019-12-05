from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from .models import User,RenterAccount,LenderAccount
from .forms import  UserCreate
from django.db.models import Q
import uuid
import random
from django.contrib.auth import authenticate, login
from django.contrib.auth.hashers import (
    check_password, is_password_usable, make_password,
)
from django.utils import timezone
import datetime
def index(request):
    return render(request, 'account/index.html')
@login_required
def board(request):
    return render(request, 'account/board.html')
@login_required
def pay(request):
    return render(request, 'account/Payment-page.html')    
def signup_for_leander(request):
    if request.method == 'POST':
        new_user_sign_up=UserCreate(request.POST)
        if new_user_sign_up.is_valid():
            usernew=new_user_sign_up.save(commit=False)
            usernew.set_password(
                new_user_sign_up.cleaned_data['password1']
            )
            usernew.user_id=random.randint(0,999999999)
            try:
                user=User.objects.get(username = new_user_sign_up.cleaned_data['username'])
            except Exception as a:
                user=None
            if user:
                return render(request, 'account/user_exists.html', )
            else:
                usernew.root=1
                usernew.save()
                leander=LenderAccount()
                leander.use=usernew
                leander.balance=200
                leander.save()
                return render(
                    request,
                    'account/finsh_sign_up.html',
                    {'usernew': usernew}
                )
    else:
        new_user_sign_up = UserCreate()
    return render(
        request,
        'account/sign-up-page.html',
        {'new_user_sign_up': new_user_sign_up}
    )

def signup_for_renter(request):
    if request.method == 'POST':
        new_user_sign_up=UserCreate(request.POST)
        if new_user_sign_up.is_valid():
            usernew=new_user_sign_up.save(commit=False)
            usernew.set_password(
                new_user_sign_up.cleaned_data['password1']
            )
            usernew.user_id=random.randint(0,999999999)
            try:
                user=User.objects.get(username = new_user_sign_up.cleaned_data['username'])
            except Exception as a:
                user=None
            if user:
                return render(request, 'account/user_exists.html', )
            else:
                usernew.root=2
                usernew.save()
                renter=RenterAccount()
                renter.user_id=usernew.user_id
                renter.balance=200
                renter.save()
                return render(
                    request,
                    'account/finsh_sign_up.html',
                    {'usernew': usernew}
                )
    else:
        new_user_sign_up = UserCreate()
    return render(
        request,
        'account/sign-up-page.html',
        {'new_user_sign_up': new_user_sign_up}
    )
def signup(request):
    return render(request, 'account/identify-user-type.html')
class logInWithEmailorUserName:
    def authenticate(self, request, username=None, password=None):
        try:
            user = User.objects.get(Q(username=username)|Q(email=username))
            if user.new_check_password(password,user.password):
                user.last_login=datetime.datetime.now()
                return user
            return None
        except User.DoesNotExist:
            return None
    def get_user(self, user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None
def signup_for_admin(request):
    if request.method == 'POST':
        new_user_sign_up=UserCreate(request.POST)
        if new_user_sign_up.is_valid():
            usernew=new_user_sign_up.save(commit=False)
            usernew.set_password(
                new_user_sign_up.cleaned_data['password1']
            )
            usernew.user_id=random.randint(0,999999999)
            try:
                user=User.objects.get(username = new_user_sign_up.cleaned_data['username'])
            except Exception as a:
                user=None
            if user:
                return render(request, 'account/user_exists.html', )
            else:
                usernew.root=0
                usernew.save()
                return render(
                    request,
                    'account/finsh_sign_up.html',
                    {'usernew': usernew}
                )
    else:
        new_user_sign_up = UserCreate()
    return render(
        request,
        'account/sign-up-page.html',
        {'new_user_sign_up': new_user_sign_up}
    )