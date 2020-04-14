import os
import pandas as pd
import numpy as np
from sodapy import Socrata
from gmplot import gmplot

dataset_id = 'fdj4-gpfu'
domain = 'data.austintexas.gov'
client = Socrata(domain, None)

results = client.get(dataset_id)
df = pd.DataFrame.from_dict(results)

# UT austin region: latitude and longitude
top_left = (30.287402, -97.754840)
bottom_right = (30.282200, -97.748456)
UTregion = [top_left, bottom_right]

class CrimeData():
  
  def __init__(self, region):
    self.top = region[0][0]
    self.bottom = region[1][0]
    self.left = region[0][1]
    self.right = region[1][1]
    
  def load(self, dataset_id, domain, socrata_token, start_date, max_crimes):
    client = Socrata(domain, socrata_token)
    query = "incident_report_number > " + str(dataset_id) + \
            " and latitude > " + str(bottom) + \
            " and latitude < " + str(top) + \
            " and longitude > " + str(left) + \
            " and longitude < " + str(right)
    dataset = client.get(dataset_id, where = query, limit = max_crimes)
    df = pd.DataFrame.from_dict(dataset)
  
  def crime_count(self):
    try:
      return df[incident_report_number].count()
    except:
      print('No dataset has been loaded into this instance')
  
  def markermap(self):
    center_lat = bottom + (top - bottom) / 2
    center_lng = right + (left - right) / 2
    gmap = gmplot.GoogleMapPlotter(center_lat, center_lng, 17)
    try:
      lat_coordinates = df['latitude'].astype('float').tolist()
      lng_coordinates = df['longitude'].astype('float').tolist()
      gmap.scatter(lat_coordinates, lng_coordinates, '#FF0000', size=5, marker=False)
      return gmap
    except:
      print('No dataset has been loaded into this instance')
    
  
            
