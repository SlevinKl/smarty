import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/ghidalg0/cl32v4xxf003j14ql0xopsm9v"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    // ancien marker
    // new mapboxgl.Marker({ "color": "#7061DE" })
    //   .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
    //   .addTo(this.map)

    // Create a HTML element for your custom marker
    const customMarker = document.createElement("i")
    customMarker.className = this.markerValue.class_name

    // Pass the element as an argument to the new marker
    new mapboxgl.Marker(customMarker)
    .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
      .addTo(this.map)

  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 })
  }

}
