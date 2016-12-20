# mbsystem-docker
Docker image for mbsystem

To run [mbsystem](http://www.ldeo.columbia.edu/res/pi/MB-System) as docker container do this:
```
docker pull ofrei/mbsystem
docker run -t -i ofrei/mbsystem
```

`mbsystem` is build from  `/mbsystem`.

`gmt` is installed to `/opt/gmt`, and build in `/gmt`.

Installation procedure for mbsystem is described [here](http://www.ldeo.columbia.edu/res/pi/MB-System/html/mbsystem_how_to_get.html#MB-get).
Some things did not work for me, so I created this repository that contains few small
[fixes](https://github.com/ofrei/mbsystem/commit/b247f684275a73a9b0c0f5cb19df40e6fe1acb0b) on top of `mbsystem-5.5.2263`.
