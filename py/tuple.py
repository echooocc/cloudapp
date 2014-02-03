#!/usr/bin/python
#Filename: tuple.py

#example of tuple 
skills = ('C','C++','Java')
print('I have', len(skills), 'skills')
print(skills)

webskill = ('HTML', 'CSS', 'PHP')
print('I have learned', webskill, len(webskill), 'skills')

newskill = (skills, webskill)
print('I have', len(webskill)+len(skills), 'currently skills')
print('The new skill I \'ve leanred this week', newskill[1][2])


singleInt = (2)  
singleString = ('c') 
singleTuple = (2,)
#del single[0] not supported in above data
print(singleTuple)
