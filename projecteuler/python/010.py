
def EratospheneSieve(maxNumber):
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
    
    summary = 0
    for i in sieveArray:
        summary += sieveArray[i]
    print summary - 1

EratospheneSieve(2000000)

