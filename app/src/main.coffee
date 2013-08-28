$(document).ready ->
    map = L.map("map").setView([51.505, -0.09], 13)
    L.tileLayer("http://localhost:3141/test.png",
        attribution: "Test"
    ).addTo(map)
