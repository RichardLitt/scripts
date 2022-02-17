#!/usr/bin/env python3

import os
import sys
import email
import getpass
import smtplib, ssl

from email.message import EmailMessage

content_file = '/Users/richard/src/scripts/logs/hotspots.log'

PORT = 465

with open(content_file, 'r', newline='') as f:
    content = f.read()

def send_email(content, sender='richard@burntfen.com', receiver='richard+birding@burntfen.com'):
    context = ssl.create_default_context()
    password = os.environ.get('GMAIL_PASS')
    smtp_server = "smtp.gmail.com"
    message = EmailMessage()
    message.set_content("My dearest, Richard,\n\n " + content + "\n\nI have the honour to be your obedient servant,\nRichard Littauer")
    message["Subject"] = "Hotspot Coverage in Montpelier Today"
    message["From"] = sender
    message["To"] = receiver

    with smtplib.SMTP_SSL(smtp_server, PORT, context=context) as server:
        server.login(sender, password)
        server.send_message(message)

if __name__ == "__main__":
    print(content)
    send_email(content)
    print("Done! Email sent!")
