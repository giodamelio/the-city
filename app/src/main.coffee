$(document).ready ->
    # Make the map
    map = L.map("map",
        crs: L.CRS.Simple # Simple coord system
        tms: true # Invert the cords system
        continuousWorld: true # No horizontal wrap
        noWrap: true # No wrap
    ).setView([0, 0], 2)

    # Add the tiles
    L.tileLayer("http://localhost:3141/test.png",
        maxZoom: 9
    ).addTo(map)

    # Add a mouse coordinates widget
    L.control.coordinates(
        position: "bottomright"
        decimals: 2
        labelTemplateLat: "Y: {y}"
        labelTemplateLng: "X: {x}"
        enableUserInput: false
    ).addTo(map)
