#!/usr/bin/env python
# coding: utf-8

# ### **Hedonic Price Model: Houses for Sale**
# This is a part of the project, in which I create a hedonic price model for houses for sale. <br>
# The goal is to identify the influence that each factor (attribute) has on price per m².

# In[25]:


import pandas as pd
import numpy as np
import statsmodels.api as sm

# The dataset
df = pd.read_csv("hedonic_sale_houses.csv")


# Dependent variable
y = df['price_m2']

# Factors (attributes)
df['ln_house_area'] = np.log(df['house_area'])

x = df[[
    'ln_house_area',
    'land_area',
    'unrenovated',
    'partially_renovated',
    'fully_renovated',
    'new_construction',
    'in_development',
    'age',
    'flat',
    'sloped',
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


# In[28]:


results_df = pd.DataFrame({ 
    "coef": model.params, 
    "std_err": model.bse, 
    "t": model.tvalues, 
    "p_value": model.pvalues, 
    "ci_lower": model.conf_int()[0], 
    "ci_upper": model.conf_int()[1] }) 

results_df = results_df.round(4) 

results_df = results_df.reset_index() 

results_df = results_df.rename(columns={"index": "variable"}) 

results_df.to_csv("hedonic_price_model_houses_results.csv", index = False)

