
def GetAlphabeticalSummary(name):
  return reduce(lambda x, y: x + y, map(lambda x: ord(x) - 64, name))
    

def main():
  f = open("names.txt", "r")
  inputString = f.read()
  inputList = filter(lambda x: len(x) > 0, sorted(inputString.replace('"', '').split(",")))
  summary = 0
  i = 0
  while i < len(inputList):
    summary += GetAlphabeticalSummary(inputList[i]) * (i + 1)
    i += 1
  print summary


if __name__ == "__main__":
  main()
