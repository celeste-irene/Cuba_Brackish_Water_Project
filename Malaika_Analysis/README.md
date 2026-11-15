# Total Dissolved Solids (TDS) Analysis
**Malaika Williams**

This analysis looks at Total Dissolved Solids (TDS) in groundwater. TDS measures the amount of dissolved substances in water, including salts and minerals, and helps us understand groundwater salinity.

## TDS Analysis
The MATLAB analysis graphs groundwater TDS concentrations to show how salinity varies across samples.

Higher TDS concentrations indicate more dissolved substances in the water, which may affect how much treatment is needed before the water can be used.

## TDS Analysis Near Cuba, NM
A second analysis was done using historical groundwater data from the USGS within 30 miles of Cuba, New Mexico. The data was filtered to remove oil and gas produced-water records, leaving 10 groundwater samples.

The MATLAB graph compares TDS concentrations and separates the samples into three groups:

- **Below 1,000 mg/L:** 4 samples
- **Brackish (1,000–10,000 mg/L):** 5 samples
- **Above 10,000 mg/L:** 1 sample

The results show that TDS concentrations vary between locations, with some samples falling within the brackish groundwater range.

## Files

###TDS Analysis
- **TDS_Analysis.m** – MATLAB code used to analyze and graph TDS concentrations.
- **TDS_Groundwater_Graph.png** – Graph showing groundwater TDS concentrations.
- **TDS_Results.txt** – Results from the TDS analysis.

### Cuba Groundwater TDS Analysis

- **Cuba_TDS_Analysis.m** – MATLAB code used to analyze TDS concentrations near Cuba, NM.
- **Cuba_TDS_Groundwater_Graph.png** – Graph comparing TDS concentrations in 10 historical groundwater samples.
- **Cuba_TDS_30_Miles_Excluding_Produced_Water.csv** – Filtered groundwater data used for the analysis.

## Connection to Cuba, New Mexico

TDS is important for the project in Cuba, NM, because brackish groundwater contains dissolved salts and minerals that may need to be removed before the water can be used.

The nearby groundwater data shows that salinity can vary between locations. This is important when considering brackish groundwater as a possible water source, since higher TDS concentrations may require more treatment. The measurements are historical, so current water testing would still be needed.
