import os
import pandas as pd
import numpy as np
from sodapy import Socrata
from gmplot import gmplot


class CrimeData():
  
  def __init__(self, region):
    self.top = region[0][0]
    self.bottom = region[1][0]
    self.left = region[0][1]
    self.right = region[1][1]
    
  def load(self, dataset_id, domain, socrata_token, start_year, max_crimes):
    client = Socrata(domain, socrata_token)
    incident_id = start_year * (10**7)
    query = "incident_report_number > " + str(incident_id) + \
            " and incident_report_number < 20210000000 " + \
            " and latitude > " + str(self.bottom) + \
            " and latitude < " + str(self.top) + \
            " and longitude > " + str(self.left) + \
            " and longitude < " + str(self.right)
    dataset = client.get(dataset_id, where = query, limit = max_crimes)
    df = pd.DataFrame.from_dict(dataset)
  
  def crime_count(self):
    try:
      return df[incident_report_number].count()
    except:
      print('No dataset has been loaded into this instance')
  
  def markermap(self):
    center_lat = self.bottom + (self.top - self.bottom) / 2
    center_lng = self.right + (self.left - self.right) / 2
    gmap = gmplot.GoogleMapPlotter(center_lat, center_lng, 17)
    try:
      lat_coordinates = df['latitude'].astype('float').tolist()
      lng_coordinates = df['longitude'].astype('float').tolist()
      gmap.scatter(lat_coordinates, lng_coordinates, '#FF0000', size=5, marker=False)
      return gmap
    except:
      print('No dataset has been loaded into this instance')
    
  def heatmap(self):
    center_lat = self.bottom + (self.top - self.bottom) / 2
    center_lng = self.right + (self.left - self.right) / 2
    gmap = gmplot.GoogleMapPlotter(center_lat, center_lng, 17)
    try:
      lat_coordinates = df['latitude'].astype('float').tolist()
      lng_coordinates = df['longitude'].astype('float').tolist()
      gmap.heatmap(lat_coordinates, lng_coordinates, radius=30)
      return gmap
    except:
      print('No dataset has been loaded into this instance')
  
  def close(self):
    client.close()
