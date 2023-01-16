import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    console.log ("new speed now");
    new Typed(this.element, {
      strings: ["que busques", "que t'espera"],
      loop: true,
      typeSpeed: 100,
      backSpeed: 80,
      startDelay: 100,
      backDelay: 1500,
    })
  }
}
