import qualified Codec.Picture as Picture
import qualified Data.Set as Set
import Options.Applicative
import System.Environment
import System.Random

-- Define a point and a transform
type Point = (Double, Double)
type Transform = Point -> Point

-- Define transforms & probabilities we're going to use to draw our fern
barnsleyTransforms, leptosporangiateTransforms, thelypteridaceaeTransforms ::
  [(Double, Transform)]
barnsleyTransforms = [
    (0.02, \(x, y) -> ( 0.00*x +0.00*y,  0.00*x +0.16*y -0.00)),
    (0.84, \(x, y) -> ( 0.85*x +0.04*y, -0.04*x +0.85*y +1.60)),
    (0.07, \(x, y) -> ( 0.20*x -0.26*y,  0.23*x +0.22*y +1.60)),
    (0.07, \(x, y) -> (-0.15*x +0.28*y,  0.26*x +0.24*y +0.44))
  ]
leptosporangiateTransforms = [
    (0.02, \(x, y) -> ( 0.00*x +0.00*y,  0.00*x +0.25*y -0.14)),
    (0.84, \(x, y) -> ( 0.85*x +0.02*y, -0.02*x +0.83*y +1.00)),
    (0.07, \(x, y) -> ( 0.09*x -0.28*y,  0.30*x +0.11*y +0.60)),
    (0.07, \(x, y) -> (-0.09*x +0.28*y,  0.30*x +0.09*y +0.70))
  ]
thelypteridaceaeTransforms = [
    (0.02, \(x, y) -> ( 0.000*x +0.000*y +0.000,  0.000*x +0.25*y -0.40)),
    (0.84, \(x, y) -> ( 0.950*x +0.005*y -0.002, -0.005*x +0.93*y -0.50)),
    (0.07, \(x, y) -> ( 0.035*x -0.200*y -0.009,  0.160*x +0.04*y -0.70)),
    (0.07, \(x, y) -> (-0.040*x +0.200*y +0.083,  0.160*x +0.04*y -0.70))
  ]

-- Define an image config consisting of an image width and height, an offset x
-- and y in pixels and a factor by which to scale in the X and Y
type ImageConfig = ((Int, Int), (Double, Double), (Double, Double))
barnsleyConfig = ((1000, 1000), (475, 950), (130, -90))
leptosporangiateConfig = ((1000, 1000), (475, 950), (190, -155))
thelypteridaceaeConfig = ((1000, 1000), (475, 950), (-180, 120))

-- Define a function that returns a list of n items where item x occurs
-- round(p(x)*n) times
genWeightedBag :: [(Double, a)] -> Int -> [a]
genWeightedBag xs n =
  concatMap (\(p, t) -> replicate (round (p * (fromIntegral n))) t) xs

-- Define a TurtleState as a point and a random number generator
type TurtleState = (Point, StdGen)

-- Define a function that returns a new turtle state given a bag of transforms
-- and a previous turtle state
moveTurtle :: [Transform] -> TurtleState -> TurtleState
moveTurtle transforms (p, g) = (transform p, g')
  where
    (i, g') = randomR (0, length transforms - 1) g
    transform = transforms !! i

-- Define a function that takes a TurtleState and image config and returns the
-- turtle's pixel coordinate
turtleToPixels :: ImageConfig -> TurtleState -> (Int, Int)
turtleToPixels (_, (offsetX, offsetY), (scaleX, scaleY)) ((x, y), _) = (
    round $ x * scaleX + offsetX,
    round $ y * scaleY + offsetY
  )

-- Define a function that turns a turtle state, a number of iterations, a list
-- of transforms with their probabilities and an image config into an RGB image
fernImage :: TurtleState -> Int -> [(Double, Transform)] -> ImageConfig
             -> Picture.Image Picture.PixelRGB8
fernImage turtle iterations transforms imageConfig =
  Picture.generateImage getColour imageWidth imageHeight
    where
      -- Pattern match out the image dimensions from the config
      ((imageWidth, imageHeight), _, _) = imageConfig
      -- Create our bag of transforms to pick from at random
      bagOfTransforms = genWeightedBag transforms 100
      --- Create a list of all the turtle states
      turtleStates = iterate (moveTurtle bagOfTransforms) turtle
      --- Create a set of all of the pixels we're going to render on the image
      visitedPixels = Set.fromList
                      $ take iterations 
                      $ map (turtleToPixels imageConfig) turtleStates
      -- Define a function that takes an xy pixel coord and returns its colour
      getColour x y = if Set.member (x, y) visitedPixels
                      then Picture.PixelRGB8 255 255 255
                      else Picture.PixelRGB8 0 49 83

main = do
  -- Choose the fern and how many iterations we want
  let (transforms, config) = (barnsleyTransforms, barnsleyConfig)
  let iterations = 10_000_000

  -- Create and write the image to a file
  let filename = "fern.png"
  Picture.writePng filename
    $ fernImage ((0,0), mkStdGen 123456789) iterations transforms config
  putStrLn $ "Your fern has been saved at ./" ++ filename ++ " 🌿"