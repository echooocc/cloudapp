#!/usr/bin/python
# Filename: dictionary.py

apps = { 'photograph' : 'camera+',
		 'social'     : 'path' ,
		 'book'	      : 'ibooks',
		 'news'		  : 'flipboard'
		 }
		 
print(apps)

for category, name in apps.items():
	print('{0} : {1}'.format(category, name))
	
del apps['book']
print('after delete', apps)

apps['game']='angry bird'
print('after add', apps)

if 'new' in apps:
	print('apps has news', apps['news'])
else:
	print('apps does not')