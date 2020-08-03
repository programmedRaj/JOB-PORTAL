import os
from pdf2image import convert_from_path
from pyresparser import ResumeParser
import re
import pytesseract
import datefinder
#from find_job_titles import Finder


def de_bhai_pdf(dia_kya):

    UPLOAD_FOLDER = os.getcwd()+'/uploads/'
    data = ResumeParser(UPLOAD_FOLDER+dia_kya).get_extracted_data()

    images = convert_from_path(UPLOAD_FOLDER+dia_kya)
    lam = ''

    for i in images:
        pytesseract.pytesseract.tesseract_cmd = os.getcwd()+'/Tesseract-OCR/tesseract.exe'
        text = pytesseract.image_to_string(i)
        lam = lam+text
    if data['experience'] != None:
        print(data)
        a = ''.join(data['experience']).split(".")
        data['experience'] = a
        # finder=Finder()
        yay = []
        dates = []
        for i in data['experience']:

            matches = datefinder.find_dates(
                i.replace('\xa0', ' ').replace('-', 'gibbrish '))
            for match in matches:
                dates.append(match.strftime('%b %Y'))
            if len(dates) != 0:
                me = ' '.join(i.split(' ')[:3])
                #u=finder.findall(i.replace('\xa0',' '))
                a = {'Job title': '', 'Company name': me, 'dates': dates,
                     'Description': ' '.join(i.replace('\xa0', '').split(' ')[10:])}
                yay.append(a)
            dates = []

        regex = r"(?i)\b((?:https?://|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))"
        data['Education'] = ''.join(lam[lam.upper().find('EDUCATION')+10: lam.upper(
        ).find('EDUCATION')+lam[lam.upper().find('EDUCATION')+12:].find('\n')])
        data['Links'] = re.findall(regex, lam.replace('\n', ''))
        data['experience'] = yay
        yum = ['college_name', 'degree', 'designation',
               'company_names', 'no_of_pages']
        for i in yum:
            data.pop(i)
    else:
        regex = r"(?i)\b((?:https?://|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))"
        data['Education'] = ''.join(lam[lam.upper().find('EDUCATION')+10: lam.upper(
        ).find('EDUCATION')+lam[lam.upper().find('EDUCATION')+12:].find('\n')])
        data['Links'] = re.findall(regex, lam.replace('\n', ''))
        data['experience'] = 'none'
        yum = ['college_name', 'degree', 'designation',
               'company_names', 'no_of_pages']
        for i in yum:
            data.pop(i)
    return data
