import random, time, math

def FermatTest(number, testRunsCount):
    positiveResults = 0
    for i in range(1, testRunsCount): 
        rawRandom = random.random()
        randomString = str(rawRandom)
        randomInteger = int(randomString[2:4])
#       print randomInteger
        testValue = randomInteger**(number - 1) % number
# print int(testValue)
        if int(testValue) == 1:
            positiveResults += 1
    return True if positiveResults > 0 and testRunsCount / positiveResults >= 0.99 else False

def toBinary(n):
  r = []
  while (n > 0):
    r.append(n % 2)
    n = n / 2
  return r

def test(a, n):
  """
  test(a, n) -> bool Tests whether n is complex.

  Returns:
    - True, if n is complex.
    - False, if n is probably prime.
  """
  b = toBinary(n - 1)
  d = 1
  for i in xrange(len(b) - 1, -1, -1):
    x = d
    d = (d * d) % n
    if d == 1 and x != 1 and x != n - 1:
      return True # Complex
    if b[i] == 1:
      d = (d * a) % n
  if d != 1:
    return True # Complex
  return False # Prime

def MillerRabin(n, s = 1):
  """
    MillerRabin(n, s = 1000) -> bool Checks whether n is prime or not

    Returns:
      - True, if n is probably prime.
      - False, if n is complex.
  """
  for j in xrange(1, s + 1):
    a = random.randint(1, n - 1)
    if (test(a, n)):
      return False # n is complex
  return True # n is prime

def IsPrime(number):
    upperBound = int(math.sqrt(number)) + 1
    i = 3
    if number != 5 and number % 5 == 0:
        return False
    while i < upperBound:
        if number % i == 0:
            return False
        i += 1
    return True

def IsPrime2(number):
    upperBound = int(math.sqrt(number)) + 1
    i = 3
    while i < upperBound:
        if number % i == 0:
            return False
        i += 1
    return True

def EratospheneSieve(maxNumber, printNumber = 10002):
    sieveArray = range(maxNumber)
    sieveArray[0] = 0
    i = 2
    startElement = i
    while i < maxNumber:
        if sieveArray[i] != 0:
            j = 2 * i
            while j < maxNumber:
                sieveArray[j] = 0
                j += i
        i += 1
    
    sequenceNumber = 0
    for i in sieveArray:
        if sieveArray[i] != 0:
            sequenceNumber += 1
            if (sequenceNumber == printNumber):
                print sieveArray[i]
        


#FermatTest(29, 5000)
s = time.time()
i = 3
primeCount = 1
while primeCount < 10001: 
    if MillerRabin(i):
        primeCount += 1
    i += 2
print i
print time.time() - s

s = time.time()
i = 3
primeCount = 1
while primeCount < 10000:
    i += 2
    if IsPrime(i):
        primeCount += 1
print i
print time.time() - s

s = time.time()
i = 3
primeCount = 1
while primeCount < 10000:
    i += 2
    if IsPrime2(i):
        primeCount += 1
print i
print time.time() - s

s = time.time()
EratospheneSieve(1200000)
print time.time() - s
