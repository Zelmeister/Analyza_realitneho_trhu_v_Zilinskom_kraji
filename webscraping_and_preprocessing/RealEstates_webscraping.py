#!/usr/bin/env python
# coding: utf-8

# In[11]:


# Import libraries

from bs4 import BeautifulSoup
import requests
import pandas as pd
import numpy as np
from datetime import date


# ### **Scope of the project**
# **FatraReality** is a sample real-estate company based in Žilina. It is active in the whole Žilina Region. The current project focuses on rent and sale offers of housing estates in all 11 districts of the region.

# In[12]:


# Apartments
apartment_types = [
    'garsonky',
    '1-izbove-byty',
    '2-izbove-byty',
    '3-izbove-byty',
    '4-izbove-byty',
    '5-a-viac-izbove-byty',
    'apartmany',
    'lofty',
    'mezonety'
]

# For houses there is just one category
house = 'domy'

# The same goes for housing land
housing_land = 'pozemky-rodinne-domy'

# 11 districts of the Žilina Region
districts = [
    'okres-bytca',
    'okres-cadca',
    'okres-dolny-kubin',
    'okres-kysucke-nove-mesto',
    'okres-liptovsky-mikulas',
    'okres-martin',
    'okres-namestovo',
    'okres-ruzomberok',
    'okres-turcianske-teplice',
    'okres-tvrdosin',
    'okres-zilina'
]

# Sale or rent
offer_types = ['predaj', 'prenajom']

# url = "https://www.nehnutelnosti.sk/vysledky/{property_type}/{district}/{offer_type}?page={page_no}"


# ### **Loop over all pages in the search engine**
# The search engine of *Nehnuteľnosti.sk* allows maximum of 33 pages (30 offers per page), even if the number of offers exceeds this number. Therefore, it is necessary to partition the search by property type, district and offer type. Then, for each combitination we will retrieve links to each page. By doing so, we are making sure that we are not omitting offers that may lay outside the scope of 33 pages.

# **Loop over *apartment* pages**

# In[3]:


url = "https://www.nehnutelnosti.sk/vysledky/{0}/{1}/{2}"

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
           '(KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'}

apartment_pages_links = [] # Will contain links to every page with apartments offers

for apartment_type in range(len(apartment_types)):
    for district in range(len(districts)):
        for offer_type in range(len(offer_types)):

            current_url = url.format(apartment_types[apartment_type],
                                     districts[district],
                                     offer_types[offer_type])

            current_request = requests.get(current_url, headers = headers)

            current_soup = BeautifulSoup(current_request.text, 'html.parser')
            
            # Part of the HTML that contains page numbers of offers and their links
            current_html = current_soup.select('ul.MuiPagination-ul a')

            # To ensure that only those selections, for which there is a result, are chosen
            if len(current_html) > 0:
                
                # List of page numbers
                cur_page_numbers = []
                for html in current_html:
                    button = html.find('button')
                    if button:
                        text = button.get_text(strip = True)
                        if text.isdigit():
                            cur_page_numbers.append(int(text))
                    
                    # The number of the last page for the current selection
                    max_cur_page_no = max(cur_page_numbers)
                    
                    # Add the list of links to pages for the current selection to the overall "apartment_pages_links" list
                    apartment_pages_links.extend([current_url + '?page=' + str(page) for page in range(1, max_cur_page_no + 1)])


# **Loop over *house* pages**

# In[13]:


url = "https://www.nehnutelnosti.sk/vysledky/domy/{0}/{1}"

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
           '(KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'}

house_pages_links = [] # Will contain links to every page with house offers

for district in range(len(districts)):
    for offer_type in range(len(offer_types)):

        current_url = url.format(districts[district],
                                 offer_types[offer_type])

        current_request = requests.get(current_url, headers = headers)

        current_soup = BeautifulSoup(current_request.text, 'html.parser')
            
        # Part of the HTML that contains page numbers of offers and their links
        current_html = current_soup.select('ul.MuiPagination-ul a')

        # To ensure that only those selections, for which there is a result, are chosen
        if len(current_html) > 0:
                
            # List of page numbers
            cur_page_numbers = []
            for html in current_html:
                button = html.find('button')
                if button:
                    text = button.get_text(strip = True)
                    if text.isdigit():
                        cur_page_numbers.append(int(text))
                    
                # The number of the last page for the current selection
                max_cur_page_no = max(cur_page_numbers)
                    
                # Add the list of links to pages for the current selection to the overall "house_pages_links" list
                house_pages_links.extend([current_url + '?page=' + str(page) for page in range(1, max_cur_page_no + 1)])


