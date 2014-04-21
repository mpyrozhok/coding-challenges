def IsEven(num):
	if num % 2 == 0:
		return True
	else:
		return False

num = 1
num1 = 2
summary = 2
while num1 <= 4000000:
	fib = num + num1
	num = num1
	num1 = fib
	#print fib
	if IsEven(fib):
		summary += fib
		#print fib
		#print summary

print summary	
	
