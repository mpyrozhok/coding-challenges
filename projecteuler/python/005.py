def IsEvenlyDivisible(number, divisors):
	for i in divisors:
		if number % i != 0:
			return False
	return True

i = 20
divisors = range(2, 21)
divisors.reverse()
while not IsEvenlyDivisible(i, divisors):
	i += 20

print i 
