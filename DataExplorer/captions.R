# shared between server and ui so that labels are consistent
# also improves data representation

explDataName = 'Fuel economy data from 1999 and 2008 for 38 popular models of car'

explCaptions = list(
  'Manufacturer' = 'manufacturer',
  'Model' = 'model',
  'Engine displacement, in litres' = 'displ',
  'Year' = 'year',
  'Number of cylinders' = 'cyl',
  'Type of transmission' = 'trans',
  'Drive type' = 'drv',
  'City miles per gallon' = 'cty',
  'Highway miles per gallon' = 'hwy',
  'Fuel type' = 'fl',
  'Class' = 'class'
)
varLabels = names(explCaptions)
names(varLabels) = explCaptions

driveTypeLabels = list(
  '4' = '4wd', 
  'f' = 'front-wheel drive', 
  'r' = 'rear wheel drive'
  )
fuelTypeLabels = list(
  'c' = 'CNG', 
  'd' = 'diesel', 
  'e' = 'ethanol E85', 
  'p' = 'premium', 
  'r' = 'regular'
  )

explData = mpg

# apply nice labels
explData$fl = factor(explData$fl, labels = fuelTypeLabels)
explData$drv = factor(explData$drv, labels = driveTypeLabels)

# explicitly list on which vars to allow faceting
# sapply(explData, function(x) length(unique(x)))

explFacets = list(
  'Year' = 'year',
  'Number of cylinders' = 'cyl',
  'Drive type' = 'drv',
  'Fuel type' = 'fl',
  'Class' = 'class'
)
