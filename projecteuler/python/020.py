import math

def main():
  number = math.factorial(100)
  print sum(reduce(lambda x, y: x+ y, [map(int, x) for x in str(number)]))

if __name__ == "__main__":
  main()

