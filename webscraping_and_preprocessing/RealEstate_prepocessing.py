#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[2]:


# Data scraped from Nehnuteľnosti.sk on October 30, 2025
df_apartments_original = pd.read_csv("2025-10-30_apartment_offers.csv", index_col = 0) # Original apartments data file
df_houses_original = pd.read_csv("2025-10-30_house_offers.csv", index_col = 0) # Original houses data file
df_lands_original = pd.read_csv("2025-10-30_land_offers.csv", index_col = 0) # Original lands data file

df_apartments_cleaning = df_apartments_original.copy() # Working copy of the original apartments data file
df_houses_cleaning = df_houses_original.copy() # Working copy of the original houses data file
df_lands_cleaning = df_lands_original.copy() # Working copy of the original lands data file


# ### **Removing Extra Columns from the Three Datasets**
# At this point, the three datasets contain different numbers of columns. However, some of the columns are common. The first task is to filter out those columns that contain useful data.

# In[3]:


# Number of rows and columns in each DataFrame
print(df_apartments_cleaning.shape)
print(df_houses_cleaning.shape)
print(df_lands_cleaning.shape)


# **Apartment Offers**

# In[4]:


apartments_columns = df_apartments_cleaning.columns

col_names = []
null_count = []

for i in range(len(apartments_columns)):
    col_names.append(apartments_columns[i])
    null_count.append(int(df_apartments_cleaning[apartments_columns[i]].isnull().sum()))

# DataFrame containing the number of missing values in each column
df_cols_null_count = pd.DataFrame({'column_name': col_names,
                                   'null_count': null_count})

# Columns with more than 1500 missing values = 90% of values are missing
# These columns are not very useful; we can get rid of them
# If for any reason we need the data in the future to help us substitue missing values in other columns, we still have the original file

# Filter columns that contain less (or equal) than 1500 missing values
relevant_cols = list(df_cols_null_count[df_cols_null_count['null_count'] <= 1500]['column_name'])
df_cols_null_count[df_cols_null_count['null_count'] <= 1500]

# 'Plocha bytu' can be removed; it equals to 'Plocha (m2) in all cases except for 30 null values
# 'Skladový priestor' can be removed; only 51 offers have it; the rest either don't or we don't know if they do
# 'Telekomunikácie' can be removed; only 17% of offers have this data
# 'Počet izieb / miestností' can be removed; this data is available in 'Typ nehnuteľnosti'
# 'Zariadenie' can be removed; only 18% of offers have this data
# 'Zastavaná plocha' can be removed; only 16% of offers have this data
# 'Počet balkónov' can be removed; only 10% of offers have this data
# 'Rok kolaudácie' can be removed; only 15% of offers have this data

remove_items = [
    'Plocha bytu', 'Skladový priestor', 'Telekomunikácie',
    'Počet izieb / miestností', 'Zariadenie', 'Zastavaná plocha',
    'Počet balkónov', 'Rok kolaudácie'
]

# We are keeping 22 columns out if the original 75
relevant_cols = [col for col in relevant_cols if col not in remove_items]

# Update the DataFrame
df_apartments_cleaning = df_apartments_cleaning[relevant_cols]


# **House Offers**

# In[5]:


houses_columns = df_houses_cleaning.columns

col_names = []
null_count = []

for i in range(len(houses_columns)):
    col_names.append(houses_columns[i])
    null_count.append(int(df_houses_cleaning[houses_columns[i]].isnull().sum()))

# DataFrame containing the number of missing values in each column
df_cols_null_count = pd.DataFrame({'column_name': col_names,
                                   'null_count': null_count})

# I cannot go lower than 1340, because it would exclude columns like "Nájom", which is an important one
relevant_cols = list(df_cols_null_count[df_cols_null_count['null_count'] <= 1340]['column_name'])
df_houses_cleaning = df_houses_cleaning[relevant_cols]

# Out of the remaining columns only the first 24 are relevant
relevant_cols = list(pd.DataFrame(df_houses_cleaning.columns)[0].iloc[:25])

