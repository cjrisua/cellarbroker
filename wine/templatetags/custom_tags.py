from django import template
from wine.views import ListTables

register = template.Library()

@register.inclusion_tag('models-table.html')
def table_sidebar():
    entries = []
    for e in ListTables.get_table_names():
        tableinfo = { 'name': str(e),'view':'{0}/view'.format(str(e).replace('wine_',''))}
        entries.append(tableinfo)
    print(entries)
    return {'tables': entries}