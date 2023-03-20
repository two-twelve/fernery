from PIL import Image
import random

# Define the width and height of our image in pixels and fern space
IMAGE_WIDTH, IMAGE_HEIGHT = (1000, 1000)
FERN_MIN_X, FERN_WIDTH = -2.6, 5.5 # Thelypteridaceae fern
FERN_MIN_Y, FERN_HEIGHT = -1, 8.5 # Thelypteridaceae fern

# Create the image we'll draw the fern onto
FERN_IMAGE = Image.new(
    'RGB', (IMAGE_WIDTH + 1, IMAGE_HEIGHT + 1),
    (0, 49, 83) # A nice prussian blue
)
fern_pixels = FERN_IMAGE.load()

# Take ten million steps starting at (0,0)
current_x, current_y = 0, 0
for i in range(10_000_000):
    # For each step, pick a number between 1 and 100 (inclusive)
    choice = random.randint(1,100)

    # Depending upon the number chosen, perform one of the transforms
    if choice <= 2:
        current_x, current_y = (
             0,
             0.250 * current_y - 0.400
        )
    elif choice <= 2+84:
        current_x, current_y =  (
             0.950 * current_x + 0.005 * current_y - 0.002,
            -0.005 * current_x + 0.930 * current_y + 0.500
        )
    elif choice <= 2+84+7:
        current_x, current_y = (
             0.035 * current_x - 0.200 * current_y - 0.009,
             0.160 * current_x + 0.040 * current_y + 0.700
        )
    else:
        current_x, current_y = (
            -0.040 * current_x + 0.200 * current_y + 0.083,
             0.160 * current_x + 0.040 * current_y + 0.700
        )

    # Set the pixel at the current position to white
    fern_pixels[
        round((current_x - FERN_MIN_X) / (FERN_WIDTH) * IMAGE_WIDTH),
        round((current_y - FERN_MIN_Y) / (FERN_HEIGHT) * IMAGE_HEIGHT) * -1
    ] = (255, 255, 255)

# Save the fern
FERN_FILENAME = "fern.png"
FERN_IMAGE.save(FERN_FILENAME)
print(f"Your fern has been saved at ./{FERN_FILENAME} 🌿")