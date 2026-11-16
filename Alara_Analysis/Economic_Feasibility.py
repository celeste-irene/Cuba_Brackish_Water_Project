
import streamlit as st
import pandas as pd
import plotly.express as px

# Economic feasibility data
data = pd.DataFrame({
    "Category": [
        "Government Funding",
        "Construction Cost",
        "Expected Revenue"
    ],
    "Amount": [11.7, 10, 13]
})

# Create bar graph
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

# Display dollar amounts above each bar
fig.update_traces(
    texttemplate="$%{y:.1f}M",
    textposition="outside"
)

# Dark gray background and graph formatting
fig.update_layout(
    showlegend=False,
    yaxis_range=[0, 15],
    template="plotly_dark",
    paper_bgcolor="#292D32",
    plot_bgcolor="#292D32",
    font=dict(color="white"),
    title_font=dict(size=20, color="white")
)

# Gridline color
fig.update_yaxes(gridcolor="#484D54")

# PNG download settings
config = {
    "displayModeBar": True,
    "toImageButtonOptions": {
        "format": "png",
        "filename": "Economic_Feasibility_Graph",
        "height": 600,
        "width": 1000,
        "scale": 2
    }
}

# Display graph in Streamlit
st.plotly_chart(
    fig,
    use_container_width=True,
    config=config,
    theme=None
)
