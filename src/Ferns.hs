module Ferns where
  -- Define a fern as a list of transforms with probabilities
  type Point = (Double, Double)
  type Transform = Point -> Point
  type Fern = [(Double, Transform)]

  -- Define a function for creating affine transformations
  affine :: (Double, Double, Double, Double, Double, Double) -> Transform
  affine (a, b, c, d, e, f) (x, y) = (a*x + b*y + e, c*x + d*y + f)

  barnsleyFern :: Fern
  barnsleyFern = [
      (0.02, affine (0, 0, 0, 0.16, 0, 0)),
      (0.84, affine (0.85, 0.04, -0.04, 0.85, 0, 1.6)),
      (0.07, affine (0.2, -0.26, 0.23, 0.22, 0, 1.6)),
      (0.07, affine (-0.15, 0.28, 0.26, 0.24, 0, 0.44))
    ]

  leptosporangiateFern :: Fern
  leptosporangiateFern = [
      (0.02, affine (0, 0, 0, 0.25, 0, -0.14)),
      (0.84, affine (0.85, 0.02, -0.02, 0.83, 0, 1.0)),
      (0.07, affine (0.09, -0.28, 0.3, 0.11, 0, 0.6)),
      (0.07, affine (-0.09, 0.28, 0.3, 0.09, 0, 0.7))
    ]

  thelypteridaceaeFern :: Fern
  thelypteridaceaeFern = [
      (0.02, affine (0, 0, 0, 0.25, 0, -0.4)),
      (0.84, affine (0.95, 0.005, -0.005, 0.93, -0.002, -0.5)),
      (0.07, affine (0.035, -0.2, 0.16, 0.04, -0.009, -0.7)),
      (0.07, affine (-0.040, 0.2, 0.16, 0.04, 0.083, -0.7))
    ]

  sierpinskiGasket :: Fern
  sierpinskiGasket = [
      (0.33, affine (0.5, 0, 0, 0.5, 0, -1)),
      (0.33, affine (0.5, 0, 0, 0.5, 1, 1)),
      (0.34, affine (0.5, 0, 0, 0.5, -1, 1))
    ]

  sierpinskiCarpet :: Fern
  sierpinskiCarpet = [
      (0.125, affine(1/3, 0, 0, 1/3, 0, 0)),
      (0.125, affine(1/3, 0, 0, 1/3, 0, 1/3)),
      (0.125, affine(1/3, 0, 0, 1/3, 0, 2/3)),
      (0.125, affine(1/3, 0, 0, 1/3, 1/3, 0)),
      (0.125, affine(1/3, 0, 0, 1/3, 1/3, 2/3)),
      (0.125, affine(1/3, 0, 0, 1/3, 2/3, 0)),
      (0.125, affine(1/3, 0, 0, 1/3, 2/3, 1/3)),
      (0.125, affine(1/3, 0, 0, 1/3, 2/3, 2/3))
    ]
  
  sierpinskiPentagon :: Fern
  sierpinskiPentagon = [
      (0.2, affine(0.382, 0, 0, 0.382, 0, 0)),
      (0.2, affine(0.382, 0, 0, 0.382, 0.618, 0)),
      (0.2, affine(0.382, 0, 0, 0.382, 0.809, -0.588)),
      (0.2, affine(0.382, 0, 0, 0.382, 0.309, -0.951)),
      (0.2, affine(0.382, 0, 0, 0.382, -0.191, -0.588))
    ]
  
  levyDragon :: Fern
  levyDragon = [
      (0.5, affine (0.5, -0.5, 0.5, 0.5, 0, 0)),
      (0.5, affine (0.5, 0.5, -0.5, 0.5, 0.5, 0.5))
    ]

  heighwayDragon :: Fern
  heighwayDragon = [
      (0.5, affine (0.5, 0.5, -0.5, 0.5, 0, 0)),
      (0.5, affine (-0.5, -0.5, 0.5, -0.5, 1, 0))
    ]
  
  mcWortersPentigree :: Fern
  mcWortersPentigree = [
      (1/6, affine (0.309, -0.255, 0.255, 0.309, 0, 0)),
      (1/6, affine (-0.188, -0.363, 0.363, -0.188, 0.309, 0.255)),
      (1/6, affine (0.309, 0.255, -0.255, 0.309, 0.191, 0.588)),
      (1/6, affine (-0.188, 0.363, -0.363, -0.188, 0.5, 0.363)),
      (1/6, affine (0.309, 0.255, -0.255, 0.309, 0.382, 0)),
      (1/6, affine (0.309, -0.255, 0.255, 0.309, 0.691, -0.255))
    ]
  
  kochCurve :: Fern
  kochCurve = [
      (0.25, affine (1/3, 0, 0, 1/3, 0, 0)),
      (0.25, affine (1/6, - sqrt 3 / 6, sqrt 3 / 6, 1/6, 1/3, 0)),
      (0.25, affine (1/6, sqrt 3 / 6, - sqrt 3 / 6, 1/6, 1/2, sqrt 3 / 6)),
      (0.25, affine (1/3, 0, 0, 1/3, 2/3, 0))
    ]
  
  kochSnowflake :: Fern
  kochSnowflake = [
      (1/7, affine (1/2, - sqrt 3 / 6, sqrt 3 / 6, 1/2, 0, 0)),
      (1/7, affine (1/3, 0, 0, 1/3, 1 / sqrt 3, 1/3)),
      (1/7, affine (1/3, 0, 0, 1/3, 0, 2/3)),
      (1/7, affine (1/3, 0, 0, 1/3, - 1 / sqrt 3, 1/3)),
      (1/7, affine (1/3, 0, 0, 1/3, - 1 / sqrt 3, -1/3)),
      (1/7, affine (1/3, 0, 0, 1/3, 0, -2/3)),
      (1/7, affine (1/3, 0, 0, 1/3, 1 / sqrt 3, -1/3))
    ]

  -- Sourced from an old Fractal lab worksheet:
  -- https://courses.cs.washington.edu/courses/cse142/01sp/misc/fractal_lab.htm
  davidLDewey :: Fern
  davidLDewey = [
      (0.25, affine (0.4, 0, 0, 0.4, -160, 0)),
      (0.25, affine (0.4, 0.0, 0.0, 0.4, 160, 0)),
      (0.25, affine (0.4, -0.5, 0.5, 0.4, 0, 0)),
      (0.25, affine (0.4, 0.5, -0.5, 0.4, 0, 0))
    ]

  -- Sourced from the IFS Fractals web app
  -- http://ifs-fractals.herokuapp.com/playground/tree
  treeFractal :: Fern
  treeFractal = [
      (0.2, affine (0.195, -0.488, 0.462, 0.414, 0.4431, 0.2452)),
      (0.2, affine (0.462, 0.414, -0.252, 0.361, 0.2511, 0.5692)),
      (0.2, affine (-0.058, -0.07, 0.453, -0.111, 0.5976, 0.0969)),
      (0.2, affine (-0.035, 0.07, -0.469, -0.022, 0.4884, 0.5069)),
      (0.2, affine (-0.637, 0, 0, 0.501, 0.8562, 0.2513))
    ]

  -- Define a func that creates a list of transforms of size N for a fern where
  -- each transform occurs round(p(t) * N) times where p(t) is the probability
  -- of transform t
  genWeightedTransforms :: Fern -> Int -> [Transform]
  genWeightedTransforms xs n =
    concatMap (\(p, t) -> replicate (round (p * fromIntegral n)) t) xs

  -- Define a func that returns a fern by its string name with a default
  getFernByName :: Fern -> String -> Fern
  getFernByName defaultFern fernName | fernName == "barnsley" =
                                        barnsleyFern
                                     | fernName == "leptosporangiate" =
                                        leptosporangiateFern
                                     | fernName == "thelypteridaceae" =
                                        thelypteridaceaeFern
                                     | fernName == "sierpinskiGasket" = 
                                        sierpinskiGasket
                                     | fernName == "sierpinskiCarpet" =
                                        sierpinskiCarpet
                                     | fernName == "sierpinskiPentagon" =
                                        sierpinskiPentagon
                                     | fernName == "levyDragon" =
                                        levyDragon
                                     | fernName == "heighwayDragon" =
                                        heighwayDragon
                                     | fernName == "mcWortersPentigree" =
                                        mcWortersPentigree
                                     | fernName == "kochCurve" =
                                        kochCurve
                                     | fernName == "kochSnowflake" =
                                        kochSnowflake
                                     | fernName == "davidLDewey" =
                                        davidLDewey
                                     | fernName == "treeFractal" =
                                        treeFractal
                                     | otherwise = defaultFern
