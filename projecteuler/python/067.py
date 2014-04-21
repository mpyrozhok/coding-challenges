
def ConvertToNumericArray(inputStr):
  return [map(int, x) for x in map(lambda x: x.split(" "), filter(lambda x: len(x) > 0, inputStr.split("\r\n")))]

def MergeRow(triangle, rowNum):
  i = 0
  while i < len(triangle[rowNum]):
    triangle[rowNum][i] += triangle[rowNum + 1][i] if triangle[rowNum + 1][i] > triangle[rowNum + 1][i + 1] else triangle[rowNum + 1][i + 1]
    i += 1

def main(argv = None):
  f = open('triangle.txt', "r")
  inputString = f.read()
  numericTriangle = ConvertToNumericArray(inputString)
  summary = 0
  ancestorIndex = 0
  i = len(numericTriangle) - 2
  while i >= 0:
    MergeRow(numericTriangle, i)
    i -= 1
  print numericTriangle[0][0]

if __name__ == "__main__":
  main()

