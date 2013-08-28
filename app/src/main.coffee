$(document).ready ->
    # Get the container
    canvasContainer = $("#canvasContainer")

    # Resize the canvas
    canvasContainer.attr "width", window.innerWidth
    canvasContainer.attr "height", window.innerHeight

    # Set the stage
    stage = new Kinetic.Stage
        container: "canvasContainer"
        width: window.innerWidth
        height: window.innerHeight
        draggable: true

    # Make it a bit bigger
    stage.setWidth stage.getWidth() + 200
    stage.setHeight stage.getHeight() + 200
    stage.setOffset 100, 100

    # Automatically resize on widow resize
    $(window).resize ->
        stage.setSize window.innerWidth, window.innerHeight

    # Make a layer
    layer = new Kinetic.Layer

    # Make a border around the stage
    borderRect = new Kinetic.Rect
        x: 0
        y: 0
        width: stage.getWidth()
        height: stage.getHeight()
        fill: "rgba(0,0,0,0)"
        stroke: "black",
        strokeWidth: 2

    # Listen for key presses
    $(window).keyup (event) ->
        if event.keyCode == 71
            console.log "Toggling Grid"

    # Add the rect and text to the layer
    layer.add borderRect

    # Add the layer to the stage
    stage.add layer
