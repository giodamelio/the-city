$(document).ready ->
    # Make the map
    map = L.map("map",
        crs: L.CRS.Simple # Simple coord system
        maxZoom: 9
        minZoom: 1
        maxBounds: [[-500, -500], [500, 500]]
    ).setView([0, 0], 1)

    # Add the tiles
    L.tileLayer("http://localhost:3141/test.png",
        tms: true # Invert the cords system
        continuousWorld: true # No horizontal wrap
        noWrap: true # No wrap
        attribution: "Built by <a href=\"http://github.com/giodamelio\">giodamelio</a>"
    ).addTo(map)

    # Add a marker at 0, 0
    L.marker([0, 0]).addTo(map)

    # Add a square around the max bounds
    L.rectangle([[-500, -500], [500, 500]],
        color: "#1111ff"
        fill: false
    ).addTo(map)

    # Add a debug widget
    debugControl = require("./controls/debug.coffee")
    map.addControl new debugControl() 
