"""
Module for generating sub-regions within the University of Texas area and scoring
each sub-region based on its criminal activity within a specified time frame.
"""


def subregion_lats(decimal_places):
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


def subregion_lngs(decimal_places):
    right = round(-97.728456, decimal_places)
    left = round(-97.754840, decimal_places)
    start = str(right)
    start = start[4:]
    start = int(start)
    end = str(left)
    end = end[4:]
    end = int(end)
    lngs = range(start, end+1)
    points = []
    for num in lngs:
      point = '-97.' + str(num)
      point = float(point)
      points.append(point)
    return points


def generate_subregion_weights():
    lats = subregion_lats(3)
    lngs = subregion_lngs(3)
    subregion_weights = {}
    count = 0
    for i in range(len(lats)):
        for j in range(len(lngs)):
            subregion_weights[(lats[i], lngs[j])] = count
            count += 1

    return subregion_weights

