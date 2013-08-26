$(document).ready ->
    canvas = new fabric.Canvas "canvas",
        backgroundColor: "lightblue"

    rect = new fabric.Rect
      left: 100
      top: 100
      fill: 'red'
      width: 25
      height: 25

    canvas.add rect

    canvas.on "mouse:move", (event) ->
        if event.target
            console.log "Hover"

    rect.selectable = false

    $("#go").click ->
        rect.animate "top", 50
        rect.animate "left", 50
        rect.animate "width", 50
        rect.animate "height", 50
        rect.animate "angle", 45

    $("#reset").click ->
        rect.animate "left", 100
        rect.animate "top", 100
        rect.animate "width", 25
        rect.animate "height", 25
        rect.animate "angle", 0

    animate = ->
        canvas.renderAll()
        requestAnimationFrame animate
    requestAnimationFrame animate