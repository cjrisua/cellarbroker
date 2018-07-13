from django import template
from wine.views import ListTables

register = template.Library()

@register.inclusion_tag('models-table.html')
def table_sidebar():
    entries = ListTables.get_table_names()
    return {'tables': entries}