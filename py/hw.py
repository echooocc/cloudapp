#!/usr/bin/python
#test 
#Filename:hw.py

def hello():
	print('HELLO WORLD')
#end of hello

def peter():
	age = 25
	name = 'Peter'

	print('{0} is {1} years old'.format(name,age))
	print('{0} is a good guy'.format(name))
#end of peter

def guess():
    
	print('Guess a Number')
	
	number = 47
	running = True
	
	while running:
		guess = int(input('Enter a integer : '))
	   
		if guess < number:
			print('No it\'s higher than that')
		elif guess > number:
			print('No it\'s lower that that')   
		else:
			print('Congras')
			break
	print('GAME OVER')
#end of guess

hello()



