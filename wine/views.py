from django.views.generic.list import ListView
from wine.models import Appelation, Region


# Create your views here.

class ListAppelationView(ListView):
    #model=Region
    template_name='index.html'
    #context_object_name='regions'

    def get_context_data(slfe, **kwargs):
        context = super().get_context_data(**kwargs)
        context['appelations'] = Appelation
        return context

#class ListAppelationView(ListView):
#    model=Appelation
#    template_name='index.html'
#    context_object_name='appelations'


