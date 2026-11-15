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
    st.write("Add your description here.")

    st.subheader("Second Visual")
    st.image("Danielle_Analysis/Arsenic_Groundwater_Graph12.png")
    st.write("Add your description here.")
    
with tab4:
    st.write("This analysis looks at Total Dissolved Solids (TDS) in groundwater. TDS measures the amount of dissolved substances in water, including salts and minerals, and helps us understand groundwater salinity.")
    st.header("First Visual") 
    st.image("Malaika_Analysis/TDS_Groundwater_Graph.png")
    st.write("chart description.")

    st.header("Second Visual")
    st.image("Malaika_Analysis/Cuba_TDS_Groundwater_Graph.png")
    st.write("chart description.")
    
with tab5:
    st.header("1st Visual") 
    st.write("chart description")

with tab6: 
    st.header("1st Visual")
    st.write("chart description.")


    
