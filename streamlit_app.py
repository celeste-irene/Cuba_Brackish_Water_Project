import streamlit as st

st.title("Team 6's Research and Solution")

# Note the comma after tab1 — this unpacks the single-item list properly
tab1, tab2, tab3, tab4, tab5, tab6, tab7 = st.tabs(["Overview", "Rio Puerco Analysis", "Groundwater Quality", "Brackish Water Salinity", "Pumping", "Economic Feasibility", "Gantt Chart, Timelines, and Methodology"])

with tab1:
    st.header("Cuba, New Mexico is in a state of emergency due to dwindling water supplies. Fracking and tapping into the village aquifer, and the evaluation of the ecological effects of drilling into brackish water, are existential as it will decide the water future of the village of Cuba, New Mexico.")
    st.subheader("Abstract Overview")
    st.write("Extreme water conservation is in effect in the village of Cuba, New Mexico. Prolonged drought and dwindling surface water supplies continue to plague the village community as the effects of climate change continue to accelerate. The acceleration of its effect has led the village to make drastic measurements and find new solutions to meet water consumption. Fracking into the aquifer beneath the village and the evaluation of the ecological effects of drilling deep to access brackish water is existential for the village of Cuba. It is expected that the increase of water supply will further increase consumption via induced demand. The research is split into five parts to understand the specifics of feasibility and consequence: one, economic feasibility, as the treatment of water can stimulate growth; two, pollution, if treatment and fracking will further deplete the water systems of the area; three, the effect of pumping itself; four, conduct a comparison and collect general data of similar aquifers and reservoirs across the state; five, to understand the salinity of brackish water. It is hoped that the cross-examination of datasets and analysis can answer if tapping into the village aquifer is truly the answer to water scarcity in Cuba, New Mexico.")
    
    st.subheader("Conclusion")
    st.write("As Cuba, New Mexico begins to build its new water infrastructure, we need to highlight some problems that may arise to ensure that the village may finally resolve their water crisis. From the research, it is concluded that the water is fit for human consumption. Traces of dangerous elements such as arsenic and uranium is very low so the risk of contracting radiation poisoning and other harmful ailments is very low. However, because the groundwater in the Rio Puerco drainage basin is brackish, it is important that the energy infrastructure, the disposal infrastructure, and the governmental body that oversees this village project must already be built, running, and robust once the water treatment facility is online. As this project is multi-faceted, attempting to reignite the economic output of the village by building a science and technology business park in the village, the overall consumption of the village will likely increase. Therefore, the village must ensure that water allotments are to be forecasted to account for greater need in perpetuity to ensure that recharge is still enough to replenish its own groundwater supply but also ensure that it will not exacerbate problems further downstream in the broader Albuquerque metropolitan area.")
    st.write("Group Members:")
    st.markdown("""
    - Celeste Bivens
    - Ruben Cedric Romero (Prime Minister)
    - Danielle Glikman
    - Malaika Williams
    - Alara Hart
    """)
    
with tab2: 
    st.write("This Analysis covers how much water and the flow rate can be provided to Cuba, New Mexico over the last several years. This is important and relative to Cuba for looking at their water supply holistically. This gauges how much water they can fully receive and how it relates to the brackish water problem. ")
    st.subheader("Water Discharge vs. Time")
    st.image("Celeste's data/discharge_vs_time.png")
    st.write("How much water leaves the aquifer from Cuba New Mexico over the years")

    st.subheader("Velocity vs. Discharge")
    st.image("Celeste's data/velocity_vs_discharge.png")
    st.write("The rate of which water leaves the aquifer.")

    st.subheader("Graph Analysis:")
    st.write("Factors such as limited groundwater supply and drought greatly disrupt the flow of water being supplied to a community. This can alter the balance in the water and cause more chemicals/saltwater to flow into fresher zones. Water discharge from these areas depletes faster due to pumping/harvesting from human-made resources, further harming the aquifer and the groundwater it supplies to the community. This contributes to the limited water supply in the Rio Puerco Aquifer, and Cuba, New Mexico as a whole.")

