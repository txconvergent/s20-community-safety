"""
Module for generating sub-regions within the University of Texas area and scoring
each sub-region based on its criminal activity within a specified time frame.
"""

def region_matrix_lat(decimal_places):
    """
    :param decimal_places:
    :return:
    """
    bottom = round(30.282200, decimal_places)
    top = round(30.299402, decimal_places)
    start = str(bottom)
    start = start[3:]
    start = int(start)
    end = str(top)
    end = end[3:]
    end = int(end)
    lats = range(start, end+1)
    points = []
    for num in lats:
      point = '30.' + str(num)
      point = float(point)
      points.append(point)
    return points

