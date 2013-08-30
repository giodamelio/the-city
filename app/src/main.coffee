$(document).ready ->
    # Make the map
    map = L.map("map",
        crs: L.CRS.Simple # Simple coord system
        maxZoom: 9
        minZoom: 1
        maxBounds: [[-1024, -1024], [1024, 1024]]
    ).setView([0, 0], 1)

    # Add the grid layer
    map.addLayer require("./layers/grid.coffee")

    # Add a marker at 0, 0
    map.addLayer require("./layers/centerMarker.coffee")

    # Add a square around the max bounds
    map.addLayer require("./layers/boundingBox.coffee")

    # Add a debug widget
    map.addControl require("./controls/debug.coffee")
