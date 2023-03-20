import Codec.Picture (writePng)
import Options.Applicative
import System.Random (mkStdGen)
import Ferns (getFernByName, barnsleyFern)
import FernImage (fernImage)
import Turtle

data Options = Options {
    fernName :: String,
    iterations :: Int,
    imageDimensions :: (Int, Int),
    scale :: (Double, Double),
    offset :: (Double, Double),
    filePath :: String
  }

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

main :: IO ()
main = do
  let opts = info (options <**> helper)
             $ fullDesc
               <> header "Functional Fern Generator"
               <> progDesc "A handy tool for generating images of ferns"

  (Options fernName iterations imageDimensions scale offset filePath
    ) <- execParser opts

  -- Find the matching fern to use
  let fern = getFernByName barnsleyFern fernName

  -- Create and write the image to a file
  writePng filePath $ fernImage ((0,0), mkStdGen 123456789)
                                (TurtleConfig scale offset)
                                fern iterations imageDimensions
  putStrLn $ "Your fern has been saved at ./" ++ filePath ++ " 🌿"