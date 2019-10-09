from django.contrib.auth.forms import UserCreationForm
from .models import User


class UserCreate(UserCreationForm):
    class Meta:
        model = User
        fields = ("username", "first_name", "last_name", "email")