# **Loop over *housing land* pages**

# In[14]:


url = "https://www.nehnutelnosti.sk/vysledky/pozemky-rodinne-domy/{0}/{1}"

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
           '(KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'}

land_pages_links = [] # Will contain links to every page with housing land offers

for district in range(len(districts)):
    for offer_type in range(len(offer_types)):

        current_url = url.format(districts[district],
                                 offer_types[offer_type])

        current_request = requests.get(current_url, headers = headers)

        current_soup = BeautifulSoup(current_request.text, 'html.parser')
            
        # Part of the HTML that contains page numbers of offers and their links
        current_html = current_soup.select('ul.MuiPagination-ul a')

        # To ensure that only those selections, for which there is a result, are chosen
        if len(current_html) > 0:
                
            # List of page numbers
            cur_page_numbers = []
            for html in current_html:
                button = html.find('button')
                if button:
                    text = button.get_text(strip = True)
                    if text.isdigit():
                        cur_page_numbers.append(int(text))
                    
                # The number of the last page for the current selection
                max_cur_page_no = max(cur_page_numbers)
                    
                # Add the list of links to pages for the current selection to the overall "land_pages_links" list
                land_pages_links.extend([current_url + '?page=' + str(page) for page in range(1, max_cur_page_no + 1)])


# ### **Loop over all offers on a page**
# Now we need to retrieve links to all offers that are currently available in the 11 districts of the Žilina Region in the three categories – apartments, houses, housing lands.

# **Loop over all links to *apartment* offers**

# In[6]:


# List of links to all apartment offers currently available for all districts in the Žilina region
apartment_offers_links = []

for page in range(len(apartment_pages_links)):
    current_page = requests.get(apartment_pages_links[page], headers = headers)
    current_soup = BeautifulSoup(current_page.text, 'html.parser')
    a_tags = current_soup.find_all('a')
    # Retrieve only those links that contain "/detail/"
    # Those are the ones that connect to offers
    apartment_offers_links.extend([link.get('href') for link in a_tags if '/detail/' in link.get('href')])

# Make sure that only unique links are selected
apartment_offers_links = list(set(apartment_offers_links))


# **Loop over all links to *house* offers**

# In[15]:


# List of links to all house offers currently available for all districts in the Žilina region
house_offers_links = []

for page in range(len(house_pages_links)):
    current_page = requests.get(house_pages_links[page], headers = headers)
    current_soup = BeautifulSoup(current_page.text, 'html.parser')
    a_tags = current_soup.find_all('a')
    # Retrieve only those links that contain "/detail/"
    # Those are the ones that connect to offers
    house_offers_links.extend([link.get('href') for link in a_tags if '/detail/' in link.get('href')])

# Make sure that only unique links are selected
house_offers_links = list(set(house_offers_links))


# **Loop over all links to *housing land* offers**

# In[16]:


# List of links to all housing lands offers currently available for all districts in the Žilina region
land_offers_links = []

for page in range(len(land_pages_links)):
    current_page = requests.get(land_pages_links[page], headers = headers)
    current_soup = BeautifulSoup(current_page.text, 'html.parser')
    a_tags = current_soup.find_all('a')
    # Retrieve only those links that contain "/detail/"
    # Those are the ones that connect to offers
    land_offers_links.extend([link.get('href') for link in a_tags if '/detail/' in link.get('href')])

# Make sure that only unique links are selected
land_offers_links = list(set(land_offers_links))


# ### **Scrape offer data**

# **Scrape *apartment* offers data**

# In[14]:


# This will be a list of dictionaries containing data on all apartment offers, with each offer being stored in a separate dictionary
apartment_offers_data = []

