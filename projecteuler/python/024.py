numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

def GetNextNumber(array):
  i = len(array) - 1
  while i > 0:
    if array[i] > array [i - 1]:
      j = len(array) - 1
      while j > i - 1:
        if array[j] > array[i - 1]:
          proxy = array[i - 1]
          array[i - 1] = array[j]
          array[j] = proxy
          s = array[i:]
          s.reverse()
          array[i:] = s
          return array
        j -= 1
    i -= 1
  return None

def main():
  i = 1
  while(GetNextNumber(numbers)):
    if i == 999999:
      print "".join(map(lambda x: str(x), numbers))
      break
    i += 1

if __name__ == "__main__":
  main()
