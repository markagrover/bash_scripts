#!/Users/markgrover/Desktop/Automate_task/venv/bin/python3.5

import webbrowser, sys, pyperclip
# call the open method of the webbrowser object
# import sys so we can retrieve the cammand line parameters
#webbrowser.open('http://inventwithpython.com/')

# Call a Google map of a location based on the clip board

if len(sys.argv) > 1:
    # get address from the comamnd line
    address = ' '.join(sys.argv[1:])
    # print(sys.argv)
    # for arg in range(len(sys.argv)):
    #     print(sys.argv[arg])
    # print(type(address))
else:
    # get parameters from clipboard
    address = pyperclip.paste()

# finnaly make our call to the webbrowser object
webbrowser.open('https://www.google.com/maps/place/' + address)
