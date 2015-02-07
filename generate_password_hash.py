#!/bin/env python
import crypt, getpass

pass1 = getpass.getpass("Enter password: ")
pass2 = getpass.getpass("Confirm password: ")

if pass1 == pass2:
    key = crypt.crypt(pass1, crypt.mksalt(crypt.METHOD_SHA512))
    print(key)
    print("\nTips: you can add this password to the vault using the command")
    print("\tknife vault create passwords <username> '{\"password\": \"%s\"}' -S '<clients search query>' -A '<admins>'" % key)
else:
    print("Passwords mismatch")
