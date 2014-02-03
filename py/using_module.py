#!/usr/bin/python
# Filename: using_module.py


#method 1 MOST RECOMMEND
import module

module.info()
print('Version',module._version_)


#method 2
from module import info, _version_
info()
print('Version',_version_)

#method 3
from module import *
info()
#print('Version',_version_) not working
