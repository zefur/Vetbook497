import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '35px';
    element.style.height = '35px';
    
    new mapboxgl.Marker({color: 'red'})
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const getUserLocation = (sucess,failure) => {
  if (window.navigator.geolocation){
    window.navigator.geolocation.getCurrentPosition(sucess, failure);
  }
}

const getDistanceBetweenPoint = (latitude1,longitude1,latitude2,longitude2) => {
  const R = 6371e3; // metres
  const φ1 = latitude1 * Math.PI/180; // φ, λ in radians
  const φ2 = latitude2 * Math.PI/180;
  const Δφ = (latitude2-latitude1) * Math.PI/180;
  const Δλ = (longitude2-longitude1) * Math.PI/180;

const a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
          Math.cos(φ1) * Math.cos(φ2) *
          Math.sin(Δλ/2) * Math.sin(Δλ/2);
const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

const d = R * c;

return d;
}
const addMapMarker = (markers,map) =>{
  markers.forEach((marker) => {
    new mapboxgl.Marker()

      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
    });
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
}

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  let map 
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
     map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/charinrat/ckhyj7vqj0r6x19pjqivnnnav'
    
    });
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }));
      
  }
  return {map,mapElement};
};
 

export { initMapbox,getUserLocation,getDistanceBetweenPoint,addMapMarker};
