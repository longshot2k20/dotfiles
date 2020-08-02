# Anaconda

## Launching jupyter notebook with base folder in cwd

```console
conda activate bootcamp
conda run jupyter notebook
```

or

launch from Anaconda Navigator

to list token of running jupyter notebooks

```console
conda run jupyter notebook list
Currently running servers:
http://localhost:8888/?token=d8d01dc84ba36f4be55e920fb6511ebf0553280793563a20 :: /Users/apanizo
```

stop running notebook

```console
conda run jupyter notebook stop 8888
Shutting down server on port 8888 ...
```
