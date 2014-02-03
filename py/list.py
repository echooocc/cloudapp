#!/usr/bin/python
# Filename: list.py

#creating a list
movieList = ['Hugo','BatMan','SpiderMan','SuperMan']
#              0       1        2            3
#             -4      -3       -2           -1

name = 'Voldemort'
#		123456789
#     	

#sequence examples
print('Item 0', movieList[0])
print('Item 1', movieList[1])
print('Item 2', movieList[2])
print('Item 3', movieList[3])
print('Item -1', movieList[-1])
print('Item -2', movieList[-2])
print('Item -3', movieList[-3])
print('Item -4', movieList[-4])

#slicing the movieList
print('Item 0 to 1', movieList[0:1])
print('Item 0 to 2', movieList[0:2])
print('Item 0 to end', movieList[0:])
print('Item 1 to 1', movieList[1:1])
print('Item 2 to end', movieList[2:])
print('whole Items', movieList[:])
print('Item -4 to -2', movieList[-4:-2])
print('Item -3 to 3', movieList[-3:3])
print('Item 0 to -1', movieList[0:-1])

print(name)
print('Name',name[:])
print('Name',name)

#backwards the name
name_len = len(name)
print(name_len)
for item in name:
	print(item)
i = name_len
new_name=''

while i>0:
	new_name.append(name[i])
print(new_name)


#end of sequence examples 

print('There are', len(movieList), 'movies are shown in Oden.')
print('Movies are:', movieList)

for item in movieList:
	print(item)
	
movieList.append('WonderWoman')
print(movieList)

movieList[0]=('catWoman')
print('adding items', movieList)

movieList.sort()
print('After sorting list is',movieList)

del movieList[4]
print('After deleting list is',movieList)