# 73 columns were reduced to 24
# Update the DataFrame
df_houses_cleaning = df_houses_cleaning[relevant_cols]
df_houses_cleaning.columns


# **Land Offers**

# In[6]:


lands_columns = df_lands_cleaning.columns

col_names = []
null_count = []

for i in range(len(lands_columns)):
    col_names.append(lands_columns[i])
    null_count.append(int(df_lands_cleaning[lands_columns[i]].isnull().sum()))

# DataFrame containing the number of missing values in each column
df_cols_null_count = pd.DataFrame({'column_name': col_names,
                                   'null_count': null_count})

# If a column contains 800 or more null values, it is not relevant
relevant_cols = list(df_cols_null_count[df_cols_null_count['null_count'] < 800]['column_name'])

# These columns either contain irrelevant of insufficient data
remove_cols = ['Skladový priestor', 'Územie', 'Funkčné využitie', 
               'Dĺžka pozemku', 'Šírka pozemku', 'Plyn', 'Elektrina', 
               'Voda', 'Pripravenosť k výstavbe', 'Plocha pozemku'
               'Stav']

relevant_cols = [col for col in relevant_cols if col not in remove_cols]

# Update the DataFrame
df_lands_cleaning = df_lands_cleaning[relevant_cols]


# ### **Location Data**
# All three datasets contain data on location. However, the data is too a large degree unstructured. My aim to is to categorize each record by district, city/village and area/quarter.

# In[7]:


# To preprocess the data according to the task we well need these columns 'Číslo inzerátu', 'Názov' and 'Lokalita'
df_apartment_locations = df_apartments_cleaning.loc[:,['Číslo inzerátu', 'Názov', 'Lokalita']]
df_house_locations = df_houses_cleaning.loc[:,['Číslo inzerátu', 'Názov', 'Lokalita']]
df_land_locations = df_lands_cleaning.loc[:,['Číslo inzerátu', 'Názov', 'Lokalita']]

# Combine them into one DataFrame
df_locations = pd.concat([df_apartment_locations, df_house_locations, df_land_locations], ignore_index = True)


# In[8]:


# 'JuYUZodjDKp' occurs twice (indexes 411 and 1864)
# Remove record 1864
df_locations['Číslo inzerátu'].value_counts().reset_index()
df_locations = df_locations.drop(index=1864)
df_locations = df_locations.reset_index(drop = True)
df_locations


# In[9]:


# Translate column names to English
df_locations = df_locations.rename(columns = {'Číslo inzerátu': 'offer_id',
                                              'Názov': 'title',
                                              'Lokalita': 'location'})


# In[10]:


# Insert three columns into which I will insert corresponding data from the "location" column
df_locations.insert(loc = 3, column = 'location_district', value = None)
df_locations.insert(loc = 4, column = 'location_city', value = None)
df_locations.insert(loc = 5, column = 'location_area', value = None)


# In[11]:


# Some title contain emoji characters
# This function help me remove them, so that I can process the data in MySQL

import re

def remove_emoji(text):
    emoji_pattern = re.compile(
        "["
        "\U0001F600-\U0001F64F"  # emoticons
        "\U0001F300-\U0001F5FF"  # symbols & pictographs
        "\U0001F680-\U0001F6FF"  # transport & map symbols
        "\U0001F1E0-\U0001F1FF"  # flags
        "\U00002700-\U000027BF"  # dingbats
        "\U000024C2-\U0001F251"  # enclosed characters
        "]+",
        flags=re.UNICODE
    )
    return emoji_pattern.sub('', text)


# In[12]:


# Apply the emoji-removing function to all titles
for i in range(len(df_locations['title'])):
    df_locations.loc[i, 'title'] = remove_emoji(df_locations.loc[i, 'title'])


# In[13]:


# Save the DataFrame as CSV
df_locations.to_csv('offer_locations.csv', index=False, encoding='utf-8')


# In[14]:


# offer_id = 'JuYYByY4-PR' Streženice is a villar in the Púchov District in the Trenčín Region
df_locations = df_locations.drop(index=2404)
df_locations = df_locations.reset_index(drop = True)


