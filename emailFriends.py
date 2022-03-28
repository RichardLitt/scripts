#!/usr/bin/env python3

# Needs a file with newline-delimited names
# I use friends.md, with "Robinson Crusoe\nCount of Monte Cristo" etc.

# Also note the plist file in local.richard.friends.plist. This is the file I use to automatically run each day on launchd.

import os
import sys
import email
import random
import getpass
import smtplib, ssl

from email.message import EmailMessage

logfile = '/Users/richard/docs/friends/friends.log'

PORT = 465

def send_friend(friends_file):
    friends = []
    sent_friends = []
    fsize = os.stat(friends_file).st_size

    with open(friends_file, 'r') as f:
        friends = [x.strip('\n') for x in f.readlines()]

    if os.path.exists(logfile):
        with open(logfile, 'r') as f:
            sent_friends = [x.strip('\n') for x in f.readlines()]

        if fsize == os.stat(logfile).st_size:
            with open(logfile, 'w') as f:
                sent_friend = random.choice(friends)
                f.write(f"{sent_friend}")
                f.write("\n")
            return sent_friend

        with open(logfile, 'a') as f:
            sent_friend = random.choice(friends)
            while sent_friend in sent_friends:
                sent_friend = random.choice(friends)

            sent_friends.append(sent_friend)
            f.write(f"{sent_friend}")
            f.write("\n")
        return sent_friend
    else:
        with open(logfile, 'w') as f:
            sent_friend = random.choice(friends)
            while sent_friend in sent_friends:
                sent_friend = random.choice(friends)

            sent_friends.append(sent_friend)
            f.write(f"{sent_friend}")
            f.write("\n")
        return sent_friend

# Note Replace with sections!
def send_email(content, sender='<replace with email>', receiver='<replace with email>'):
    context = ssl.create_default_context()
    password = '<replace with app specific password from gmail>'
    smtp_server = "smtp.gmail.com"
    message = EmailMessage()
    message.set_content("My dearest, Richard,\n\nI don't know how long it has been, but today seems like a good day to contact " + content + ".\n\nI have the honour to be your obedient servant,\nRichard Littauer")
    message["Subject"] = "Friend of the day: " + content
    message["From"] = sender
    message["To"] = receiver

    with smtplib.SMTP_SSL(smtp_server, PORT, context=context) as server:
        server.login(sender, password)
        server.send_message(message)

if __name__ == "__main__":
    if len(sys.argv) == 1:
        print("Usage: python3 friends.py <friend_list>")
        sys.exit(1)
    friend = send_friend(sys.argv[1])
    print(friend)
    send_email(friend)
    print("Done! Email sent!")
