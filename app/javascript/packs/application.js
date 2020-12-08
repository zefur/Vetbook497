// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initMapbox, getUserLocation, getDistanceBetweenPoint,addMapMarker } from '../plugins/init_mapbox';
import mapboxgl from 'mapbox-gl';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  const {mapElement: element, map} = initMapbox();
  const success = (res) => {
    console.log(res);
    const userlat = res.coords.latitude;
    const userlog = res.coords.longitude;
    const markers = JSON.parse(element.dataset.markers);
    const nearby = markers.filter(marker => {
      const markerlng = marker.lng; 
      const markerlat = marker.lat;
      const distance = getDistanceBetweenPoint(userlat,userlog,markerlat,markerlng);
      return distance <= 100000;
    });
    if (nearby.length > 0)
      addMapMarker(nearby,map);
    //addMapMarker(markers,map);
  };

  const failure = (err) => {console.log(err)};
  getUserLocation(success, failure);
  
});

import "controllers"
