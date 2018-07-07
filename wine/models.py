# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Appelation(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50, blank=True, null=True)
    regionid = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'appelation'


class Country(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'country'




class Flavor(models.Model):
    name = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'flavor'


class GrapeFlavorProfile(models.Model):
    id = models.IntegerField(primary_key=True)
    regionid = models.IntegerField(blank=True, null=True)
    grapeid = models.IntegerField(blank=True, null=True)
    dmnt_flavors = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'grape_flavor_profile'


class Region(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=25, blank=True, null=True)
    parent_regionid = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'region'


class Variety(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'variety'


class Vineyard(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100, blank=True, null=True)
    regionid = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'vineyard'