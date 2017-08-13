#!/usr/bin/env python
# -*- coding: utf-8 -*-
# File              : .config/polybar/mail.py
# Author            : Morgareth <morgareth@tutanota.com>
# Date              : 10.08.2017
# Last Modified Date: 10.08.2017
# Last Modified By  : Morgareth <morgareth@tutanota.com>

import imaplib
obj = imaplib.IMAP4_SSL('imap.gmail.com', 993)
obj.login('mail', 'pass'   # write your email and password
obj.select()
print(len(obj.search(None, 'UnSeen')[1][0].split()))
