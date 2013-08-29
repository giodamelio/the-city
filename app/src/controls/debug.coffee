module.exports = L.Control.extend
    options:
        position: "topright"

    onAdd: (map) ->
        # Create the element
        container = L.DomUtil.create("div", "debug-control");

        # jQueryify it
        container = $(container)

        # Add a class to it
        container.addClass "leaflet-control-debug"

        # Make the basic layout
        markup = $(
            """
            <div class="uiElement button">
                <button id="goHome">Go to 0, 0!</button>
            </div>
            <div class="uiElement">
                <span id="zoom" class="labelFirst"></span>
            </div>
            """
        )

        # Make a button
        button = markup.children "#goHome"
        button.click ->
            map.setView [0, 0], map.getZoom()

        # Make a zoom display
        zoom = markup.children "#zoom"

        ## Set the level
        zoom.text map.getZoom()

        ## Set the zoom level when it changes
        map.on "zoomend", ->
            zoom.text map.getZoom()

        # Append the controls to the container
        container.append markup

        # Translate the element to vanilla DOM and return it
        return container.get(0)
