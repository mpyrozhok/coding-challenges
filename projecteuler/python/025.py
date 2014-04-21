
def fibonacci(n1, n2):
  return n1 + n2

def main():
  n1 = 1
  n2 = 1
  i = 2
  while True:
    nextNumber = fibonacci(n2, n1)
    n2 = n1
    n1 = nextNumber
    i += 1
    if len(str(nextNumber)) > 999:
      print nextNumber, i
      break 


if __name__ == "__main__":
  main()
