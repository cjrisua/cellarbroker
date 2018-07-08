from django.utils import timezone
from django.views.generic import ListView


from wine.models import Appelation, Region


# Create your views here.
class ListAppelationView(ListView):
    model = Appelation
    template_name='index.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['regions'] = Region.objects.all()
        return context