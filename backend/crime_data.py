import os
import pandas as pd
import numpy as np
from sodapy import Socrata

dataset_id = 'fdj4-gpfu'
domain = 'data.austintexas.gov'
client = Socrata(domain, None)

results = client.get(dataset_id)
df = pd.DataFrame.from_dict(results)