# In[15]:


# Remove it also from "df_houses_cleaning"
df_houses_cleaning = df_houses_cleaning.drop(index=739)
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)


# In[16]:


# offer_id = JuJKXzmzr5eE' is not in the Žilina Region
df_houses_cleaning = df_houses_cleaning[~(df_houses_cleaning['Číslo inzerátu'] == 'JuJKXzmzr5eE')]


# In[17]:


# Offer is from Croatia
df_apartments_cleaning = df_apartments_cleaning[~(df_apartments_cleaning['Číslo inzerátu'] == 'JuxeR7brS_D')]


# In[18]:


# These offers do not represent a real property; they just advertise building of a house
# We can remove them, so that they don' skew the final results

offers_to_build = [
	'JuRgJeTAxVy', 'JuoeYQOs_Z9', 'Ju44dfk_BZm', 'JuV5HkQpALL', 'JusXqn8KqwQ', 'JuYUZodjDKp', 
    'JuU84vbz7m-', 'JuLSNsiowCT', 'Jub2MnZxkBn', 'Jub1Xd04y8D', 'JuVbNDQqR3q', 'JupyV2t8Qgm', 
    'Ju7-5HCEZjz', 'JuFVfOvXiCk', 'Jufdqwwas0S', 'JukRBagok2E'
]

df_houses_cleaning = df_houses_cleaning[~df_houses_cleaning['Číslo inzerátu'].isin(offers_to_build)]
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)


# In[19]:


# These offers do not represent a real property; they just advertise building of a house
# We can remove them, so that they don' skew the final results

offers_to_build2 = ['JuyE-84zVP9', 'JuC2P_JyQg6', 'Ju60no_OjrU', 'JuPfz8Oakcs', 'Juk28smgcm7']

df_houses_cleaning = df_houses_cleaning[~df_houses_cleaning['Číslo inzerátu'].isin(offers_to_build2)]
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)


# In[20]:


# These offers do not represent a real property; they just advertise building of a house
# We can remove them, so that they don' skew the final results
# Moreover, one of the offer is in the Trenčín Region

offers_to_build3 = ['JuwfnF7mXZs', 'JuQGKRbpML5', 'JucfkD4TXI2', 'JumYD--tcfF', 'JulM-M8rFdz', 'Ju5qccZREsO']

df_houses_cleaning = df_houses_cleaning[~df_houses_cleaning['Číslo inzerátu'].isin(offers_to_build3)]
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)


# In[21]:


# This is a repeating offer included in multiple districts
# The correct district is Martin
# Remove the rest 

rezidencia_kostany = ['JuCAoLux5O0', 'JuFUoJz8z7g', 'JuvnTkfCrNJ', 'JuXo1TVoC84']

df_houses_cleaning = df_houses_cleaning[~df_houses_cleaning['Číslo inzerátu'].isin(rezidencia_kostany)]
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)


# In[22]:


# Testing offer

df_houses_cleaning = df_houses_cleaning[df_houses_cleaning['Číslo inzerátu'] != 'JueR5iH76hh']
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)


# In[23]:


# Duplicate offer

df_houses_cleaning = df_houses_cleaning[df_houses_cleaning['Číslo inzerátu'] != 'Ju1PiVDdTRw']
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)


# In[24]:


