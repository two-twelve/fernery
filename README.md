# Fernando

A CLI tool for generating images of ferns 🌿



## Getting Started

Install [stack](https://docs.haskellstack.org/en/stable/install_and_upgrade/), then:

```bash
git clone git@github.com:TheTeaCat/fernando.git
cd fernando
stack build
stack exec fernando-exe
```

This should generate an image of a Barnsley fern at [./fern.png](./fern.png) by default. You can supply flags to fernando as follows:

```bash
stack exec -- fernando-exe --help
```



## Examples

This list of examples is currently exhaustive, but I'd love to see more ferns added to this little CLI tool. 🧑‍🎨



### Barnsley Fern

```bash
stack exec -- fernando-exe -p 'examples/barnsley.png'
```

<p align="center">
  <img width="60%" src="./examples/barnsley.png">
</p>



### Leptosporangiate fern

The transforms used in this fern were found [here](https://en.wikipedia.org/wiki/File:Barnsley_fern_mutated_-Leptosporangiate_fern.PNG).

```bash
stack exec -- fernando-exe -p 'examples/leptosporangiate.png' -f leptosporangiate -s '(210, -160)'
```

<p align="center">
  <img width="60%" src="./examples/leptosporangiate.png">
</p>



### Thelypteridaceae fern

The transforms used in this fern were found [here](https://en.wikipedia.org/wiki/File:Barnsley_fern_with_different_coefficients_plotted_with_VisSim.PNG).

```bash
stack exec -- fernando-exe -p 'examples/thelypteridaceae.png' -f thelypteridaceae -s '(-210, 125)'
```

<p align="center">
  <img width="60%" src="./examples/thelypteridaceae.png">
</p>



