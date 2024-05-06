from django.contrib import admin
from django.urls import path

from weather import views

urlpatterns = [
    path('',views.temperaturas_city,name="weather"),
    path('response/',views.response_temperaturas, name="weather_2")
]