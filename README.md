# alicut-aliscore-docker
Ubuntu 16.04 with ALISCORE v2.0 and AliCUT v2.31

``bash
docker run -it -v $(pwd):/in/ -w /in/ --rm chrishah/aliscore-cut-docker Aliscore.pl -h
```

```bash
docker run -it -v $(pwd):/in/ -w /in/ --rm chrishah/aliscore-cut-docker ALICUT.pl
#quit with 'q'
```
