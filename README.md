# tsp.cr

```shell
crystal src/tsp.cr data/distances.csv $(NUMBER_OF_RUNS)
```

```shell
mkdir bin
crystal build src/tsp.cr -o bin/tsp --release
./bin/tsp data/distances.csv $(NUMBER_OF_RUNS)
```
