
daysOfYear = 365
daysOfLeapYear = 366
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def GetYearLength(number):
  return 366 if number % 4 == 0 else 365

def GetFirstDay(daysInYear, month, monthFirstDay):
  if month == 1: 
    monthFirstDay += 28 if daysInYear == 365 else 29
  else:
    monthFirstDay += months[month]
  return monthFirstDay

def main():
  previousYearResidue = 0
  matchingDays = 0
  for year in range(1900, 2001):
    currentDate = previousYearResidue
    daysInYear = GetYearLength(year)
    month = 0
    monthFirstDay = 0
    while currentDate < daysInYear:
      if currentDate >= monthFirstDay:
        if currentDate == monthFirstDay and year > 1900:
          matchingDays += 1
        monthFirstDay = GetFirstDay(daysInYear, month, monthFirstDay)
        month += 1
      currentDate += 7
    previousYearResidue = currentDate - daysInYear 
  print matchingDays
        
if __name__ == "__main__":
  main()

