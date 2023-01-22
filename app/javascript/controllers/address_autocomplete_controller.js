import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String };

  static targets = ["address", "street", "streetnumber"];

  connect() {
    console.log("Autocomplete...");
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "address"
      // country,region,place,postcode,locality,neighborhood,address,
    });
    this.geocoder.addTo(this.element);

    this.geocoder.on("click", (event) => {
      this.#setInputValue(event);
      console.log(event);
    });

    this.geocoder.on("clear", () => this.#clearInputValue());
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["text"];
    this.streetTarget.value = event.result["text"];
    this.streetnumberTarget.value = event.result["address"];
  }

  #clearInputValue() {
    this.addressTarget.value = "";
  }

  disconnect() {
    this.geocoder.onRemove();
  }
}
