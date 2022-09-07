import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-paid"
export default class extends Controller {
  static targets = ['input', 'output']

  connect() {
    this.toggle();
  }

  toggle() {
    if(this.inputTarget.firstElementChild.value == 'true') {
      this.outputTarget.hidden = false;
    } else {
      this.outputTarget.hidden = true;
    }
  }
}
