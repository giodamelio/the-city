$(document).ready ->
    # Make the map
    map = L.map("map",
        crs: L.CRS.Simple # Simple coord system
        maxZoom: 9
        minZoom: 1
        maxBounds: [[-1024, -1024], [1024, 1024]]
    ).setView([0, 0], 1)

    # Add a ContainerLayer
    tileLayerContainer = require "./TileLayer.Container.coffee"
    canvasTiles = tileLayerContainer(
        tms: true # Invert the cords system
        continuousWorld: true # No horizontal wrap
        noWrap: true # No wrap
        attribution: "Built by <a href=\"http://github.com/giodamelio\">giodamelio</a>"
    )

    ## Draw the tiles
    canvasTiles.drawTile = require "./layers/main.coffee"

    map.addLayer canvasTiles

    # Add a marker at 0, 0
    L.marker([0, 0]).addTo(map)

    # Add a square around the max bounds
    L.rectangle([[-1024, -1024], [1024, 1024]],
        color: "#1111ff"
        fill: false
    ).addTo(map)

    # Add a debug widget
    debugControl = require "./controls/debug.coffee"
    map.addControl new debugControl() 
