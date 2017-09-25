#!/usr/bin/python

import imaplib
obj = imaplib.IMAP4_SSL('imap.gmail.com',993)
obj.login('thiagors1983@gmail.com','Isa15082010') # write your email and password
obj.select()
print(len(obj.search(None, 'UnSeen')[1][0].split()))
