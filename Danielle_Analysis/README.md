
# Groundwater Quality Assessment
**Danielle Glikman**

This analysis looks at groundwater quality and contamination risks in New Mexico. I used groundwater data from Alamogordo to compare uranium and arsenic concentrations across four well groups. I also used aquifer sensitivity data from the New Mexico Environment Department to look at how vulnerable different areas are to groundwater contamination.

## Uranium Analysis
The uranium analysis compares groundwater concentrations with the EPA drinking water limit of **0.030 mg/L**.

All four well groups had uranium concentrations below the EPA limit, although the concentrations varied between groups.

## Arsenic Analysis
The arsenic analysis compares groundwater concentrations with the EPA drinking water limit of **0.010 mg/L**.

The graph shows how arsenic concentrations vary between groundwater well groups and why testing for different contaminants is important when evaluating groundwater quality.

## Aquifer Sensitivity Analysis
This analysis uses data from the New Mexico Environment Department to compare areas based on their sensitivity to groundwater contamination.

Out of **613 mapped areas**:
- **122** were classified as less sensitive.
- **339** were classified as moderately sensitive.
- **152** were classified as highly sensitive.

Moderate sensitivity was the most common classification. Areas with higher sensitivity may be more vulnerable to groundwater contamination due to factors such as groundwater depth and local geology.

## Files

### Uranium
- **Uranium_Analysis.m** – MATLAB code used to analyze uranium concentrations.
- **Uranium_Groundwater_Graph1111.png** – Graph showing uranium concentrations.
- **Uranium_Results.txt** – Average, minimum, and maximum uranium concentrations.

### Arsenic
- **Arsenic_Analysis.m** – MATLAB code used to analyze arsenic concentrations.
- **Arsenic_Groundwater_Graph12.png** – Graph showing arsenic concentrations.
- **Arsenic_Results.txt** – Average, minimum, and maximum arsenic concentrations.

### Aquifer Sensitivity
- **Aquifer_Sensitivity.csv** – Original dataset from the New Mexico Environment Department.
- **Aquifer_Sensitivity.m** – MATLAB code used to analyze aquifer sensitivity.
- **Aquifer_Sensitivity_Graph.png** – Graph comparing aquifer sensitivity classifications.

### Original Groundwater Dataset
- **BGNDRF-Well-Water-Data-Up-To-12-17-2019_1.xlsx** – Groundwater dataset used for the uranium and arsenic analyses.

## Connection to Cuba, New Mexico
Although the groundwater measurements come from Alamogordo and the aquifer sensitivity data cover mapped areas in New Mexico, they help assess potential pollution risks for our project in Cuba. Uranium and arsenic concentrations can vary between wells, meaning some groundwater may require more treatment and produce more contaminated waste. The aquifer sensitivity analysis also shows that certain areas are more vulnerable to contamination, which is important when considering drilling, groundwater extraction, and waste disposal. 


