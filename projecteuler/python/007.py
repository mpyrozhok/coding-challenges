def SumOfDigits(num):
	sum = 0
	for i in num:
		sum += int(i)
	return sum

def IsPrime(num, primes):
	if num % 2 == 0:
		return False
	elif num % 3 == 0:
		return False
	elif num % 4 == 0:
		return False
	elif num % 5 == 0:
		return False 
	elif len(str(num)) > 1:
		if (int(str(num)[:-1]) - int(str(num)[-1])*2) % 7 == 0:
			return False
	elif len(str(num)) > 2:
		if int(str(num)[-3:]) % 8 == 0:
			return False
	elif SumOfDigits(str(num)) % 9 == 0:
		return False
	elif str(str(num)[-1]) == 0:
		return False
	else:
		for i in primes:
			print i
			if num % i == 0:
				return False
	return True

i = 1
count = 4
primes = []
while True:
	if IsPrime(i, primes):
		primes.append(i)
		count += 1 
	if count == 10001:
		print i
		break
	i += 1
print primes
	

