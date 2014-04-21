def GetNextNumber(number):
  if number % 2 == 0:
    return number / 2
  else:
    return 3 * number + 1

maxIterationCount = 0
for i in xrange(1000000 + 1):
  number = i
  iterations = 0
  while number > 1:
    number = GetNextNumber(number)
    iterations += 1
  if iterations > maxIterationCount:
    maxIterationCount = iterations
    print i, iterations
     
