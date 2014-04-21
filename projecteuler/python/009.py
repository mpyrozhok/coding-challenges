
#def getPythagoreanQuadruplet(a, b, c):
#    return a*a + b*b + c*c
#
#target = 1000
#upperBound = 1000
#for i in xrange(upperBound):
#    for j in xrange(upperBound):
#        for k in xrange(upperBound):
#            if getPythagoreanQuadruplet(i, j, k) == target * target:
#                print i, j, k

def IsPythagoreanTriplet(a, b, c):
    return a*a + b*b == c*c

target = 1000
upperBound = 1000
for i in xrange(upperBound):
    for j in xrange(upperBound - i):
        k = target - i + j
        if IsPythagoreanTriplet(i, j, k) and i + j + k == target:
            print i, j, k, i*j*k
