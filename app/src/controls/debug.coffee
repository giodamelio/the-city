module.exports = L.Control.extend
    options:
        position: "topright"

    onAdd: (map) ->
        # Create the element
        container = L.DomUtil.create("div", "debug-control");

        # jQueryify it
        container = $(container)

        # Make a button
        button = $("<button></button>")
        button.text "Go to 0, 0!"
        button.click ->
            map.setView [0, 0], map.getZoom()

        # Append the button
        container.append button

        # Translate the element to vanilla DOM and return it
        return container.get(0)
