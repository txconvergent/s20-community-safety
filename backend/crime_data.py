import os
import pandas as pd
import numpy as np
from sodapy import Socrata

dataset_id = 'fdj4-gpfu'
domain = 'data.austintexas.gov'
client = Socrata(domain, None)

results = client.get(dataset_id)
df = pd.DataFrame.from_dict(results)

# UT austin region: latitude and longitude
bottom_left = (30.282200, -97.754840)
bottom_right = (30.287402, -97.754840)
top_left = (30.282200, -97.748456)
top_right = (30.287402, -97.748456)

