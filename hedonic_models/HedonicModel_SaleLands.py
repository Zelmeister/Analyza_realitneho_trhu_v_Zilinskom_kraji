#!/usr/bin/env python
# coding: utf-8

# In[5]:


import pandas as pd
import statsmodels.api as sm

# The dataset
df = pd.read_csv("hedonic_sale_lands.csv")

# Dependent variable
y = df['price_m2']

# Factors (attributes)
x = df[[
    'ln_area',
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


# In[6]:


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

results_df.to_csv("hedonic_price_model_lands_results.csv", index = False)

