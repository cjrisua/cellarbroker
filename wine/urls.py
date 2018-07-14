from django.urls import path
from wine import views

app_name = 'wine'

urlpatterns = [
    #path('', ListAppelationView.as_view(), name='index'),
    path('', views.IndexView.as_view(), name='index'),
    path('appelation/view', views.AppelationView.as_view(), name='appelation-view'),
    path('region/view', views.RegionView.as_view(), name='region-view'),
    path('region/entry',views.RegionEntry.as_view(),name='region-entry'),
    path('models/table', views.ListTables, name='models-table'),
    path('country/entry',views.CountryEntry.as_view(),name='country-entry'),
    path('country/update/<int:pk>',views.CountryUpdate.as_view(),name='country-update'),
    path('country/delete/<int:pk>',views.CountryDelete.as_view(),name='country-delete'),
]