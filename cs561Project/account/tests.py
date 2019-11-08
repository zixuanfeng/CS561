from django.test import TestCase
from .models import User, RentOrder, RenterAccount, Warehouse
#from .models import models
from django.test.client import Client 
# Create your tests here.
class UserModelCase(TestCase):
    def setUp(self):
        print("==Unit test for signUp")
        """
       SignUp:{
            "username": "test"
            "password": "Asdf1029"
            "email": "test@gmail.com"
            "root": "1"
        }
        """
        print("==User in setup")
        User.objects.create( username='test', password='Asdf1029', email='test@gmail.com',user_id=1002)
        self.login_user={'username':'testsignup','password':'Asdf1029'}

    def test_signUp(self):
       # response = self.client.get("signup_for_renter/")
        response = self.client.post('login/', date = self.login_user)
        #self.assertEqual(response.status_code, 200)
       # self.assertIn('error',response.content)
        res = User.objects.get(username='test')
        print("Test User name is test and equal email with test@gamil.com ")
        self.assertEqual(res.email,"test@gmail.com")
    def tearDown(self):
        print("==User in tearDown")