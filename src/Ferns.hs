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

  heighwayDragon :: Fern
  heighwayDragon = [
      (0.5, affine (0.5, 0.5, -0.5, 0.5, 0, 0)),
      (0.5, affine (-0.5, -0.5, 0.5, -0.5, 1, 0))
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
                                     | fernName == "heighwayDragon" =
                                        heighwayDragon
                                     | fernName == "davidLDewey" =
                                        davidLDewey
                                     | otherwise = defaultFern
