# -*- coding: utf-8 -*-
 
import pandas as pd
  
#loading dataset from excel file
df1 = pd.read_excel('/content/online_retail_II.xlsx',sheet_name=None)

print(df1.keys())

#Combinig Sheets
df = pd.concat(df1.values(), ignore_index=True)

#checking Dataset
df.head()

#Data Profiling (Know your data)

print(df.shape)
print(df.info())


print(f'There are {df.shape[0]} rows and {df.shape[1]} columns ')

# Missing Value Handling
df.isnull().sum()

# Rows which don't have customers ID this could be anonyms Transactions Thats why we will drop that rows
df = df.dropna()


#after missing value handling data shape
print(df.shape)

#around 20% of datasets have been Removed
print(f'Now dataset have {df.shape[0]} and {df.shape[1]} columns')

#duplicates handling

df.duplicated().sum()

df = df.drop_duplicates()

print(df.shape)

print(f'Now dataset have {df.shape[0]} and {df.shape[1]} columns')

# DataType Coversion
df.info()

df['Customer ID'] = df['Customer ID'].astype('int')
df.info()

# Dealing With inconsist Data
Cols_object = ['Country']

df[Cols_object] = df[Cols_object].apply(lambda x: x.str.strip().str.lower())


df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'],errors='coerce')

df_copy = df.copy()   #copying Dataframe for Safety

# Adding New Columns
df['Total Price'] = df['Quantity'] * df['Price']
df['Order_Month'] = df['InvoiceDate'].dt.month

df.head()

df.to_csv('Cleaned.csv')  #saving Cleaned Datasets
