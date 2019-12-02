from django.test import TestCase
from .models import User, RentOrder, RenterAccount, Warehouse
#from .models import models
from django.test.client import Client 
# Create your tests here.
class UserModelCase(TestCase):
    def setUp(self):
        print("==Unit test for ALL USER(LENDER AND RENTER) signUp")
        """
        RenterSignUp:{
            "username": "Rentertest"
            "password": "Asdf1029"
            "email": "Rentertest@gmail.com"
            "root": "1"
        }
        LenderSignUp:{
            "username": "Lendertest"
            "password": "Asdf1029"
            "email": "Lendertest@gmail.com"
            "root": "2"
        }
        """
        print("==User in setup")
        User.objects.create( username='Rentertest', password='Asdf1029', email='Rentertest@gmail.com',user_id=1002)
        User.objects.create( username='Lendertest', password='Asdf1029', email='Lendertest@gmail.com',user_id=1003)
        self.login_renter={'username':'Rentertest','password':'Asdf1029'}
        self.login_lender={'username':'Lendertest','password':'Asdf1029'}

    def test_signUp(self):
       # response = self.client.get("signup_for_renter/")
        response = self.client.post('login/', date = self.login_renter)
        response = self.client.post('login/', date = self.login_lender)
        #self.assertEqual(response.status_code, 200)
       # self.assertIn('error',response.content)
        res1 = User.objects.get(username='Rentertest')
        res2 = User.objects.get(username='Lendertest')
        print("Test Renter name is Rentertest and equal email with Rentertest@gmail.com ")

        print("Test Lender name is Lendertest and equal email with Lendertest@gmail.com ")
        self.assertEqual(res1.email,"Rentertest@gmail.com")
        self.assertEqual(res2.email,"Lendertest@gmail.com")
    def tearDown(self):
        print("==User data in tearDown")