num = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen','eighteen', 'nineteen']
dec = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
hundred = 'hundred'

def GetDec(strNumber):
    tens = int(strNumber)
    if tens < 20:
      strTens = num[int(tens) - 1]
    else:
      strTens = dec[int(strNumber[0]) - 2]
      if strNumber[1] != '0':
        strTens += (num[int(strNumber[1]) - 1])
    return strTens

def ConvertToWords(number):
  strNumber = str(number)
  if len(strNumber) > 3:
    return 'onethousand'
  elif len(strNumber) > 2:
    strHundreds = num[int(strNumber[0]) - 1]
    if strNumber[1:] == '00':
      return "".join([strHundreds, 'hundred'])
    else:
      return "".join([strHundreds, 'hundredand', GetDec(strNumber[1:])])
  elif len(strNumber) >= 1:
    return GetDec(strNumber)

def main():
  letterCount = 0
  for i in xrange(1, 1001):
    word = ConvertToWords(i)
    letterCount += len(word)
#print i, ConvertToWords(i), len(word)
  print letterCount

if __name__ == "__main__":
  main()
