# Fernery 🌿

A CLI tool for generating images of ferns and other [Iterated Function Systems](https://en.wikipedia.org/wiki/Iterated_function_system).



## Getting Started

Fernery is available to install from our Homebrew Tap.

```bash
brew tap two-twelve/tap
brew install fernery
fernery
```

This should generate an image of a Barnsley fern at [./fern.png](./fern.png) by default, with colours reminiscent of an [Anna Atkins cyanotype](https://www.moma.org/artists/231). 

Various options are available to customise the appearance of the ferns. To see the supported options, do:

```bash
fernery --help
```

You can also build and run Fernery with [stack](https://docs.haskellstack.org/en/stable/install_and_upgrade/):

```bash
git clone git@github.com:TheTeaCat/fernery.git
cd fernery
stack build
stack exec fernery-exe
```



## [Fractal Tees](https://fractal-tees.teemill.com/) 🛍

A selection of images generated using Fernery are available printed on T-shirts and tote bags at [fractaltees.shop](https://fractal-tees.teemill.com/).

<p align="center">
  <a href="https://fractal-tees.teemill.com/product/barnsley-fern/">
    <img width="30%" src="https://images.teemill.com/hthlgpp2ekwkdsanevfm7euvrohiiywzkwrblrcfabuqtw8h.png.webp?w=640&h=657&v=2">
  </a>
  <a href="https://fractal-tees.teemill.com/product/leptosporangiate/">
    <img width="30%" src="https://images.teemill.com/uwck3iw0pruwtoahmyeowm40ujjuvwpd8c6mlohdcop70gyv.png.webp?w=640&h=657&v=2">
  </a>
  <a href="https://fractal-tees.teemill.com/product/thelypteridaceae-shirt/">
    <img width="30%" src="https://images.teemill.com/i1rj0flwe6eq8crh5iqwgu75y0iyuzfo5sqcydmffmv5jb5v.png.webp?w=640&h=657&v=2">
  </a>
</p>


## Example Images

This list of examples is currently exhaustive of the IFSs provided in Fernery, but I'd love to see more added to this little CLI tool. PRs are welcome! 🧑‍🎨

- [Barnsley Fern](#Barnsley-Fern)
- [Leptosporangiate Fern](#Leptosporangiate-Fern)
- [Thelypteridaceae Fern](#Thelypteridaceae-Fern)
- [The Sierpinski Gasket](#The-Sierpinski-Gasket)
- [The Sierpinski Carpet](#The-Sierpinski-Carpet)
- [The Sierpinski Pentagon](#The-Sierpinski-Pentagon)
- [The Levy Dragon](#The-Levy-Dragon)
- [The Heighway Dragon](#The-Heighway-Dragon)
- [McWorter's Pentigree](#McWorters-Pentigree)
- [The Koch Curve](#The-Koch-Curve)
- [The Koch Snowflake](#The-Koch-Snowflake)
- [DavidLDewey Fractal](#DavidLDewey-Fractal)
- [Tree Fractal](#Tree-Fractal)



### Barnsley Fern

```bash
fernery -f barnsley
```

<p align="center">
  <img width="60%" src="./examples/barnsley.png">
</p>


### Leptosporangiate Fern

The transforms used in this fern were found [here](https://en.wikipedia.org/wiki/File:Barnsley_fern_mutated_-Leptosporangiate_fern.PNG).

```bash
fernery -f leptosporangiate -s '(210, -160)'
```

<p align="center">
  <img width="60%" src="./examples/leptosporangiate.png">
</p>


### Thelypteridaceae Fern

The transforms used in this fern were found [here](https://en.wikipedia.org/wiki/File:Barnsley_fern_with_different_coefficients_plotted_with_VisSim.PNG).

```bash
fernery -f thelypteridaceae -s '(-210, 125)'
```

<p align="center">
  <img width="60%" src="./examples/thelypteridaceae.png">
</p>


### The Sierpinski Gasket

```bash
fernery -f sierpinskiGasket -o '(500,1000)' -s '(500,500)' -c 'PixelRGBA8 0 0 0 255' -b 'PixelRGBA8 255 255 255 255'
```

<p align="center">
  <img width="60%" src="./examples/sierpinskiGasket.png">
</p>


### The Sierpinski Carpet

```bash
fernery -f sierpinskiCarpet -o '(50,50)' -s '(900,900)' -i 10000000 -c 'PixelRGBA8 255 255 255 255' -b 'PixelRGBA8 114 47 55 255' 
```

<p align="center">
  <img width="60%" src="./examples/sierpinskiCarpet.png">
</p>


### The Sierpinski Pentagon

```bash
fernery -f sierpinskiPentagon -o '(250,875)' -s '(500,500)' -b 'PixelRGBA8 135 206 235 255' -c 'PixelRGBA8 0 0 0 255'
```

<p align="center">
  <img width="60%" src="./examples/sierpinskiPentagon.png">
</p>


### The Levy Dragon

```bash
fernery -f levyDragon -o '(275,250)' -s '(450,450)' -d '(1000,800)' -b 'PixelRGBA8 251 206 177 255' -c 'PixelRGBA8 0 0 0 255'
```

<p align="center">
  <img width="80%" src="./examples/levyDragon.png">
</p>


### The Heighway Dragon

```bash
fernery -f heighwayDragon -o '(250,500)' -d '(1000, 800)' -s '(600,600)' -c 'PixelRGBA8 0 0 0 255' -b 'PixelRGBA8 255 255 255 255' -i 2000000
```

<p align="center">
  <img width="80%" src="./examples/heighwayDragon.png">
</p>


### McWorter's Pentigree

```bash
fernery -f mcWortersPentigree -o '(130,330)' -s '(800,800)' -b 'PixelRGBA8 202 231 193 255' -c 'PixelRGBA8 0 0 0 255'
```

<p align="center">
  <img width="60%" src="./examples/mcWortersPentigree.png">
</p>


### The Koch Curve

```bash
fernery -f kochCurve -s '(900,-900)' -o '(50,450)' -d '(1000,600)' -b 'PixelRGBA8 120 81 169 255'
```

<p align="center">
  <img width="80%" src="./examples/kochCurve.png">
</p>


### The Koch Snowflake

```bash
fernery -f kochSnowflake -o '(500,500)' -s '(450,450)' -b 'PixelRGBA8 220 243 255 255' -c 'PixelRGBA8 57 109 124 255'
```

<p align="center">
  <img width="60%" src="./examples/kochSnowflake.png">
</p>


### DavidLDewey Fractal

The transforms used to generate this fractal are from an old worksheet authored by David L. Dewey which can be found [here](https://courses.cs.washington.edu/courses/cse142/01sp/misc/fractal_lab.htm).

```bash
fernery -f davidLDewey -s '(3,3)' -o '(850,500)' -d '(1700,1000)' -b 'PixelRGBA8 255 255 255 255' -c 'PixelRGBA8 0 0 0 255'
```

<p align="center">
  <img width="80%" src="./examples/davidLDewey.png">
</p>


### Tree Fractal

This fractal can also be found on Peter E. Francis' [IFS Fractals](http://ifs-fractals.herokuapp.com/playground/tree).

```bash
fernery -f treeFractal -o '(50,950)' -s '(900,-900)' -c 'PixelRGBA8 0 0 0 255' -b 'PixelRGBA8 255 255 255 255'
```

<p align="center">
  <img width="60%" src="./examples/treeFractal.png">
</p>


## Acknowledgements

The following have been useful sources of Iterative Function Systems to add to Fernery:

- [Larry Riddle's Classic Iterated Function Systems](https://larryriddle.agnesscott.org/ifs/ifs.htm)
- [David L. Dewey's Generating Fractals with Affine Transformations](https://courses.cs.washington.edu/courses/cse142/01sp/misc/fractal_lab.htm)
- [Peter E. Francis' IFS Fractals](http://ifs-fractals.herokuapp.com/)
