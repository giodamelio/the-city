$(document).ready ->
    # Make the map
    map = L.map("map",
        crs: L.CRS.Simple # Simple coord system
        maxZoom: 9
        minZoom: 1
        maxBounds: [[-500, -500], [500, 500]]
    ).setView([0, 0], 1)

    # Add the tiles
    L.tileLayer("http://localhost:3141/test.png?zoom={z}&x={x}&y={y}",
        tms: true # Invert the cords system
        continuousWorld: true # No horizontal wrap
        noWrap: true # No wrap
    ).addTo(map)

    # Add a debug widget
    debugControl = require("./controls/debug.coffee")
    map.addControl new debugControl() 
