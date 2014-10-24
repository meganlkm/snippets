import os
import glob
import csv
from xlsxwriter.workbook import Workbook

workbook = Workbook('test.xlsx')

for csvfile in glob.glob(os.path.join('csvs/', '*.csv')):
    wsheetName = os.path.splitext(os.path.basename(csvfile))[0]
    worksheet = workbook.add_worksheet(wsheetName)
    with open(csvfile, 'rb') as f:
        reader = csv.reader(f)
        for r, row in enumerate(reader):
            for c, col in enumerate(row):
                worksheet.write(r, c, col)

workbook.close()

# http://stackoverflow.com/questions/17684610/python-convert-csv-to-xlsx
