import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="choose-operation"
export default class extends Controller {
  static targets = ["salesprice", "rentprice", "operation"]
  connect() {
    console.log("Operation controller.");
  }

  show() {
    const operation = this.operationTarget.value;
    if (operation == "1" || operation == undefined) {
      this.salespriceTarget.classList.remove("d-none");
      this.rentpriceTarget.classList.add("d-none");
    } else if (operation == "2") {
      this.salespriceTarget.classList.add("d-none");
      this.rentpriceTarget.classList.remove("d-none");
    } else if (operation == "3") {
      this.salespriceTarget.classList.remove("d-none");
      this.rentpriceTarget.classList.remove("d-none");
    }
  }

}