# Testing offers
RK_testing_offers = [
    'Jut-GwJ_Qmn',
    'JuM2qj8kfBJ',
    'Ju5Rl2VCQYq',
    'Ju6jOzbNDaB',
    'JutkSeYcxzo',
    'Ju2cZLsf5Xh',
    'Ju_yeTQoQG2',
    'JuSmVoCr-CV',
    'Ju0fglxtctq',
    'JuGfDQOsHmw',
    'Juc-ZbfJICf',
    'Ju4RjcLCl-O',
    'Juo9T_LCuWW',
    'JuhFo0q3t6T',
    'JukA8-tduYn',
    'JuCF-I8uM3ZW',
    'Juwr31W_dus',
    'JurZFN-T5VX',
    'JuRmClm8hqV',
    'Juxwhc4TLxj',
    'Ju0D7tVvZB5',
    'Juxxk0nQtiw-',
    'Ju6-g9nJrk1',
    'JuOJjH1E-jJ',
    'JuNgFlKkU3n',
    'JuyCzL3CL8Q',
    'JuseCa_M7H7',
    'Ju3dxeUOsZr',
    'JuJ8AjyOgrn',
    'JuB7WYUKOng',
    'JuYcD1cYRC8',
    'Ju_lXVK1B0Q',
    'JuG_ei5iwAz',
    'JuK0PHuNbRh',
    'JuNnjzEHIaY',
    'JuRxXPD9iEM',
    'Juj3pKqGsT5',
    'JuJecz40VZc',
    'JuhTbiCwPiz'
]

df_apartments_cleaning = df_apartments_cleaning[~df_apartments_cleaning['Číslo inzerátu'].isin(RK_testing_offers)]
df_apartments_cleaning = df_apartments_cleaning.reset_index(drop = True)

df_houses_cleaning = df_houses_cleaning[~df_houses_cleaning['Číslo inzerátu'].isin(RK_testing_offers)]
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)

df_lands_cleaning = df_lands_cleaning[~df_lands_cleaning['Číslo inzerátu'].isin(RK_testing_offers)]
df_lands_cleaning = df_lands_cleaning.reset_index(drop = True)


# In[25]:


RK_redundant_offers = [
    'JuCyi8Nz0oh', 'JucdJl6RAZz', 'JuZMRH4zm4d', 'Jud3PtJyl7P', 'Ju53Xu6DNDM', 'Ju-yFk1s-Qs', 'JuLxKNZaVEo', 'JuHB-4yW8w7'
]

df_apartments_cleaning = df_apartments_cleaning[~df_apartments_cleaning['Číslo inzerátu'].isin(RK_redundant_offers)]
df_apartments_cleaning = df_apartments_cleaning.reset_index(drop = True)

df_houses_cleaning = df_houses_cleaning[~df_houses_cleaning['Číslo inzerátu'].isin(RK_redundant_offers)]
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)

df_lands_cleaning = df_lands_cleaning[~df_lands_cleaning['Číslo inzerátu'].isin(RK_redundant_offers)]
df_lands_cleaning = df_lands_cleaning.reset_index(drop = True)


# In[26]:


LM_redundant_offers = [
    'Ju25L6t7egU', 'Jukh7ShziCp', 'JuMmFwDvobZ', 'Ju3FTuEEkm2', 'JuazCL1T27p', 'Ju8pNqlVDEE', 
    'JupeajWr4ykV', 'Ju09r1I1ST_', 'JuCdSqdzbEt', 'JuR64EZUgdH'
]

df_apartments_cleaning = df_apartments_cleaning[~df_apartments_cleaning['Číslo inzerátu'].isin(LM_redundant_offers)]
df_apartments_cleaning = df_apartments_cleaning.reset_index(drop = True)

df_houses_cleaning = df_houses_cleaning[~df_houses_cleaning['Číslo inzerátu'].isin(LM_redundant_offers)]
df_houses_cleaning = df_houses_cleaning.reset_index(drop = True)

df_lands_cleaning = df_lands_cleaning[~df_lands_cleaning['Číslo inzerátu'].isin(LM_redundant_offers)]
df_lands_cleaning = df_lands_cleaning.reset_index(drop = True)


# ### **Offer Attributes**

# In[27]:


df_apartments_gen_attributes = df_apartments_cleaning.loc[:,['Číslo inzerátu', 'Typ ponuky', 'Typ nehnuteľnosti', 'Plocha (m2)', 'Stav', 'Vlastníctvo']]
df_houses_gen_attributes = df_houses_cleaning.loc[:,['Číslo inzerátu', 'Typ ponuky', 'Typ nehnuteľnosti', 'Plocha (m2)', 'Stav', 'Vlastníctvo']]
df_lands_gen_attributes = df_lands_cleaning.loc[:,['Číslo inzerátu', 'Typ ponuky', 'Typ nehnuteľnosti', 'Plocha (m2)', 'Stav', 'Vlastníctvo']]

