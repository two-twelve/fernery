module Utils where
  type Point = (Double, Double)
  type Transform = Point -> Point

  -- A function for creating an affine transformation from a tuple
  affine :: (Double, Double, Double, Double, Double, Double) -> Transform
  affine (a, b, c, d, e, f) (x, y) = (a*x + b*y + e, c*x + d*y + f)

  -- Takes a radius and an x,y origin and returns an array of x,y coords in the
  -- Von Neumann neighbourhood of that radius of the origin
  vonNeumannNeighborhood :: Int -> (Int, Int) -> [(Int, Int)]
  vonNeumannNeighborhood radius (x, y) =
    let topLeft = (x - radius, y - radius)
        bottomRight = (x + radius, y + radius)
        validPoints = [(i,j) | i <- [fst topLeft .. fst bottomRight],
                               j <- [snd topLeft .. snd bottomRight],
                               abs (i-x) + abs (j-y) <= radius]
    in validPoints