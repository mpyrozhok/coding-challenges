def SumOfDigits(num):
	sum = 0
	for i in num:
		sum += int(i)
	return sum

def IsPrime(num):
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
	return True

#maxnum = 600851475143
#maxnum = 123456789012345678901234567890
maxnum = 1234567890123456789012345678901234567890
num = 2
while num != maxnum:
	if IsPrime(num):
		if maxnum % num == 0:
			if maxnum >= num:
				print num
				maxnum = maxnum / num
			else:
				break
	num += 1

