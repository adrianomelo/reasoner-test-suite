# reasoner-test-suite
Set of ontologies and resources to evaluate OWL reasoners


Update summary information:
```bash
R CMD BATCH --no-save --no-restore scrits/summary.r /tmp/out ; cat /tmp/out
```

Create a file with metadata information about the ontologies:
```bash
cat test-cases/all/ontologies.csv | grep -f test-cases/inconsistent/filelist.txt > test-cases/inconsistent/filelist.csv
```
