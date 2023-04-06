# software

https://github.com/mpg-age-bioinformatics/software

One folder / tool

One folder / version

For automated builds a tag needs to be added and pushed.

Tag format must be:

`<tool>-<version>`

`<tool>` must match the folder name of the tool and can not contain any `-` on it

`<version>` must match the folder name of the version

eg. `kallisto-0.48.0`, adding tags and commiting eg.:
```
git describe --abbrev=0 --tags # get last tag
git tag -e -a kallisto-0.48.0 HEAD
git push
git push origin --tags
```

Image will then be available under: https://hub.docker.com/repository/docker/mpgagebioinformatics/kallisto:0.48.0