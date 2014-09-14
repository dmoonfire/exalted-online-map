/*
 * Set up the graphics layer
 */
var creationGeography = new ol.layer.Tile({
    source: new ol.source.XYZ({
        attributions: [
            new ol.Attribution({
				html: '<br/>Contents &copy; <a href="http://www.white-wolf.com/">White Wolf</a><br>Graphics &copy; <a href="http://mfgames.com/">Dylan R. E. Moonfire</a>, <a href="https://creativecommons.org/licenses/by/4.0/">CC BY</a>'
            })
        ],
        url: 'http://exalted-map.mfgames.com/creation-geo/z{z}/x{x}y{y}.png'
    })
});

/*
 * Set up the vector layers.
 */

var canonLocations = new ol.layer.Vector({
	source: new ol.source.KML({
		projection: 'EPSG:3857',
		url: 'canon.kml'
	})
});

/*
 * Set up the rest of the map.
 */

var map = new ol.Map({
    target: 'map',
    layers: [creationGeography, canonLocations],
    view: new ol.View({
        center: [0, 0],
        zoom: 3
    })
});

/*
 * Set up the popup
 */

var element = document.getElementById('popup');

var popup = new ol.Overlay({
  element: element,
  positioning: 'bottom-center',
  stopEvent: false
});

map.addOverlay(popup);

// display popup on click
map.on('click', function(evt) {
  var feature = map.forEachFeatureAtPixel(evt.pixel,
      function(feature, layer) {
        return feature;
      });

	if (feature) {
		var geometry = feature.getGeometry();
		var coord = geometry.getCoordinates();
		popup.setPosition(coord);

		$(element).popover('destroy');
		$(element).popover({
			'placement': 'auto',
			'html': true,
			'content': feature.get('name').replace(/ /g, '&#160;')
		});
		$(element).popover('show');
	} else {
		$(element).popover('destroy');
	}
	
	feature = null;
});

// change mouse cursor when over marker
$(map.getViewport()).on('mousemove', function(e) {
  var pixel = map.getEventPixel(e.originalEvent);
  var hit = map.forEachFeatureAtPixel(pixel, function(feature, layer) {
    return true;
  });
  if (hit) {
    map.getTarget().style.cursor = 'pointer';
  } else {
    map.getTarget().style.cursor = '';
  }
});
