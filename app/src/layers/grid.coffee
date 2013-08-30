# Add a ContainerLayer
tileLayerContainer = require "../util/TileLayer.Container.coffee"

canvasTiles = tileLayerContainer(
    tms: true # Invert the cords system
    continuousWorld: true # No horizontal wrap
    noWrap: true # No wrap
)

## Draw the tiles
canvasTiles.drawTile = (container, tilePoint, zoom) ->
    # Set the stage
    stage = new Kinetic.Stage
        container: container
        width: 256
        height: 256

    # Make a layer
    layer = new Kinetic.Layer()

    # Make a rectangle for the background
    background = new Kinetic.Rect
        x: 0
        y: 0
        width: 256
        height: 256
        fill: "#FFBA64"
        stroke: "#3499DB"
        strokeWidth: 2

    # Add the coords to the center
    coords = new Kinetic.Text
        x: stage.getWidth() / 2
        y: stage.getHeight() / 2
        text: "#{tilePoint.x}, #{tilePoint.y}"
        fontSize: 30
        fill: "black"

    # Offset to center the text
    coords.setOffset
        x: coords.getWidth() / 2
        y: coords.getHeight() / 2

    # Add the items to the layer
    layer.add background
    layer.add coords

    # A dd the layer to the stage
    stage.add layer

module.exports = canvasTiles