# Fernery 🌿

A CLI tool for generating images of ferns.



## Getting Started

Install [stack](https://docs.haskellstack.org/en/stable/install_and_upgrade/), then:

```bash
git clone git@github.com:TheTeaCat/fernery.git
cd fernery
stack build
stack exec fernery-exe
```

This should generate an image of a Barnsley fern at [./fern.png](./fern.png) by default, with colours reminiscent of an [Anna Atkins cyanotype](https://www.moma.org/artists/231). 

Various options are available to customise the appearance of the ferns. To see the supported options, do:

```bash
stack exec -- fernery-exe --help
```



## Example Ferns

This list of examples is currently exhaustive, but I'd love to see more ferns added to this little CLI tool. 🧑‍🎨



### Barnsley Fern

```bash
stack exec -- fernery-exe -f barnsley
```

<p align="center">
  <img width="60%" src="./examples/barnsley.png">
</p>



### Leptosporangiate Fern

The transforms used in this fern were found [here](https://en.wikipedia.org/wiki/File:Barnsley_fern_mutated_-Leptosporangiate_fern.PNG).

```bash
stack exec -- fernery-exe -f leptosporangiate -s '(210, -160)'
```

<p align="center">
  <img width="60%" src="./examples/leptosporangiate.png">
</p>



### Thelypteridaceae Fern

The transforms used in this fern were found [here](https://en.wikipedia.org/wiki/File:Barnsley_fern_with_different_coefficients_plotted_with_VisSim.PNG).

```bash
stack exec -- fernery-exe -f thelypteridaceae -s '(-210, 125)'
```

<p align="center">
  <img width="60%" src="./examples/thelypteridaceae.png">
</p>



### The Sierpinski Gasket

```bash
stack exec -- fernery-exe -f sierpinskiGasket -o '(500,1000)' -s '(500,500)' -c 'PixelRGB8 0 0 0' -b 'PixelRGB8 255 255 255'
```

<p align="center">
  <img width="60%" src="./examples/sierpinskiGasket.png">
</p>



### The Heighway Dragon

```bash
stack exec -- fernery-exe -f heighwayDragon -o '(250,400)' -d '(1000, 800)' -s '(500,500)' -c 'PixelRGB8 0 0 0' -b 'PixelRGB8 255 255 255' -i 10000000
```

<p align="center">
  <img width="80%" src="./examples/heighwayDragon.png">
</p>




### DavidLDewey Fractal

The transforms used to generate this fractal are from an old worksheet authored by David L. Dewey which can be found [here](https://courses.cs.washington.edu/courses/cse142/01sp/misc/fractal_lab.htm).

```bash
stack exec -- fernery-exe -f davidLDewey -s '(3,3)' -o '(850,500)' -d '(1700,1000)' -b 'PixelRGB8 255 255 255' -c 'PixelRGB8 0 0 0'
```

<p align="center">
  <img width="80%" src="./examples/davidLDewey.png">
</p>
