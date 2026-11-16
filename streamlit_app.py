import streamlit as st

st.title("Team 6's Research and Solution")

# Note the comma after tab1 — this unpacks the single-item list properly
tab1, tab2, tab3, tab4, tab5, tab6 = st.tabs(["Overview", "Celeste's Analysis", "Danielle's Analysis", "Malaika's Analysis", "Ruben's Analysis", "Alara's Analysis"])

with tab1:
    st.header("Cuba, New Mexico is in a state of emergency due to dwindling water supplies. Fracking and tapping into the village aquifer and the evaluation of the ecological effects of drilling into brackish water is existential as it will decide the water future of the village of Cuba, New Mexico.")
    st.subheader("Abstract Overview")
    st.write("Extreme water conservation is in effect in the village of Cuba, New Mexico. Prolonged drought and dwindling surface water supplies continue to plague the village community as the effects of climate change continue to accelerate. The acceleration of its effect has led the village to make drastic measurements and find new solutions to meet water consumption. Fracking into the aquifer beneath the village and the evaluation of the ecological effects of drilling deep to access brackish water is existential for the village of Cuba. It is expected that the increase of water supply will further increase consumption via induced demand. The research is split into five parts to understand the specifics of feasibility and consequence: one, economic feasibility, as the treatment of water can stimulate growth; two, pollution, if treatment and fracking will further deplete the water systems of the area; three, the effect of pumping itself; four, conduct a comparison and collect general data of similar aquifers and reservoirs across the state; five, to understand the salinity of brackish water. It is hoped that the cross-examination of datasets and analysis can answer if tapping into the village aquifer is truly the answer to water scarcity in Cuba, New Mexico.")

with tab2: 
    st.write("This Analysis covers how much water and the flow rate can be provided to Cuba, New Mexico over the last several years. This is important and relative to Cuba for looking at their water supply holistically.")
    st.subheader("First Visual")
    st.image("Celeste's data/discharge_vs_time.png")
    st.write("How much water leaves the aquifer from Cuba New Mexico over the years")

    st.subheader("Second Visual")
    st.image("Celeste's data/velocity_vs_discharge.png")
    st.write("The rate of which water leaves the aquifer.")

with tab3: 
    st.write("This analysis looks at groundwater quality and contamination risks in New Mexico. I used groundwater data from Alamogordo to compare uranium and arsenic concentrations across four well groups. I also used aquifer sensitivity data from the New Mexico Environment Department to look at how vulnerable different areas are to groundwater contamination.")
    st.subheader("First Visual")
    st.image("Danielle_Analysis/Aquifer_Sensitivity_Graph.png")
    st.write("This analysis uses data from the New Mexico Environment Department to compare areas based on their sensitivity to groundwater contamination.")
    st.write("Out of 613 mapped areas:")
    st.markdown("""
    - 122 were classified as less sensitive.
    - 339 were classified as moderately sensitive.
    - 152 were classified as highly sensitive.
    """)

    st.write("Moderate sensitivity was the most common classification. Areas with higher sensitivity may be more vulnerable to groundwater contamination due to factors such as groundwater depth and local geology. ")
    
    
    st.subheader("Second Visual")
    st.image("Danielle_Analysis/Arsenic_Groundwater_Graph12.png")
    st.write("The graph shows how arsenic concentrations vary between groundwater well groups and why testing for different contaminants is important when evaluating groundwater quality.")

    st.subheader("Third Visual")
    st.image("Danielle_Analysis/Uranium_Groundwater_Graph1111.png")
    st.write("The uranium analysis compares groundwater concentrations with the EPA drinking water limit of 0.030 mg/L.")
    st.write("All four well groups had uranium concentrations below the EPA limit, although the concentrations varied between groups.")
    
with tab4:
    st.write("This analysis looks at Total Dissolved Solids (TDS) in groundwater. TDS measures the amount of dissolved substances in water, including salts and minerals, and helps us understand groundwater salinity.")
    st.write("The MATLAB analysis graphs groundwater TDS concentrations to show how salinity varies across samples.")
    st.write("Higher TDS concentrations indicate more dissolved substances in the water, which may affect how much treatment is needed before the water can be used. Higher TDS concentrations indicate more dissolved substances in the water, which may affect how much treatment is needed before the water can be used.")
    st.header("First Visual") 
    st.image("Malaika_Analysis/TDS_Groundwater_Graph.png")
    st.write("The MATLAB analysis graphs groundwater TDS concentrations to show how salinity varies across samples.")

    st.header("Second Visual")
    st.image("Malaika_Analysis/Cuba_TDS_Groundwater_Graph.png")
    st.write("A second analysis was done using historical groundwater data from the USGS within 30 miles of Cuba, New Mexico. The data was filtered to remove oil and gas produced-water records, leaving 10 groundwater samples.")
    
with tab5:
    st.header("1st Visual") 
    at.image("Ruben Analysis/current_predev.scatter.png")
    st.write(" Each dot in this scatter plot represents a well in the Albuquerque metro area (Rio Grande Aquifer Region). In each year, each predevelopment blue dot corresponds with an orange post-development dot, comparing water level well depth between predevelopment and post-development per year.")

with tab6: 
    st.header("Title")
    st.write(" description.")


    
