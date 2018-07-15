# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.apps import apps
from django.urls import reverse

class Country(models.Model):
    name = models.CharField(max_length=25, blank=True, null=True)

    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('wine:index')

class Region(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True)
    country = models.ForeignKey(Country, on_delete=models.SET_NULL, null=True)
    parent_regionid = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name

class Appelation(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    region = models.ForeignKey(Region, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.name

class Vineyard(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True)
    region = models.ForeignKey(Region, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.name

class Flavor(models.Model):
    name = models.CharField(max_length=25, blank=True, null=True)

    def __str__(self):
        return self.name

class Grape(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=25, blank=True, null=True)

    def __str__(self):
        return self.name

class GrapeFlavorProfile(models.Model):
    id = models.AutoField(primary_key=True)
    region = models.ForeignKey(Region, on_delete=models.SET_NULL, null=True)
    grape = models.ForeignKey(Grape, on_delete=models.SET_NULL, null=True)
    dmnt_flavors = models.TextField(blank=True, null=True)  # This field type is a guess.

    def __str__(self):
        return self.id

