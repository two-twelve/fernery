module Turtle where
  import System.Random (StdGen, randomR)
  import Ferns (Point, Transform, Fern)

  -- Define a TurtleState as a point and a random number generator
  type TurtleState = (Point, StdGen)

  -- Define a function that returns a new turtle state given a list of
  -- transforms to pick from uniformly at random and the previous turtle state
  moveTurtle :: [Transform] -> TurtleState -> TurtleState
  moveTurtle transforms (p, g) = (transform p, g')
    where (i, g') = randomR (0, length transforms - 1) g
          transform = transforms !! i

  -- Define a TurtleConfig consisting of scales and offsets for the xy axes
  data TurtleConfig = TurtleConfig {
      scale :: (Double, Double),
      offset :: (Double, Double)
    }

  -- Define a function that takes a TurtleConfig and TurtleState and returns
  -- the TurtleState's position in pixel coordiantes
  turtleToPixels :: TurtleConfig -> TurtleState -> (Int, Int)
  turtleToPixels (TurtleConfig (scaleX, scaleY) (offsetX, offsetY)) 
                 ((x, y), _) = (
                    round $ x * scaleX + offsetX,
                    round $ y * scaleY + offsetY
                 )