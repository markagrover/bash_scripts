#!/Users/markgrover/Desktop/Automate_task/venv/bin/python3.5

import requests,sys, webbrowser, bs4

print("Googling...")
res = requests.get('http://google.com/search?q='+' '.join(sys.argv[1:]))
#res = requests.get('http://google.com/search?q=the+best+sea+food'
#                   '+resturaunt+in+MA')
res.raise_for_status()

linkList = bs4.BeautifulSoup(res.text, 'lxml')
topLinks = linkList.select('.r a')[:4]
print(type(topLinks))


    #webbrowser.open_new_tab(link.text)
for link in topLinks:
    print(link.get('href'))
    webbrowser.open_new_tab('https://google.com'+link.get('href'))

