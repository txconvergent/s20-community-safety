import pandas as pd


def generate_crime_weights(crime_dataset):
  """
  :param crime_dataset: Austin crime data - type: pandas dataframe
  :return: weights on a scale of 0 to 100 for each type of crime - type: dictionary
  """
  
  crime_dataset['crime_type'] = pd.Categorical(crime_dataset['crime_type'])
  crime_weights = {}
  
  # initialize all crimes to weight of zero
  for crime in crime_dataset['crime_type'].cat.categories:
    crime_weights[crime] = 0
