from django.test import TestCase
from account.models import Warehouse
#from .models import models
from django.test.client import Client 
# Create your tests here.
class UserModelCase(TestCase):
    def setUp(self):
        print("==Unit test for Renter Warehouse")
        """
        warehouse:{
            warehouse_id: 666
            warehouse_name : ware_unittest
            warehouse_size :100
        }
        check renter delete
        """
        print("==Warehouse in setup")
        Warehouse.objects.create( warehouse_id='666', warehouse_name='ware_unittest', warehouse_size='100')

    def test_checkwarehouse(self):
       # response = self.client.get("signup_for_renter/")
       # response = self.client.post('login/', date = self.login_user)
       # self.assertEqual(response.status_code, 200)
       # self.assertIn('error',response.content)
        res = Warehouse.objects.get(warehouse_id='666')
        print("Warehouse Test ID is 666 and equal name with ware_unittest ")
        self.assertEqual(res.warehouse_name,"ware_unittest")
    def tearDown(self):
        print("==Warehouse data in tearDown")
