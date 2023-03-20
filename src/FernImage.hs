module FernImage where
  import qualified Data.Set as Set
  import Codec.Picture
  import Ferns (Fern, genWeightedTransforms)
  import Turtle (TurtleState, TurtleConfig, moveTurtle, turtleToPixels)

  -- Create a fern image given an initial turtle state, a turtle config, a
  -- fern, a desired number of iterations and image width and height in pixels
  fernImage :: TurtleState -> TurtleConfig -> Fern -> Int -> (Int, Int) -> Image PixelRGB8
  fernImage turtle turtleConfig fern iterations (imageWidth, imageHeight) =
    generateImage getColour imageWidth imageHeight
      where
        -- Create our list of transforms to pick from uniformly at random
        transforms = genWeightedTransforms fern 100
        --- Create a list of all the turtle states ever
        turtleStates = iterate (moveTurtle transforms) turtle
        --- Create a set of pixels the turtle visited within our iterations
        visitedPixels = Set.fromList
                        $ take iterations 
                        $ map (turtleToPixels turtleConfig) turtleStates
        -- Create a function that maps an xy pixel coord to a colour
        getColour x y = if Set.member (x, y) visitedPixels
                        then PixelRGB8 255 255 255
                        else PixelRGB8 0 49 83