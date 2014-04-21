import math

def GetTriangleNumber():
  i = 0
  triangleNumber = i
  while True:
    triangleNumber += i
    i += 1
    yield triangleNumber

def FactorNumber(inputNumber):
  factors = 0
  for i in xrange(1, int(math.sqrt(inputNumber)) + 1):
      if inputNumber % i == 0:
#print i
        factors += 1
  return factors

for i in GetTriangleNumber():
  factors = FactorNumber(i)
  if factors*2 > 500:
    print i, factors
 
