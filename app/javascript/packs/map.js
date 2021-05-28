import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });


    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
     });

    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
     };

     if (mapElement) {
      // [ ... ]
      fitMapToMarkers(map, markers);
       }
    };
}
export { initMapbox };


// // postal_code to long, lat
// const postcodeCoordinates = (postal_code) => {
//   let longitude = 0;
//   let latitude = 0;
//   fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${postal_code}.json?access_token=pk.eyJ1IjoiY2hzaGF3biIsImEiOiJja25meWo5aDQyNmF6MnBtdW90cXp2b253In0.GDNnR92sf5_0fhBO5jJuGQ`)
//     .then(response => response.json())
//     .then((data) => {
//       longitude = data.features[0].center[0];
//       latitude = data.features[0].center[1];
//       console.log(`${longitude}, ${latitude}`);
//     });
// });

