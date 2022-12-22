# software

https://github.com/mpg-age-bioinformatics/software

One folder / tool

One folder / version

For automated builds a tag needs to be added and pushed.

Tag format must be:

`<tool>-<version>`

eg. `topgo-2.50.0`

`<tool>` must match the folder name of the tool
`<version>` must match the folder name of the version

Add tags and commit eg.:
```
git describe --abbrev=0 --tags # get last tag
git tag -e -a 1.2.0 HEAD
git push
git push origin --tags
```

For each tool a repo on hub.docker.com needs to be set before the first tag is pushed.


Eg. https://hub.docker.com/repository/docker/mpgagebioinformatics/multiqc
```
> Builds > Configure Automated Builds > 
```
Choose SOURCE REPOSITORY to mpg-age-bioinformatics/software
```
Source Type: Tag
Source /^multiqc-([0-9.]+)$/    ie.   /^<tool>-([0-9.]+)$/
Docker Tag: {\1} 
Dockerfile location: Dockerfile 
Build context: /
```

For ash like versions check: https://hub.docker.com/repository/docker/mpgagebioinformatics/cellplot

```
Source: /^cellplot-([^\n\r]*)/
```