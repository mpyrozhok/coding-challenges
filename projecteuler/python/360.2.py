def BelongsToFigure(x, y, radiuSquared):
	if x*x + y*y == radiuSquared:
		return True
	else:
		return False

radius = 45
radiuSquared = 45 * 45

for i in range(0, radius):
	for j in range(0, radius):
		if BelongsToFigure(i, j, radiuSquared):
			print i, j