for offer_no in range(len(apartment_offers_links)):
    
    offer_page = requests.get(apartment_offers_links[offer_no], headers = headers)
    offer_soup = BeautifulSoup(offer_page.text, 'html.parser')
    offer_texts = [p.get_text(strip=True) for p in offer_soup.find_all('p', {'data-test-id':'text'})] # (Almost) all text data on the page
    offer_container = offer_soup.select_one('div.MuiBox-root.mui-1e434qh') # Contains data on property type, area and state of the property
    container_texts = [t.strip() for t in offer_container.find_all(string=True) if t.strip()] if offer_container else None
    
    # Find all candidate start indexes
    offer_id_idx = [i for i, text in enumerate(offer_texts) if 'Číslo inzerátu' in text]
    
    if len(offer_id_idx) > 0:
        offer_id_idx = min(offer_id_idx)
        offer_id = offer_texts[offer_id_idx].split(':')[-1].strip()

        attributes = {} # Create a dictionary that will contain all offer attributes

        # The date on which the data was scraped
        attributes['Dátum'] = date.today()
    
        # Create a dictionary that will contain all offer attributes
        attributes['Číslo inzerátu'] = offer_id
    
        # Add the title attribute
        attributes['Názov'] = offer_soup.title.text
    
        # Determine whether it is a sale or rent offer
        offer_type_search = []
        for i in range(len(offer_texts)):
            if 'Predaj' in offer_texts[i]:
                offer_type_search.append('Predaj')
            elif 'Prenájom' in offer_texts[i]:
                offer_type_search.append('Prenájom')
            else:
                offer_type_search.append(None)
        offer_type_search = [text for text in offer_type_search if text is not None] # Remove None values
        offer_type = offer_type_search[0] if offer_type_search else None # Sale/Rent is determined by the first mention of the word
        attributes['Typ ponuky'] = offer_type # Add the attribute to the dictionary
        
        
        # Select atrributes stored in the "offer_container" → "container_texts"
        property_type = container_texts[0]
        m2 = [c for c in container_texts if 'm²' in c]
        state = [c for c in container_texts if ('rekonštrukcia' in c or 'stav' in c or 'Novostavba' in c or 'Developerský projekt' in c)]
    
        # Add the attributes to the "attributes" dictionary
        attributes['Typ nehnuteľnosti'] = property_type
        attributes['Plocha (m2)'] = m2[0] if m2 else None
        attributes['Stav'] = state[0] if state else None
    
        
        # Other attributes are stored between element containing the word 'okres' and element 'Overte si, akú hypotéku môžete získať.'
        # Find all candidate start indexes 
        start_candidates = [i for i, text in enumerate(offer_texts) if 'okres' in text]
        
        # Pick the earliest start index (if any found)
        start_idx = min(start_candidates) if start_candidates else None
    
        # Find all condidate end indexed
        end_canditates = [i for i, text in enumerate(offer_texts) if 'Overte si, akú hypotéku môžete získať.' in text]
        
        # Find the end index
        end_idx = min(end_canditates) if end_canditates else None
        
        # Extract the sublist (only if both were found)
        if start_idx is not None and end_idx is not None and start_idx < end_idx:
            extracted = offer_texts[start_idx:end_idx]
        else:
            extracted = []
        
        location = [e for e in extracted if 'okres' in e]
        price = [e for e in extracted if ' €' in e and ' €/' not in e]
        price_m2 = [e for e in extracted if '€/m²' in e and '€/m²/mes.' not in e]
        rent = [e for e in extracted if '€/mes.' in e and '€/mes.energie' not in e]
        rent_m2 = [e for e in extracted if '€/m²/mes.' in e]
        utilities = [e for e in extracted if '€/mes.energie' in e]
        parking = [e for e in extracted if 'parkovacie státie' in e]
        
        attributes['Lokalita'] = location[0] if location else None
        attributes['Cena'] = price[0] if price else None
        attributes['Cena m2'] = price_m2[0] if price_m2 else None
        attributes['Nájom'] = rent[0] if rent else None
        attributes['Nájom m2'] = rent_m2[0] if rent_m2 else None
        attributes['Energie (€)'] = utilities[0] if utilities else None
        attributes['Parkovacie státie (€)'] = parking[0] if parking else None
    
        # Other attributes are stored between one of the start_labels and 'Všetky novostavby na jednom mieste'
        start_labels = ['Plocha bytu:', 'Plocha domu:', 'Plocha pozemku:']
        end_label = 'Všetky novostavby na jednom mieste'
    
        # Find all candidate start indexes
        start_candidates2 = [i for i, text in enumerate(offer_texts) if text in start_labels]
        
        # Pick the earliest start index (if any found)
        start_idx2 = min(start_candidates2) if start_candidates2 else None
        
        # Find the end index
        end_idx2 = offer_texts.index(end_label) if end_label in offer_texts else None
        
        # Extract the sublist (only if both were found)
        if start_idx2 is not None and end_idx2 is not None and start_idx2 < end_idx2:
            extracted2 = offer_texts[start_idx2:end_idx2]
        else:
            extracted2 = []
    
        i = 0
        while i < len(extracted2):
            if extracted2[i].endswith(':'):
                # Take next element as value if it exists
                if i + 1 < len(extracted2) and not extracted2[i + 1].endswith(':'):
                    attributes[extracted2[i][:-1]] = extracted2[i + 1] # remove the colon from key
                    i += 2
                else:
                    # No valid value found
                    attributes[extracted2[i][:-1]] = None
                    i += 1
            else:
                i += 1
    
    
        # Data on the real estate company responsible for the offer is stored after 'Zobraziť číslo' and 'Profil realitnej kancelárie'
        # Find all candidate start indexes 
        start_candidates3 = [i for i, text in enumerate(offer_texts) if 'Zobraziť číslo' in text]
        
        # Pick the earliest start index (if any found)
        start_idx3 = min(start_candidates3) if start_candidates3 else None
    
        # Find all condidate end indexed
        end_canditates3 = [i for i, text in enumerate(offer_texts) if 'Profil realitnej kancelárie' in text]
        
        # Find the end index
        end_idx3 = min(end_canditates3) if end_canditates3 else None
        
        # Extract the sublist (only if both were found)
        if start_idx3 is not None and end_idx3 is not None and start_idx3 < end_idx3:
            extracted3 = offer_texts[start_idx3:end_idx3]
        else:
            extracted3 = []
    
        attributes['Realitná kancelária'] = extracted3[1] if extracted3 else None
        attributes['Sídlo (adresa)'] = extracted3[2] if len(extracted3) >= 3 else None
        attributes['Sídlo (mesto)'] = extracted3[3] if len(extracted3) >= 4 else None
    
        # Store all collected attributes as a dictionary corresponding to a single element of the "apartment_offers_data" list
        apartment_offers_data.append(attributes)


