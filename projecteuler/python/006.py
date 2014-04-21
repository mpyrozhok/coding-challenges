
summaryOfSquares = 0
summary = 0
for i in range(1, 101):
	summaryOfSquares += i * i
	summary += i

print summaryOfSquares - summary*summary
