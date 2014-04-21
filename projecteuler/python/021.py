import math

def GetDivisorsSummary(number):
  summary = 1 
  for i in xrange(2, int(math.sqrt(number))+ 1):
    if number % i == 0:
      summary += (i + number/i)
  return summary

def main():
  summary = 0
  for i in xrange(2, 10001):
   possibleAmicable = GetDivisorsSummary(i)
   if possibleAmicable != i and GetDivisorsSummary(possibleAmicable) == i:
#print possibleAmicable, i
     summary += i
  print summary
      

if __name__ == "__main__":
  main()
