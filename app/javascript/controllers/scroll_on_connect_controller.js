import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-on-connect"
export default class extends Controller {
  connect() {

    // console.log((this.element.getBoundingClientRect().top))
    // console.log((document.body.getBoundingClientRect().top))
    // this.element.scrollIntoView({block: "center"});
    window.scrollTo({top: (this.element.getBoundingClientRect().top - document.body.getBoundingClientRect().top - 300)});
  }
}
