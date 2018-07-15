from django import forms
from wine.models import Region, Country
from django.db.models import Q

class AppelationForm(forms.Form):
   
    name = forms.CharField(label='Appelation(s) Name', widget= forms.Textarea) 
    country = forms.ChoiceField(choices = [])
    pregion = forms.ChoiceField(choices = [])

    def __init__(self, *args, **kwargs):
        print ("init")
        super(AppelationForm, self).__init__(*args, **kwargs)
        countrylist = []
        country_qs = Country.objects.values('id','name')
        countrylist =  [(q['id'], q['name']) for q in country_qs]

        regionlist = []
        region_qs = Region.objects.filter(Q(country_id=6) | Q(id=-1)).values('id','name').order_by('id')
        regionlist =  [(q['id'], q['name']) for q in region_qs]

        print (regionlist)
        #if( len(region_qs) == 0):
        #    region_qs = regionlist
        self.fields["country"] = forms.ChoiceField(choices= countrylist)
        self.fields["pregion"] = forms.ChoiceField(label='Parent Region', choices=regionlist)