with tab3: 
    st.write("This analysis looks at groundwater quality and contamination risks in New Mexico. I used groundwater data from Alamogordo to compare uranium and arsenic concentrations across four well groups. I also used aquifer sensitivity data from the New Mexico Environment Department to look at how vulnerable different areas are to groundwater contamination.")
    st.subheader("Aquifer Sensitivity Graph")
    st.image("Danielle_Analysis/Aquifer_Sensitivity_Graph.png")
    st.write("This analysis uses data from the New Mexico Environment Department to compare areas based on their sensitivity to groundwater contamination.")
    st.write("Out of 613 mapped areas:")
    st.markdown("""
    - 122 were classified as less sensitive.
    - 339 were classified as moderately sensitive.
    - 152 were classified as highly sensitive.
    """)

    st.write("Moderate sensitivity was the most common classification. Areas with higher sensitivity may be more vulnerable to groundwater contamination due to factors such as groundwater depth and local geology. ")
    
    
    st.subheader("Arsenic Groundwater")
    st.image("Danielle_Analysis/Arsenic_Groundwater_Graph12.png")
    st.write("The arsenic analysis compares groundwater concentrations with the EPA drinking water limit of 0.010 mg/L.")
    st.write("The graph shows how arsenic concentrations vary between groundwater well groups and why testing for different contaminants is important when evaluating groundwater quality.")

    st.subheader("Uranium Groundwater")
    st.image("Danielle_Analysis/Uranium_Groundwater_Graph1111.png")
    st.write("The uranium analysis compares groundwater concentrations with the EPA drinking water limit of 0.030 mg/L.")
    st.write("All four well groups had uranium concentrations below the EPA limit, although the concentrations varied between groups.")
    
with tab4:
    st.write("This analysis looks at Total Dissolved Solids (TDS) in groundwater. TDS measures the amount of dissolved substances in water, including salts and minerals, and helps us understand groundwater salinity.")
    st.write("The analysis graphs groundwater TDS concentrations to show how salinity varies across samples.")
    st.write("Higher TDS concentrations indicate more dissolved substances in the water, which may affect how much treatment is needed before the water can be used.")
    st.header("TDS Groundwater Graph") 
    st.image("Malaika_Analysis/TDS_Groundwater_Graph.png")
    st.write("The analysis graphs groundwater TDS concentrations in four wells in Alamogordo to show how salinity varies across samples.")

    st.header(" Cuba's TDS Groundwater Graph")
    st.image("Malaika_Analysis/Cuba_TDS_Groundwater_Graph.png")
    st.write("A second analysis was done using historical groundwater data from the USGS within 30 miles of Cuba, New Mexico. The data was filtered to remove oil and gas produced-water records, leaving 10 groundwater samples.")
    
with tab5:
    st.header("Water Level Depth vs. Time") 
    st.image("Ruben Analysis/current_predev.scatter.png")
    st.write(" Each dot in this scatter plot represents a well in the Albuquerque metro area (Rio Grande Aquifer Region). In each year, each predevelopment blue dot corresponds with an orange post-development dot, comparing water level well depth between predevelopment and post-development per year.")

with tab6: 
    st.header("Economic Feasibility")
    st.write(" This analysis looks at the coming zero-waster desalination facility in Cuba, New Mexico. With government funding, it is easy to look at the funding, construction costs, and expected revenue to fully grasp the economic practicallity.")
    st.write("This proposed facility is projected to generate 518,00 gallons ot potable water per day, while harvesting important minerals from brackish water.")

    st.subheader("Economic Feasibility Graph")
    st.image("Alara_Analysis/Economic_Feasibility_Graph.png")

    st.write("This python graph analysis is displays the $11.7 million offered in government funding, $10 million estimated construction cost, and $13 million dollars of projected revenue.")
    st.write("This only shows the potential this facility has, and how it will benefit Cuba long term, considering they do not have the means to do it without government funding. Being able to simultaneously sell the high-grade fertilizer and provide residents with clean drinking water.")

    st.subheader("Economic and Environmental Benefits")

    st.image("Alara_Analysis/Economic_Environmental.png")

    st.write("The proposed desalination facility could provide both economic and environmental benefits to Cuba, New Mexico. Economically, the facility could create local jobs and generate revenue through fertilizer and surplus water sales.")
    
with tab7: 
    st.header("Gantt Chart")
    st.header("Process")
    st.header("Methodology")


    
