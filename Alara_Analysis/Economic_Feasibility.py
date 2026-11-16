
import streamlit as st
import pandas as pd
import plotly.express as px

# Financial data
data = pd.DataFrame({
    "Category": [
        "Government Funding",
        "Construction Cost",
        "Expected Revenue"
    ],
    "Amount": [11.7, 10, 13]
})

# Create bar graph with shades of blue
fig = px.bar(
    data,
    x="Category",
    y="Amount",
    color="Category",
    text="Amount",
    color_discrete_sequence=[
        "#174A7E",
        "#4285C5",
        "#90CAF9"
    ],
    title="Economic Feasibility of Cuba's Desalination Facility",
    labels={"Amount": "Amount (Millions of Dollars)"}
)

# Display dollar amounts above bars
fig.update_traces(
    texttemplate="$%{y:.1f}M",
    textposition="outside"
)

# Customize graph
fig.update_layout(
    showlegend=False,
    yaxis_range=[0, 15]
)

# Display graph in Streamlit
st.plotly_chart(fig, use_container_width=True)

st.caption(
    "Funding and construction estimates come from "
    "different years. Expected revenue is not net profit."
)
# Save graph as a PNG file
fig.write_image("Alara_Analysis/Economic_Feasibility_Graph.png")
