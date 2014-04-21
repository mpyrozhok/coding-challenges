import math

def GetSumOfDivisors(number):
  i = 2
  summary = 1
  t = math.sqrt(number)
  while i < int(t) + 1:
    if number % i == 0:
      summary += i + number / i 
    i += 1 
  if t == int(t): summary -= t  
  return summary

def main():
  abundantNumbers = set()
  summary = 0
  for number in xrange(1, 28124):
    if GetSumOfDivisors(number) > number: 
      abundantNumbers.add(number)
    if not any((number - i in abundantNumbers) for i in abundantNumbers):
      summary += number
  print summary, len(abundantNumbers)
     
if __name__ == "__main__":
  main()
