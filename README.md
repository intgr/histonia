HiStonia
========

HiStonia is a [MapProxy](https://mapproxy.org/) configuration for serving up
**high-resolution tiles** from Estonian Maa-amet (Land Board) aerial photo maps,
which you can use as imagery in the **OpenStreetMap iD editor**.

High-resolution tiles are available from Maa-amet's WMS servers, but
unfortunately the iD editor only supports the TMS (Tile Map Service) protocol,
not WMS.

This MapProxy configuration provides TMS and converts back and forth between WMS.

### Usage

It's easiest to get started with Docker. The following will work on Linux and macOS:

```shell
DOCKER_BUILDKIT=1 docker build -t histonia .
docker run -it --rm --name=histonia -p 127.0.0.1:8080:8080 histonia
```

Once that is running, you can use the built-in demo:
http://localhost:8080/demo/?tms_layer=xgis&format=png&srs=EPSG%3A3857

You should see a map of Estonia!

[<img src="https://raw.githubusercontent.com/intgr/static/master/histonia/histonia-demo-thumb.jpg">](https://raw.githubusercontent.com/intgr/static/master/histonia/histonia-demo.png)

#### Configure iD editor

To use in the iD editor, open "Background Settings", choose "Custom".
Click on the "•••" next to "Custom" and enter the following URL:
```
http://localhost:8080/tiles/xgis/hidpi/{zoom}/{x}/{y}.png
```

### Is this allowed?

Yes, Maa-amet has issued an official permission to OpenStreetMap:
https://svimik.com/Maa-amet_vastus_OSM.pdf

Many public Maa-amet services are documented here:
https://geoportaal.maaamet.ee/est/Teenused/WMSWFS-teenused-p65.html

### Gallery

[<img src="https://raw.githubusercontent.com/intgr/static/master/histonia/histonia-01-thumb.jpg">](https://raw.githubusercontent.com/intgr/static/master/histonia/histonia-01.png)
[<img src="https://raw.githubusercontent.com/intgr/static/master/histonia/histonia-02-thumb.jpg">](https://raw.githubusercontent.com/intgr/static/master/histonia/histonia-02.png)
[<img src="https://raw.githubusercontent.com/intgr/static/master/histonia/histonia-03-thumb.jpg">](https://raw.githubusercontent.com/intgr/static/master/histonia/histonia-03.png)