# **Scrape *house* offers data**

# In[17]:


# This will be a list of dictionaries containing data on all house offers, with each offer being stored in a separate dictionary
house_offers_data = []

for offer_no in range(len(house_offers_links)):
    
    offer_page = requests.get(house_offers_links[offer_no], headers = headers)
    offer_soup = BeautifulSoup(offer_page.text, 'html.parser')
    offer_texts = [p.get_text(strip=True) for p in offer_soup.find_all('p', {'data-test-id':'text'})] # (Almost) all text data on the page
    offer_container = offer_soup.select_one('div.MuiBox-root.mui-1e434qh') # Contains data on property type, area and state of the property
    container_texts = [t.strip() for t in offer_container.find_all(string=True) if t.strip()] if offer_container else None
    
    # Find all candidate start indexes
    offer_id_idx = [i for i, text in enumerate(offer_texts) if 'Číslo inzerátu' in text]
    
    if len(offer_id_idx) > 0:
        offer_id_idx = min(offer_id_idx)
        offer_id = offer_texts[offer_id_idx].split(':')[-1].strip()

        attributes = {} # Create a dictionary that will contain all offer attributes

        # The date on which the data was scraped
        attributes['Dátum'] = date.today()
    
        # Create a dictionary that will contain all offer attributes
        attributes['Číslo inzerátu'] = offer_id
    
        # Add the title attribute
        attributes['Názov'] = offer_soup.title.text
    
        # Determine whether it is a sale or rent offer
        offer_type_search = []
        for i in range(len(offer_texts)):
            if 'Predaj' in offer_texts[i]:
                offer_type_search.append('Predaj')
            elif 'Prenájom' in offer_texts[i]:
                offer_type_search.append('Prenájom')
            else:
                offer_type_search.append(None)
        offer_type_search = [text for text in offer_type_search if text is not None] # Remove None values
        offer_type = offer_type_search[0] if offer_type_search else None # Sale/Rent is determined by the first mention of the word
        attributes['Typ ponuky'] = offer_type # Add the attribute to the dictionary
        
        
        # Select atrributes stored in the "offer_container" → "container_texts"
        property_type = container_texts[0]
        m2 = [c for c in container_texts if 'm²' in c]
        state = [c for c in container_texts if ('rekonštrukcia' in c or 'stav' in c or 'Novostavba' in c or 'Developerský projekt' in c)]
    
        # Add the attributes to the "attributes" dictionary
        attributes['Typ nehnuteľnosti'] = property_type
        attributes['Plocha (m2)'] = m2[0] if m2 else None
        attributes['Stav'] = state[0] if state else None
    
        
        # Other attributes are stored between element containing the word 'okres' and element 'Overte si, akú hypotéku môžete získať.'
        # Find all candidate start indexes 
        start_candidates = [i for i, text in enumerate(offer_texts) if 'okres' in text]
        
        # Pick the earliest start index (if any found)
        start_idx = min(start_candidates) if start_candidates else None
    
        # Find all condidate end indexed
        end_canditates = [i for i, text in enumerate(offer_texts) if 'Overte si, akú hypotéku môžete získať.' in text]
        
        # Find the end index
        end_idx = min(end_canditates) if end_canditates else None
        
        # Extract the sublist (only if both were found)
        if start_idx is not None and end_idx is not None and start_idx < end_idx:
            extracted = offer_texts[start_idx:end_idx]
        else:
            extracted = []
        
        location = [e for e in extracted if 'okres' in e]
        price = [e for e in extracted if ' €' in e and ' €/' not in e]
        price_m2 = [e for e in extracted if '€/m²' in e and '€/m²/mes.' not in e]
        rent = [e for e in extracted if '€/mes.' in e and '€/mes.energie' not in e]
        rent_m2 = [e for e in extracted if '€/m²/mes.' in e]
        utilities = [e for e in extracted if '€/mes.energie' in e]
        parking = [e for e in extracted if 'parkovacie státie' in e]
        
        attributes['Lokalita'] = location[0] if location else None
        attributes['Cena'] = price[0] if price else None
        attributes['Cena m2'] = price_m2[0] if price_m2 else None
        attributes['Nájom'] = rent[0] if rent else None
        attributes['Nájom m2'] = rent_m2[0] if rent_m2 else None
        attributes['Energie (€)'] = utilities[0] if utilities else None
        attributes['Parkovacie státie (€)'] = parking[0] if parking else None
    
        # Other attributes are stored between one of the start_labels and 'Všetky novostavby na jednom mieste'
        start_labels = ['Plocha bytu:', 'Plocha domu:', 'Plocha pozemku:']
        end_label = 'Všetky novostavby na jednom mieste'
    
        # Find all candidate start indexes
        start_candidates2 = [i for i, text in enumerate(offer_texts) if text in start_labels]
        
        # Pick the earliest start index (if any found)
        start_idx2 = min(start_candidates2) if start_candidates2 else None
        
        # Find the end index
        end_idx2 = offer_texts.index(end_label) if end_label in offer_texts else None
        
        # Extract the sublist (only if both were found)
        if start_idx2 is not None and end_idx2 is not None and start_idx2 < end_idx2:
            extracted2 = offer_texts[start_idx2:end_idx2]
        else:
            extracted2 = []
    
        i = 0
        while i < len(extracted2):
            if extracted2[i].endswith(':'):
                # Take next element as value if it exists
                if i + 1 < len(extracted2) and not extracted2[i + 1].endswith(':'):
                    attributes[extracted2[i][:-1]] = extracted2[i + 1] # remove the colon from key
                    i += 2
                else:
                    # No valid value found
                    attributes[extracted2[i][:-1]] = None
                    i += 1
            else:
                i += 1
    
    
        # Data on the real estate company responsible for the offer is stored after 'Zobraziť číslo' and 'Profil realitnej kancelárie'
        # Find all candidate start indexes 
        start_candidates3 = [i for i, text in enumerate(offer_texts) if 'Zobraziť číslo' in text]
        
        # Pick the earliest start index (if any found)
        start_idx3 = min(start_candidates3) if start_candidates3 else None
    
        # Find all condidate end indexed
        end_canditates3 = [i for i, text in enumerate(offer_texts) if 'Profil realitnej kancelárie' in text]
        
        # Find the end index
        end_idx3 = min(end_canditates3) if end_canditates3 else None
        
        # Extract the sublist (only if both were found)
        if start_idx3 is not None and end_idx3 is not None and start_idx3 < end_idx3:
            extracted3 = offer_texts[start_idx3:end_idx3]
        else:
            extracted3 = []
    
        attributes['Realitná kancelária'] = extracted3[1] if extracted3 else None
        attributes['Sídlo (adresa)'] = extracted3[2] if len(extracted3) >= 3 else None
        attributes['Sídlo (mesto)'] = extracted3[3] if len(extracted3) >= 4 else None
    
        # Store all collected attributes as a dictionary corresponding to a single element of the "house_offers_data" list
        house_offers_data.append(attributes)


