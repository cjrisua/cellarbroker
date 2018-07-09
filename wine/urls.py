from django.urls import path
from wine import views

app_name = 'wine'

urlpatterns = [
    #path('', ListAppelationView.as_view(), name='index'),
    path('', views.IndexView.as_view(), name='index'),
    path('country/entry',views.CountryEntry.as_view(),name='country-entry'),
    path('country/update/<int:pk>',views.CountryUpdate.as_view(),name='country-update'),
    path('country/delete/<int:pk>',views.CountryDelete.as_view(),name='country-delete'),
]