# reasoner-test-suite
Set of ontologies and resources to evaluate OWL reasoners

## Features
 - [Graph: Histogram of logical axioms](test-cases/expressivity-alc/filelist.csv.histogram.pdf)
 - [Graph: Expressivity of ontologies](https://github.com/adrianomelo/reasoner-test-suite/blob/master/test-cases/all/filelist.csv.pie.pdf)
 - [Graph: Kernel density estimation of logical axioms](https://github.com/adrianomelo/reasoner-test-suite/blob/master/test-cases/expressivity-alc/filelist.csv.density.pdf)
 - [Descriptive statistics of dataset](https://github.com/adrianomelo/reasoner-test-suite/blob/master/test-cases/all/filelist.csv.summary.txt)
 - [Some selected ORE competitions](test-cases)


## How to..

Update expressivity information:
```bash
awk -F "," '{print $16}' test-cases/all/filelist.csv | sort | uniq -c | sort -n -r > test-cases/all/filelist.csv.expressivity.txt
```

Update summary information:
```bash
R CMD BATCH --no-save --no-restore scrits/summary.r /tmp/out ; cat /tmp/out
```

Create a file with metadata information about the ontologies:
```bash
cat test-cases/all/ontologies.csv | grep -f test-cases/inconsistent/filelist.txt > test-cases/inconsistent/filelist.csv
```