# **Scrape *housing land* offers**

# In[24]:


# This will be a list of dictionaries containing data on all housing land offers, with each offer being stored in a separate dictionary
land_offers_data = []

for offer_no in range(len(land_offers_links)):
    
    offer_page = requests.get(land_offers_links[offer_no], headers = headers)
    offer_soup = BeautifulSoup(offer_page.text, 'html.parser')
    offer_texts = [p.get_text(strip=True) for p in offer_soup.find_all('p', {'data-test-id':'text'})] # (Almost) all text data on the page
    offer_container = offer_soup.select_one('div.MuiBox-root.mui-1e434qh') # Contains data on property type, area and state of the property
    container_texts = [t.strip() for t in offer_container.find_all(string=True) if t.strip()] if offer_container else None
    
    # Find all candidate start indexes
    offer_id_idx = [i for i, text in enumerate(offer_texts) if 'Číslo inzerátu' in text]
    
    if len(offer_id_idx) > 0:
        offer_id_idx = min(offer_id_idx)
        offer_id = offer_texts[offer_id_idx].split(':')[-1].strip()

        attributes = {} # Create a dictionary that will contain all offer attributes

        # The date on which the data was scraped
        attributes['Dátum'] = date.today()
    
        # Create a dictionary that will contain all offer attributes
        attributes['Číslo inzerátu'] = offer_id
    
        # Add the title attribute
        attributes['Názov'] = offer_soup.title.text
    
        # Determine whether it is a sale or rent offer
        offer_type_search = []
        for i in range(len(offer_texts)):
            if 'Predaj' in offer_texts[i]:
                offer_type_search.append('Predaj')
            elif 'Prenájom' in offer_texts[i]:
                offer_type_search.append('Prenájom')
            else:
                offer_type_search.append(None)
        offer_type_search = [text for text in offer_type_search if text is not None] # Remove None values
        offer_type = offer_type_search[0] if offer_type_search else None # Sale/Rent is determined by the first mention of the word
        attributes['Typ ponuky'] = offer_type # Add the attribute to the dictionary
        
        
        # Select atrributes stored in the "offer_container" → "container_texts"
        property_type = container_texts[0]
        m2 = [c for c in container_texts if 'm²' in c]
        state = [c for c in container_texts if ('rekonštrukcia' in c or 'stav' in c or 'Novostavba' in c or 'Developerský projekt' in c)]
    
        # Add the attributes to the "attributes" dictionary
        attributes['Typ nehnuteľnosti'] = property_type
        attributes['Plocha (m2)'] = m2[0] if m2 else None
        attributes['Stav'] = state[0] if state else None
    
        
        # Other attributes are stored between element containing the word 'okres' and element 'Overte si, akú hypotéku môžete získať.'
        # Find all candidate start indexes 
        start_candidates = [i for i, text in enumerate(offer_texts) if 'okres' in text]
        
        # Pick the earliest start index (if any found)
        start_idx = min(start_candidates) if start_candidates else None
    
        # Find all condidate end indexed
        end_canditates = [i for i, text in enumerate(offer_texts) if 'Overte si, akú hypotéku môžete získať.' in text]
        
        # Find the end index
        end_idx = min(end_canditates) if end_canditates else None
        
        # Extract the sublist (only if both were found)
        if start_idx is not None and end_idx is not None and start_idx < end_idx:
            extracted = offer_texts[start_idx:end_idx]
        else:
            extracted = []
        
        location = [e for e in extracted if 'okres' in e]
        price = [e for e in extracted if ' €' in e and ' €/' not in e]
        price_m2 = [e for e in extracted if '€/m²' in e and '€/m²/mes.' not in e]
        rent = [e for e in extracted if '€/mes.' in e and '€/mes.energie' not in e]
        rent_m2 = [e for e in extracted if '€/m²/mes.' in e]
        utilities = [e for e in extracted if '€/mes.energie' in e]
        parking = [e for e in extracted if 'parkovacie státie' in e]
        
        attributes['Lokalita'] = location[0] if location else None
        attributes['Cena'] = price[0] if price else None
        attributes['Cena m2'] = price_m2[0] if price_m2 else None
        attributes['Nájom'] = rent[0] if rent else None
        attributes['Nájom m2'] = rent_m2[0] if rent_m2 else None
        attributes['Energie (€)'] = utilities[0] if utilities else None
        attributes['Parkovacie státie (€)'] = parking[0] if parking else None
    
        # Other attributes are stored between one of the start_labels and 'Všetky novostavby na jednom mieste'
        start_labels = ['Plocha bytu:', 'Plocha domu:', 'Plocha pozemku:']
        end_label = 'Všetky novostavby na jednom mieste'
    
        # Find all candidate start indexes
        start_candidates2 = [i for i, text in enumerate(offer_texts) if text in start_labels]
        
        # Pick the earliest start index (if any found)
        start_idx2 = min(start_candidates2) if start_candidates2 else None
        
        # Find the end index
        end_idx2 = offer_texts.index(end_label) if end_label in offer_texts else None
        
        # Extract the sublist (only if both were found)
        if start_idx2 is not None and end_idx2 is not None and start_idx2 < end_idx2:
            extracted2 = offer_texts[start_idx2:end_idx2]
        else:
            extracted2 = []
    
        i = 0
        while i < len(extracted2):
            if extracted2[i].endswith(':'):
                # Take next element as value if it exists
                if i + 1 < len(extracted2) and not extracted2[i + 1].endswith(':'):
                    attributes[extracted2[i][:-1]] = extracted2[i + 1] # remove the colon from key
                    i += 2
                else:
                    # No valid value found
                    attributes[extracted2[i][:-1]] = None
                    i += 1
            else:
                i += 1
    
    
        # Data on the real estate company responsible for the offer is stored after 'Zobraziť číslo' and 'Profil realitnej kancelárie'
        # Find all candidate start indexes 
        start_candidates3 = [i for i, text in enumerate(offer_texts) if 'Zobraziť číslo' in text]
        
        # Pick the earliest start index (if any found)
        start_idx3 = min(start_candidates3) if start_candidates3 else None
    
        # Find all condidate end indexed
        end_canditates3 = [i for i, text in enumerate(offer_texts) if 'Profil realitnej kancelárie' in text]
        
        # Find the end index
        end_idx3 = min(end_canditates3) if end_canditates3 else None
        
        # Extract the sublist (only if both were found)
        if start_idx3 is not None and end_idx3 is not None and start_idx3 < end_idx3:
            extracted3 = offer_texts[start_idx3:end_idx3]
        else:
            extracted3 = []
    
        attributes['Realitná kancelária'] = extracted3[1] if extracted3 else None
        attributes['Sídlo (adresa)'] = extracted3[2] if len(extracted3) >= 3 else None
        attributes['Sídlo (mesto)'] = extracted3[3] if len(extracted3) >= 4 else None
    
        # Store all collected attributes as a dictionary corresponding to a single element of the "land_offers_data" list
        land_offers_data.append(attributes)


# ### **Save offer data**

# In[ ]:


df_apartment_offers = pd.DataFrame(apartment_offers_data)
# Include the current date in the title of the saved file (e.g. 2025-10-30_apartment_offers_csv)
df_apartment_offers.to_csv('{}_apartment_offers.csv'.format(str(df_apartment_offers['Dátum'][0])))


# In[23]:


df_house_offers = pd.DataFrame(house_offers_data)
# Include the current date in the title of the saved file (e.g. 2025-10-30_apartment_offers_csv)
df_house_offers.to_csv('{}_house_offers.csv'.format(str(df_house_offers['Dátum'][0])))


# In[26]:


df_land_offers = pd.DataFrame(land_offers_data)
# Include the current date in the title of the saved file (e.g. 2025-10-30_apartment_offers_csv)
df_land_offers.to_csv('{}_land_offers.csv'.format(str(df_land_offers['Dátum'][0])))

