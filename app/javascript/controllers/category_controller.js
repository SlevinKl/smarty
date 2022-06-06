import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category"
export default class extends Controller {
  static targets = ["voyage", "culture", "sport", "autres"]
  connect() {
    console.log("connected")
  }

  choose_voyage() {
    console.log("connected choose")
    console.log(this.voyageTarget);
    // this.voyageTarget.classList.toggle("fa-2x");
    // this.cultureTarget.classList.remove("fa-2x");
    // this.sportTarget.classList.remove("fa-2x");
    // this.autresTarget.classList.remove("fa-2x");
  }

  choose_culture() {
    console.log("connected choose")
    console.log(this.cultureTarget);
    // this.cultureTarget.classList.toggle("fa-2x");
    // this.sportTarget.classList.remove("fa-2x");
    // this.voyageTarget.classList.remove("fa-2x");
    // this.autresTarget.classList.remove("fa-2x");
  }

  choose_sport() {
    console.log("connected choose")
    console.log(this.sportTarget);
    // this.sportTarget.classList.toggle("fa-2x");
    // this.cultureTarget.classList.remove("fa-2x");
    // this.voyageTarget.classList.remove("fa-2x");
    // this.autresTarget.classList.remove("fa-2x");
  }

  choose_autres() {
    console.log("connected choose")
    console.log(this.autresTarget);
    // this.autresTarget.classList.toggle("fa-2x");
    // this.cultureTarget.classList.remove("fa-2x");
    // this.voyageTarget.classList.remove("fa-2x");
    // this.sportTarget.classList.remove("fa-2x");
  }
}
