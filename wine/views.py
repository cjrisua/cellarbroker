#from django.utils import timezone
from django.views import generic
from django.views.generic.edit import CreateView, UpdateView, DeleteView #, ListView
from django.urls import reverse_lazy

from wine.models import Appelation, Region, Country


# Create your views here.
#class ListAppelationView(ListView):
#    model = Appelation
#    template_name='index.html'
#
#    def get_context_data(self, **kwargs):
#        context = super().get_context_data(**kwargs)
#        context['regions'] = Region.objects.all()
#        return context

class IndexView(generic.ListView):
    # name of the object to be used in the index.html
    context_object_name = 'country_list'
    template_name = 'index.html'
 
    def get_queryset(self):
        return Country.objects.all()

# view for the product entry page
class CountryEntry(CreateView):
    model = Country
    template_name='country_form.html'
    # the fields mentioned below become the entry rows in the generated form
    fields = ['name']

class CountryUpdate(UpdateView):
    model = Country
    template_name='country_form.html'
    # the fields mentioned below become the entyr rows in the update form
    fields = ['name']

class CountryDelete(DeleteView):
    model = Country
    template_name='country_confirm_delete.html'
    # the delete button forwards to the url mentioned below.
    success_url = reverse_lazy('wine:index')

 