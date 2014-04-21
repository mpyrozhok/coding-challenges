def BelongsToSphere(x, y, z, r):
	if (x*x + y*y + z*z) == r:
		return True
	else:
		return False

def GetManhattanLength(x, y, z):
	return x + y + z

summary = 0
radius = 750
radiuSquared = radius * radius
incidentalSummary = 0
for i in range(radius):
	for j in range(radius):
		for k in range(radius):
			if BelongsToSphere(i, j, k, radiuSquared):
				ml = GetManhattanLength(i, j, k)
				if i == 0 or j == 0 or k == 0:
					incidentalSummary += ml 
				summary += ml
				print i, j, k, ml, summary

print summary*8 - incidentalSummary*3 #- vertexSummary*2
print incidentalSummary
