from django import forms
from account.models import Warehouse
from account.models import User
from django.forms import ModelForm
SIZE_CHOICES = [
    ('BIG','Big'),
    ('SMALL','Small'),
]
AVALIBLE_CHOICES = [
    ('YES','Yes'),
    ('NO','No'),
]
class updatewarehouseForm(forms.Form):
    name= forms.CharField(label='Name', max_length=100)
    size = forms.IntegerField(label='Size')
    desc = forms.CharField(label='Desc', max_length=100)
    # image = forms.ImageField(label='Image', max_length=100)
    image = forms.CharField(label='Image', max_length=100)
    price = forms.FloatField(label='price')
    # cate = forms.CharField(label='Category',max_length=100)
    cate=forms.ChoiceField(label='Category', choices=SIZE_CHOICES, required=False)
    # Is_avalible=forms.CharField(label='Is Avalible', choices=AVALIBLE_CHOICES,max_length=100)
    Is_avalible=forms.ChoiceField(label='Is Avalible', choices=AVALIBLE_CHOICES, required=False)




