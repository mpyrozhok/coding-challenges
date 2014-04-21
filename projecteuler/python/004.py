def IsPalyndrom(number):
	strNum = str(number)
	length = len(strNum) / 2 + len(strNum) % 2 
	if strNum == strNum[::-1]:
		return True
	return False

largestPalyndrom = 0
for i in range(100, 1000):
	for j in range(100, 1000):
		if IsPalyndrom(i * j):
			if largestPalyndrom < i * j:
				largestPalyndrom = i * j
			#print i * j
print largestPalyndrom
		

