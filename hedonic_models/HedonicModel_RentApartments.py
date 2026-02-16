#!/usr/bin/env python
# coding: utf-8

# ### **Hedonic Rent Model: Apartments for Rent**
# This is a part of the project, in which I create a hedonic rent model for apartments for rent. <br>
# The goal is to identify the influence that each factor (attribute) has on rent per m².

# In[13]:


import pandas as pd
import statsmodels.api as sm

# The dataset
df = pd.read_csv("hedonic_rent_apartments.csv")

# Dependent variable
y = df['monthly_rent_m2']

# Factors (attributes)
x = df[[
    'rooms',
    'area',
    'unrenovated',
    'partially_renovated',
    'fully_renovated',
    'new_construction',
    'BY',
    'ZA',
    'KM',
    'CA',
    'MT',
    'TR',
    'DK',
    'NO',
    'RK',
    'LM',
    'area_rent_index'
]]

# Add constant for intercept
x = sm.add_constant(x)

model = sm.OLS(y, x).fit()

print(model.summary())


# In[14]:


results_df = pd.DataFrame({
    "coef": model.params,
    "std_err": model.bse,
    "t": model.tvalues,
    "p_value": model.pvalues,
    "ci_lower": model.conf_int()[0],
    "ci_upper": model.conf_int()[1]
})

results_df = results_df.round(4)

results_df = results_df.reset_index()

results_df = results_df.rename(columns={"index": "variable"})

results_df.to_csv("hedonic_rent_model_apartments_results.csv", index = False)

