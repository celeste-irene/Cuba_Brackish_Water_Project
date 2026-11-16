import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from matplotlib.patches import Rectangle
import numpy as np

df = pd.read_csv('ABCWUA_2024-2025_water_level_data.csv')

nudate = pd.to_datetime(df.iloc[1:, 9], format="%m/%d/%Y").dt.strftime("%Y-%m-%d")

waterlevel = df.iloc[1:, 10]
predev = df.iloc[1:, 12]

plt.rcParams['figure.dpi'] = 100
fig, ax1 = plt.subplots(figsize = (10, 6))
ax1.scatter(nudate, waterlevel, color = 'orange', label = 'Current Water Level')

ax1.set_xlabel('Date')
ax1.set_ylabel('Water Level Depth (Feet)')
ax1.tick_params('x', rotation = 270)
ax1.grid(False)

ax2 = ax1.twinx()
ax2.scatter(nudate, predev, color = 'blue', label = 'Predev')
ax2.set_ylabel('Predevelopment Water Level Depth (Feet)')
ax2.grid(False)

'''ax3 = ax1.twinx()
ax3.add_patch(Rectangle((19.5, .1), 12.5, .3, fc ='none', ec ='red', lw = 4))
ax3.grid(False)
ax3.yaxis.set_visible(False)
ax3.text(19.5, .06, 'Different Wells with Lower Current Level (Within the Last Year)', fontsize=10)
'''

plt.grid(True)
# plt.xlim(0, 205)
plt.title('Water Level Current & Predev of Wells in the Rio Grande Aquifer Region')
plt.legend()
plt.tight_layout()
plt.show()

