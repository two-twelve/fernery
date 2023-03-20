module Ferns where
  -- Define a fern as a list of transforms with probabilities
  type Point = (Double, Double)
  type Transform = Point -> Point
  type Fern = [(Double, Transform)]

  barnsleyFern, leptosporangiateFern, thelypteridaceaeFern :: Fern
  barnsleyFern = [
      (0.02, \(x, y) -> ( 0.00*x +0.00*y,  0.00*x +0.16*y -0.00)),
      (0.84, \(x, y) -> ( 0.85*x +0.04*y, -0.04*x +0.85*y +1.60)),
      (0.07, \(x, y) -> ( 0.20*x -0.26*y,  0.23*x +0.22*y +1.60)),
      (0.07, \(x, y) -> (-0.15*x +0.28*y,  0.26*x +0.24*y +0.44))
    ]
  leptosporangiateFern = [
      (0.02, \(x, y) -> ( 0.00*x +0.00*y,  0.00*x +0.25*y -0.14)),
      (0.84, \(x, y) -> ( 0.85*x +0.02*y, -0.02*x +0.83*y +1.00)),
      (0.07, \(x, y) -> ( 0.09*x -0.28*y,  0.30*x +0.11*y +0.60)),
      (0.07, \(x, y) -> (-0.09*x +0.28*y,  0.30*x +0.09*y +0.70))
    ]
  thelypteridaceaeFern = [
      (0.02, \(x, y) -> ( 0.000*x +0.000*y +0.000,  0.000*x +0.25*y -0.40)),
      (0.84, \(x, y) -> ( 0.950*x +0.005*y -0.002, -0.005*x +0.93*y -0.50)),
      (0.07, \(x, y) -> ( 0.035*x -0.200*y -0.009,  0.160*x +0.04*y -0.70)),
      (0.07, \(x, y) -> (-0.040*x +0.200*y +0.083,  0.160*x +0.04*y -0.70))
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
                                     | otherwise = defaultFern
