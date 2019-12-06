from django.test import TestCase
from .models import User, RentOrder, RenterAccount, Warehouse
#from .models import models
from django.test.client import Client 
# Create your tests here.
class UserModelCase(TestCase):
    def setUp(self):
        print("==Unit test for ALL USER(LENDER AND RENTER) signUp")
        """
         AdminSignUp:{
            "username": "Admintest"
            "password": "Asdf1029"
            "email": "Admintest@gmail.com"
            "root": "0"
        }
        """
        print("==User in setup")
        User.objects.create( username='Admintest', password='Asdf1029', email='Admintest@gmail.com',user_id=1003)
        
        self.login_lender={'username':'Admintest','password':'Asdf1029'}

    def test_signUp(self):
       # response = self.client.get("signup_for_renter/")
        response = self.client.post('login/', date = self.login_Admin)

        #self.assertEqual(response.status_code, 200)
       # self.assertIn('error',response.content)
        res3 = User.objects.get(username='Admintest')
        
       print("Test Lender name is Admintest and equal email with Admintest@gmail.com ")
        
        self.assertEqual(res3.email,"Admintest@gmail.com")

    def tearDown(self):
        print("==User data in tearDown")