df_offers_gen_attributes = pd.concat([df_apartments_gen_attributes,
                                      df_houses_gen_attributes,
                                      df_lands_gen_attributes], ignore_index = True)

# Contains offer_id, offer_type, property_type, area, condition, ownership
df_offers_gen_attributes.to_csv('offer_attributes.csv', index = False, encoding = 'utf-8')


# ### **Sale Prices**

# In[28]:


df_apartments_prices = df_apartments_cleaning.loc[:, ['Číslo inzerátu', 'Cena', 'Cena m2']]
df_houses_prices = df_houses_cleaning.loc[:, ['Číslo inzerátu', 'Cena', 'Cena m2']]
df_lands_prices = df_lands_cleaning.loc[:, ['Číslo inzerátu', 'Cena', 'Cena m2']]

df_sale_prices = pd.concat([df_apartments_prices,
                            df_houses_prices,
                            df_lands_prices], ignore_index = True)

# Contains offer_id, price, price_m2
df_sale_prices.to_csv('sale_prices.csv', index = False, encoding = 'utf-8')


# ### **Rent Price**

# In[29]:


df_apartments_rent_prices = df_apartments_cleaning.loc[:, ['Číslo inzerátu', 'Nájom', 'Nájom m2']]
df_houses_rent_prices = df_houses_cleaning.loc[:, ['Číslo inzerátu', 'Nájom', 'Nájom m2']]

df_rent_prices = pd.concat([df_apartments_rent_prices,
                            df_houses_rent_prices], ignore_index = True)

# Contains offer_id, price, price_m2
df_rent_prices.to_csv('rent_prices.csv', index = False, encoding = 'utf-8')


# ### **Apartment Attributes**

# In[30]:


df_apartment_attributes = df_apartments_cleaning.loc[:, ['Číslo inzerátu', 
                                                         'Umiestnenie', 
                                                         'Podlažie', 
                                                         'Orientácia', 
                                                         'Rok výstavby', 
                                                         'Energetický certifikát',
                                                         'Vykurovanie']]

df_apartment_attributes.to_csv('apartment_attributes.csv', index = False, encoding = 'utf-8')


# ### **House Attributes**

# In[31]:


df_house_attributes = df_houses_cleaning.loc[:, ['Číslo inzerátu',
                                                 'Rok výstavby',
                                                 'Plocha domu',
                                                 'Plocha pozemku',
                                                 'Terén pozemku',
                                                 'Zastavaná plocha',
                                                 'Skladový priestor',
                                                 'Energetický certifikát',
                                                 'Elektrina',
                                                 'Voda']]

df_house_attributes.to_csv('house_attributes.csv', index = False, encoding = 'utf-8')


# ### **Land Attributes**

# In[34]:


df_land_attributes = df_lands_cleaning.loc[:, ['Číslo inzerátu',
                                               'Plocha pozemku',
                                               'Terén pozemku']]

df_land_attributes.to_csv('land_attributes.csv', index = False, encoding = 'utf-8')


# ### **Real Estate Agencies**
# Those that administer a particular offer.

# In[38]:


df_apartment_agencies = df_apartments_cleaning.loc[:, ['Číslo inzerátu',
                                                       'Realitná kancelária',
                                                       'Sídlo (mesto)',
                                                       'Sídlo (adresa)']]

df_house_agencies = df_houses_cleaning.loc[:, ['Číslo inzerátu',
                                               'Realitná kancelária',
                                               'Sídlo (mesto)',
                                               'Sídlo (adresa)']]

df_land_agencies = df_lands_cleaning.loc[:, ['Číslo inzerátu',
                                             'Realitná kancelária',
                                             'Sídlo (mesto)',
                                             'Sídlo (adresa)']]

df_agencies = pd.concat([df_apartment_agencies,
                         df_house_agencies,
                         df_land_agencies], ignore_index = True)

df_agencies.to_csv('agencies.csv', index = False, encoding = 'utf-8')

