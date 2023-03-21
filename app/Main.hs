import Codec.Picture (PixelRGB8(..), writePng)
import Data.List (stripPrefix)
import Data.Maybe
import Data.Time.Clock.POSIX
import Options.Applicative
import System.Random (mkStdGen)
import Ferns (getFernByName, barnsleyFern)
import FernImage (fernImage)
import Text.Read (readMaybe)
import Turtle

data Options = Options {
    fernName :: String,
    iterations :: Int,
    imageDimensions :: (Int, Int),
    scale :: (Double, Double),
    offset :: (Double, Double),
    filePath :: String,
    backgroundColour :: PixelRGB8,
    foregroundColour :: PixelRGB8,
    seed :: Maybe Int
  }

parsePixelRGB8 :: String -> Maybe PixelRGB8
parsePixelRGB8 str =
  case stripPrefix "PixelRGB8 " str of
    Just rest ->
      case words rest of
        [r, g, b] -> PixelRGB8 <$> readMaybe r <*> readMaybe g <*> readMaybe b
        _ -> Nothing
    Nothing -> Nothing

options :: Parser Options
options = Options
    <$> strOption (
      short 'f' <>
      long "fern" <>
      help "The name of the fern to render" <>
      showDefault <>
      value "barnsley")
    <*> option auto (
      short 'i' <>
      long "iterations" <>
      help "The number of iterations to render" <>
      showDefault <>
      value 1000000)
    <*> option auto (
      short 'd' <>
      long "dimensions" <>
      help "The dimensions of the image in pixels" <>
      showDefault <>
      value (1000, 1000))
    <*> option auto (
      short 's' <>
      long "scale" <>
      help "The factors to scale the fern in the (x, y) axes" <>
      showDefault <>
      value (130, -90))
    <*> option auto (
      short 'o' <>
      long "offset" <>
      help "The offset in pixels to apply in the (x, y axes)" <>
      showDefault <>
      value (475, 950))
    <*> strOption (
      short 'p' <>
      long "filePath" <>
      help "The file path to output the image to" <>
      showDefault <>
      value "fern.png")
    <*> option (maybeReader parsePixelRGB8) (
      short 'b' <>
      long "backgroundColour" <>
      help "The colour of the background as an RGB8 value" <>
      showDefault <>
      value (PixelRGB8 0 49 83))
    <*> option (maybeReader parsePixelRGB8) (
      short 'c' <>
      long "fernColour" <>
      help "The colour of the fern as an RGB8 value" <>
      showDefault <>
      value (PixelRGB8 255 255 255))
    <*> optional (option auto (
      short 'S' <>
      long "seed" <>
      help "Random number generator seed. Defaults to current POSIX second."))

main :: IO ()
main = do
  let opts = info (options <**> helper)
             $ fullDesc
               <> header "Fernery 🌿"
               <> progDesc "A CLI tool for generating images of ferns"

  (Options fernName iterations imageDimensions scale offset filePath
           backgroundColour fernColour seedOption) <- execParser opts

  -- Find the matching fern to use
  let fern = getFernByName barnsleyFern fernName

  -- Determine the seed value to use
  now <- fmap round getPOSIXTime
  let seed = fromMaybe now seedOption

  -- Create and write the image to a file
  writePng filePath $ fernImage ((0,0), mkStdGen seed)
                                (TurtleConfig scale offset)
                                fern iterations imageDimensions
                                (backgroundColour, fernColour)
  putStrLn $ "Your fern has been saved at ./" ++ filePath ++ " 🌿"