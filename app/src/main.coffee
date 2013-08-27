$(document).ready ->
    # Resize the canvas
    $("#canvasContainer").attr "width", window.innerWidth
    $("#canvasContainer").attr "height", window.innerHeight

    # Set the stage
    stage = new Kinetic.Stage
        container: "canvasContainer"
        width: window.innerWidth
        height: window.innerHeight

    # Automatically resize on widow resize
    $(window).resize ->
        stage.setSize window.innerWidth, window.innerHeight

    # Make a layer
    layer = new Kinetic.Layer()

    # Make a rectangle
    rect = new Kinetic.Rect
        x: 40
        y: 40
        width: 20
        height: 20
        fill: "red"

    # Say Hello World
    text = new Kinetic.Text
        x: stage.getWidth() / 2,
        y: stage.getHeight() / 2,
        text: "Hello World!",
        fontSize: 30,
        fontFamily: "Calibri",
        fill: "green"

    # Use an offset to center the text
    text.setOffset
        x: text.getWidth() / 2
        y: text.getHeight() / 2

    # Add the rect and text to the layer
    layer.add rect
    layer.add text

    # Add the layer to the stage
    stage.add layer
