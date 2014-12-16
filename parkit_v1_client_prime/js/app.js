parkingMap = function(map, jsonData) {

    var pointTypes = d3.map(),
        points = [],

    var drawWithLoading = function(e){
        d3.select('#loading').classed('visible', true);
        if (e && e.type == 'viewreset') {
            d3.select('#overlay').remove();
        }
        setTimeout(function(){
            draw();
            d3.select('#loading').classed('visible', false);
        }, 0);
    };

    var draw = function() {
        d3.select('#overlay').remove();
        var bounds = map.getBounds(),
            //topLeft = map.latLngToLayerPoint(bounds.getNorthWest()),
            //bottomRight = map.latLngToLayerPoint(bounds.getSouthEast()),
            existing = d3.set(),
            drawLimit = bounds.pad(0.4);

        filteredPoints = pointsFilteredToSelectedTypes().filter(function(d) {
            var latlng = new L.LatLng(d.latitude, d.longitude);
            if (!drawLimit.contains(latlng)) { return false };
            var point = map.latLngToLayerPoint(latlng);
            key = point.toString();
            if (existing.has(key)) { return false };
            existing.add(key);
            d.x = point.x;
            d.y = point.y;
            return true;
        });


        svgPoints.append("circle")
            .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; })
            .style('fill', function(d) { return '#' + d.color } )
            .attr("r", 2);
    };

    var mapLayer = {
        onAdd: function(map) {
            map.on('viewreset moveend', drawWithLoading);
            drawWithLoading();
        }
    };

    map.on('ready', function() {
        d3.json(jsonData, function(collection) {
            points = collection;
            points.forEach(function(point) {
                pointTypes.set(point.type, {type: point.type, color: point.color});
            });
            drawPointTypeSelection();
            map.addLayer(mapLayer);
        });
    });
};
