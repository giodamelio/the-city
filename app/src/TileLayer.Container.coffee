# Modified from https://github.com/Leaflet/Leaflet/blob/master/src/layer/tile/TileLayer.Canvas.js

TileLayerContainer = L.TileLayer.extend(
    options:
        async: false

    initialize: (options) ->
        L.setOptions this, options

    redraw: ->
        if @_map
            @_reset hard: true
            @_update()
        for i of @_tiles
            @_redrawTile @_tiles[i]
        this

    _redrawTile: (tile) ->
        @drawTile tile, tile._tilePoint, @_map._zoom

    _createTile: ->
        tile = L.DomUtil.create("div", "leaflet-tile")
        tile.width = tile.height = @options.tileSize
        tile.onselectstart = tile.onmousemove = L.Util.falseFn
        tile

    _loadTile: (tile, tilePoint) ->
        tile._layer = this
        tile._tilePoint = tilePoint
        @_redrawTile tile
        @tileDrawn tile    unless @options.async

    drawTile: -> #tile, tilePoint
        # override with rendering code

    tileDrawn: (tile) ->
        @_tileOnLoad.call tile
)

module.exports = (options) ->
    new TileLayerContainer(options)