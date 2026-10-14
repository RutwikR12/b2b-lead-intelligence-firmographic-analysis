# 1] Importing Libraries

import numpy as np
import pandas as pd
import re
df = pd.read_csv('globalb2bdataset.csv', encoding='ISO-8859-1')

# 2] UNDERSTANDING THE DATA

# df.info()
# print(df.shape)
# print(df.columns)
# print(df.head())

# 3] Check Null and Duplicate Values

# print(df.isna().sum())
# print(df.nunique())
# print(df.duplicated().sum())

# 4] Clean the Columns

df["Decision Maker Name"] = df['Decision Maker Name'].str.strip().str.title()
# print(df['Decision Maker Name'].head(10))
# print(df[df['Decision Maker Name'].str.contains(r'\?',na=False)])

df['Decision Maker Title'] = df['Decision Maker Title'].str.strip().str.title()
# print(df['Decision Maker Title'].head(10))

df['Industry'] = df['Industry'].str.strip().str.title()
# print(df['Industry'].head(10))
# print(df['Industry'].value_counts().head(20))
# print(df['Industry'].isna().sum())
# print(df[df['Industry'].isna()].head(10))

df['Country'] = df['Country'].str.strip().str.title()
# print(df['Country'].value_counts())

df['Email Address'] = df['Email Address'].str.strip().str.lower()
# print(df['Email Address'].head(10))
email_pattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$'
# print(df['Email Address'].str.match(email_pattern, na=False).value_counts())

# 5] Feature Engineering
df['Company_Domain'] = df['Email Address'].str.split('@').str[-1]
# print(df[['Email Address', 'Company_Domain']].head(10))

df[['First Name', 'Last Name']] = (df['Decision Maker Name'].str.split(' ',n=1,expand = True))
# print(df[['Decision Maker Name','First Name','Last Name']].head(10))
# print(repr(df['Decision Maker Name'].iloc[0]))
# print(df['Decision Maker Name'].iloc[0].split(' '))

# print(df['Decision Maker Title'].value_counts().head(20))
def categorize_seniority(title):
    title = str(title).lower()

    if any(keyword in title for keyword in [
        'ceo', 'cto', 'cfo', 'cmo',
        'chief', 'president', 'founder',
        'owner', 'vice president'
    ]):
        return 'Executive / C-Suite'

    elif any(keyword in title for keyword in [
        'director', 'head'
    ]):
        return 'Director Level'

    elif any(keyword in title for keyword in [
        'manager', 'supervisor', 'lead'
    ]):
        return 'Managerial'

    else:
        return 'Individual Contributor / Other'

df['Seniority Level'] = df['Decision Maker Title'].apply(categorize_seniority)    
# print(df['Seniority Level'].value_counts())
# print(df[['Decision Maker Title','Seniority Level']].head(20))
# print(df[['Decision Maker Title','Seniority Level']].sort_values('Decision Maker Title').to_string(index = False))
# print(df['Seniority Level'].value_counts())

def assign_priority(seniority):
    if seniority == "Executive / C-Suite" : 
        return "Tier 1"
    elif seniority == "Director Level":
        return "Tier 2"
    elif seniority == "Managerial":
        return "Tier 3"
    else:
        return "Tier 4"

df['Priority Tier'] = df['Seniority Level'].apply(assign_priority)
# print(df['Priority Tier'].value_counts())     

# 6] Check Null values again 
# print(df.isnull().sum())

# Filling the missing values
df['Industry'] = df['Industry'].fillna('Unknown')
df['Last Name'] = df['Last Name'].fillna('Unknown')

def categorize_industry_sector(ind):
    if pd.isna(ind):
        return 'Other / Unknown'
    ind = str(ind).lower()
    
    if any(k in ind for k in ['software', 'it ', 'information technology', 'internet', 'web', 'computer', 'saas', 'data processing', 'hosting', 'cyber', 'telecom', 'hardware', 'semiconductor']):
        return 'Technology & IT'
    elif any(k in ind for k in ['financial', 'bank', 'investment', 'insurance', 'wealth', 'credit', 'mortgage', 'accounting', 'fintech', 'capital', 'fund', 'venture', 'asset']):
        return 'Finance & Banking'
    elif any(k in ind for k in ['health', 'medical', 'pharma', 'biotech', 'hospital', 'therapeutics', 'wellness', 'clinical', 'diagnostics', 'dental', 'biopharma', 'genetics']):
        return 'Healthcare & Lifesciences'
    elif any(k in ind for k in ['hospitality', 'hotel', 'restaurant', 'travel', 'tourism', 'food', 'beverage', 'leisure', 'entertainment', 'gaming', 'casino', 'sports', 'recreation', 'fitness', 'event']):
        return 'Hospitality & Leisure'
    elif any(k in ind for k in ['consult', 'legal', 'law', 'accounting', 'marketing', 'advertising', 'public relations', 'hr', 'human resources', 'staffing', 'management advice', 'professional services', 'design', 'architecture', 'photography', 'security', 'investigation', 'auditing']):
        return 'Professional Services'
    elif any(k in ind for k in ['manufactur', 'industrial', 'machinery', 'automotive', 'motor vehicle', 'chemical', 'metals', 'textile', 'construction', 'building', 'engineering', 'logistics', 'transport', 'shipping', 'maritime', 'aerospace', 'cargo', 'freight', 'warehousing', 'packaging', 'printing']):
        return 'Manufacturing & Industrial'
    elif any(k in ind for k in ['retail', 'consumer', 'goods', 'e-commerce', 'ecommerce', 'apparel', 'fashion', 'store', 'shopping', 'wholesale', 'distributor', 'products']):
        return 'Retail & Consumer Goods'
    elif any(k in ind for k in ['educat', 'school', 'university', 'college', 'training', 'research', 'think tank', 'academy', 'library']):
        return 'Education & Research'
    elif any(k in ind for k in ['energy', 'oil', 'gas', 'utilities', 'renewables', 'environment', 'solar', 'power', 'mining', 'agriculture', 'farming', 'forestry', 'water', 'waste', 'recycling']):
        return 'Energy & Natural Resources'
    elif any(k in ind for k in ['nonprofit', 'non-profit', 'ngo', 'government', 'public sector', 'civic', 'social', 'association', 'political', 'philanthropy']):
        return 'Government & Non-Profit'
    else:
        return 'Other / Miscellaneous'

df['Industry Sector'] = df['Industry'].apply(categorize_industry_sector)

# print(df.isnull().sum())

# 7] Check duplicates
# print("Duplicate Email Address -\n",df['Email Address'].duplicated().sum())
# print(df.shape)

# 8] Checking structure again
# print(df.info())
# print(df.head())

# 9] Exporting the cleaned dataset
df.to_csv('cleaned_b2b_leads.csv',index = False)
# print("Cleaned Data Exported Successfully!!")

# 10] Check the exported csv
dff = pd.read_csv('cleaned_b2b_leads.csv')
# print(dff.shape)
# print(dff.info())
# print(dff.isnull().sum())
# print(dff.duplicated().sum())
# print(dff.head())