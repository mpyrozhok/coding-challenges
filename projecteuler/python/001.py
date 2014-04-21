
def IsMultiple(number, base):
	if number%base == 0:
		return True
	else:
		return False

summary = 0
for num in range(1, 1000):
	if IsMultiple(num, 3):
		summary += num
	elif IsMultiple(num, 5):
		summary += num
print summary
		
