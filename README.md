# Knife
## Description
This container image contains knife. It's a chef tool that can come in handy

## Tags
We do publish a latest tag for this image since it is a build image. It allows our CI to always have the latest image with minimal maintenance.

If you want to run a specific version of knife, please have a look at the other available tags.

## Usage
```
docker run --rm \
  -v $(pwd):/data \
  fxinnovation/knife \
  [COMMAND OPTIONS]
```

This image will only work if in you current directory you have your `.chef` directory and the chef resource (cookbook, environment, data_bag, etc).

## Comments & Issues
If you have comments or detect an issue, please be adviced we don't check the docker hub comments. You can always contact us through the repository.
