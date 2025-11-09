import pandas as pd
import numpy

data = pd.read_excel('Fast Food Analysis Project Spreadsheet.xlsx')
data.drop('Unnamed: 0', axis=1, inplace=True)

print(data.head(10))

data.to_csv('fastfood.csv')
