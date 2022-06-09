import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ["ploader"]
  connect() {
    this.ploaderTarget.classList.add("d-none");
  }

  display() {
    this.ploaderTarget.classList.remove("d-none");
  }
}
