from django.urls import path
from wine.views import ListAppelationView, ListRegionView

urlpatterns = [
    path('',ListAppelationView.as_view(), name='index'),
]