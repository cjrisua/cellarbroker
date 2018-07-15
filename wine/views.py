#from django.utils import timezone
from django.views import generic
from django.views.generic.edit import CreateView, UpdateView, DeleteView #, ListView
from django.urls import reverse_lazy

from wine.models import Appelation, Region, Country

from django.contrib.admin.sites import AlreadyRegistered
from django.apps import apps

from .forms import AppelationForm
from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.db.models import Q

def load_regions(request):
    countryid = request.GET.get('country')
    print ("Load Cities for {0}".format(countryid))
    regions = Region.objects.filter(Q(country_id=countryid) | Q(id=-1)).order_by('name')
    
    return render(request,'region_dropdown_list_options.html', {'regions':regions})

def appelationEntry(request):
    print("View!!")
    if request.method == 'POST':
        #print ('is a POST')
        form = AppelationForm(request.POST)
        if form.is_valid():
            #print ('check is valid')
            appelationname = request.POST.get('name')
            countryid = request.POST.get('country')
            pregionid = request.POST.get('pregion')
            countryobject = Country.objects.get(pk=countryid)
            print(countryid)
            appeletionname = str(Region.objects.filter(country_id=countryid).values('name')).strip()
            for s in [s.strip() for s in appelationname.splitlines()]:
                regionobject = Region(name=s, country = countryobject, parent_regionid = pregionid)
                regionobject.save()
            return HttpResponseRedirect("/wine/appelation/parentlist")
    else:
        #print ('must be a get')
        form = AppelationForm()
    #print ('retun to home.html')
    return render(request, 'home.html', {'form': form})


# Create your views here.
#class ListAppelationView(ListView):
#    model = Appelation
#    template_name='index.html'
#
#    def get_context_data(self, **kwargs):
#        context = super().get_context_data(**kwargs)
#        context['regions'] = Region.objects.all()
#        return context

class ListTables():
    context_object_name = 'wine_tables_list'
    template_name = 'models-table.html'
 
    def get_table_names():
        return list(filter(lambda n: 'wine' in n, map(lambda x: x._meta.db_table, apps.get_models('wine'))))

class IndexView(generic.ListView):
    # name of the object to be used in the index.html
    context_object_name = 'country_list'
    template_name = 'index.html'
 
    def get_queryset(self):
        data = Country.objects.all()
        return { 'rowcount' : len(data),
                 'data' : data ,}

class RegionView(generic.ListView):
    # name of the object to be used in the index.html
    context_object_name = 'region_list'
    template_name = 'index.html'
 
    def get_queryset(self):
        data = Region.objects.all()
        return { 'rowcount' : len(data),
                 'data' : data ,}

# view for the product entry page
class RegionEntry(CreateView):
    model = Region
    template_name='region_form.html'
    # the fields mentioned below become the entry rows in the generated form
    fields = ['name','country']


class AppelationView(generic.ListView):
    # name of the object to be used in the index.html
    context_object_name = 'appelation_list'
    template_name = 'index.html'
 
    def get_queryset(self):
        data = Appelation.objects.all()
        return { 'rowcount' : len(data),
                 'data' : data ,}

# view for the product entry page
class AppelationEntry(CreateView):
    model = Appelation
    template_name='region_form.html'
    # the fields mentioned below become the entry rows in the generated form
    fields = ['name','region']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        


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

 