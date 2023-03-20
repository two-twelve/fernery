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



