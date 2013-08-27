$(document).ready ->
    # Resize the canvas
    $("#canvas").attr "width", window.innerWidth
    $("#canvas").attr "height", window.innerHeight

    # Make the canvas
    canvas = new fabric.Canvas "canvas",
        backgroundColor: "lightblue"

    # Automatically resize on widow resize
    $(window).resize ->
        canvas.setDimensions
            width: window.innerWidth
            height: window.innerHeight

    # Make the rectangle
    rect = new fabric.Rect
        left: 100
        top: 100
        fill: "red"
        width: 20
        height: 20

    # Make the rectangle non-selectable
    rect.selectable = false

    # Add the rectangle to the canvas
    canvas.add rect
        
    # Animate the canvas
    animate = ->
        canvas.renderAll()
        requestAnimationFrame animate
    requestAnimationFrame animate