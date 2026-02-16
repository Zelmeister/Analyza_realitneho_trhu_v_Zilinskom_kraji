#!/usr/bin/env python
# coding: utf-8

# ### **Hedonic Price Model: Apartments for Sale**
# This is a part of the project, in which I create a hedonic price model for apartments for sale. <br>
# The goal is to identify the influence that each factor (attribute) has on price per m².

# In[14]:


import pandas as pd
import statsmodels.api as sm

# The dataset
df = pd.read_csv("hedonic_sale_apartments.csv")

df["ln_age_sq"] = df["ln_age"]**2 # Aging has diminishing negative returns
df["ln_area_sq"] = df["ln_area"]**2


# Dependent variable
y = df['price_m2']

# Factors (attributes)
x = df[[
    'holiday_apartment', 
    'area', 
    'rooms',
    'unrenovated',
    'partially_renovated', 
    'fully_renovated',
    'new_construction',
    'new_project',
    'floor_upto_8',
    'elevator',
    'age',
    'north',
    'south',
    'east',
    'west',
    'BY', 
    'ZA',
    'KM', 
    'CA',
    'MT',
    'TR',
    'DK',
    'NO',
    'TS',
    'RK',
    'LM',
    'area_price_index'
]]

# Add constant for intercept
x = sm.add_constant(x)

model = sm.OLS(y, x).fit()

print(model.summary())


# In[32]:


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

results_df.to_csv("hedonic_price_model_apartments_results.csv", index = False)

