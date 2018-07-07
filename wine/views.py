from django.views.generic.list import ListView
from wine.models import Appelation, Region


# Create your views here.
class ListAppelationView(ListView):
    model=Appelation
    template_name='index.html'

class ListRegionView(ListView):
    model=Region
    template_name='index.html'
