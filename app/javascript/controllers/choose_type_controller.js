import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="choose-operation"
export default class extends Controller {
  static targets = ["proptype", "flat"]
  connect() {
    console.log("Type controller.");
  }

  show() {
    console.log(this.proptypeTarget.value)
    const propertyType = this.proptypeTarget.value;
    if (propertyType != "1") {
      this.flatTarget.classList.add("d-none");
    } else if (propertyType == "1") {
      this.flatTarget.classList.remove("d-none");
    }
  }

}
