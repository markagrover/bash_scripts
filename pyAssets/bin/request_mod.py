#!/Users/markgrover/Desktop/Automate_task/venv/bin/python3.5

import requests, json

# USAGE: http://docs.python-requests.org/,

# >>> r = requests.get('https://api.github.com/user', auth=('user', 'pass'))
# >>> r.status_code
# 200
# >>> r.headers['content-type']
# 'application/json; charset=utf8'
# >>> r.encoding
# 'utf-8'
# >>> r.text
# u'{"type":"User"...'
# >>> r.json()
# {u'disk_usage': 368627, u'private_gists': 484, ...}

r = requests.get('http://aquarianpoolandspa.com/warranty')
# ensure that the program halts if a bad download occurs
r.raise_for_status()
# for error handling use a try except block
try:
    r.raise_for_status()
except:
    print('There was a problem')

header = str(r.headers).split("',")
header = "' \n".join(header)

print("\n")
print(type(r))
print("\n")
# prints object is <class 'request.models.Response'>
print(header)
# {'Content-Length': '9528'
#  'Vary': 'Accept-Encoding,Cookie'
#  'Server': 'nginx/1.10.2'
#  'Expires': 'Sat, 22 Oct 2016 16:49:45 GMT'
#  'Connection': 'keep-alive'
#  'Content-Type': 'text/html; charset=UTF-8'
#  'Cache-Control': 'max-age=3, must-revalidate'
#  'Content-Encoding': 'gzip'
#  'Date': 'Sat, 22 Oct 2016 16:49:42 GMT'
#  'Accept-Ranges': 'bytes'
#  'Last-Modified': 'Sat, 22 Oct 2016 15:30:13 GMT'}
print("\n")
print('Character Length In Bytes ->',len(r.text))
print("\n")
# prints all the markup from the page
print(r.text[:50])
# Print first 1000 bytes a good setting is actually 1000000
print("\n")
print('requests.codes.ok')
print(requests.codes.ok)

print("\n")
print('r.status_code')

print(r.status_code)
print("\n")
print('r.status_code == requests.codes.ok')
print(r.status_code == requests.codes.ok)

# SAVE THE TEXT RETURNED TO THE HARD DRIVE
# 1) CAll `request.get()` to download the file
# 2) call `open()` with `wb` to create a new file in write binary mode
# 3) Loop over the response object's `iter_content()` method
# 4) Call write() on each iteration to write to the file
# 5) Call  `close()` to close the file

playFile = open('aps_warranty.txt', 'wb')

for chunk in r.iter_content(1000000):
    playFile.write(chunk)

playFile.close()
