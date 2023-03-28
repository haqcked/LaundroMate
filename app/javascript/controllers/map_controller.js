import { Controller } from "@hotwired/stimulus"
import * as MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#setDirections()
}

#setDirections() {
  this.directions = new MapboxDirections({
    accessToken: this.apiKeyValue,
    unit: 'metric',
    profile: 'mapbox/hello',
    interactive: false,
    controls: {
      inputs: true,
      instructions: false,
      profileSwitcher: true
    }
  })

  const start = this.markersValue[0]
  const end = this.markersValue[1]
  this.map.addControl(this.directions, 'top-left');
  this.directions.setOrigin([start.lng, start.lat]);
  this.directions.setDestination([end.lng, end.lat]);
  document.querySelector('.mapbox-directions-component-keyline').remove()
  setTimeout(() => {
    document.getElementById("mapbox-directions-profile-driving-traffic").click()
  }, 2000);
}

#fitMapToMarkers() {
  const bounds = new mapboxgl.LngLatBounds()
  this.markersValue.forEach((marker) => {
    bounds.extend([ marker.lng, marker.lat ])
  })
  this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 }
  )
}

#addMarkersToMap() {
  this.markersValue.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)
  });

  }
}
