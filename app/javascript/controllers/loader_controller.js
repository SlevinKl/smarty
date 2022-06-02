import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ["ploader"]
  connect() {
    console.log("connected");
    this.ploaderTarget.classList.add("d-none");
  }

  display() {
    console.log("click");
    this.ploaderTarget.classList.remove("d-none");
  }
}
