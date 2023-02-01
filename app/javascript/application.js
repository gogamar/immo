// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "./add_jquery";
import "bootstrap";

// import "./packs/jquery.magnific-popup";
import { initSelect2 } from "./components/init_select2";
// // import { initIonRangeSlider } from "./components/init_ionRangeSlider.js";
import { initSlick } from "./components/init_slick";
import { initMagnificPopUp } from "./components/init_magnificPopUp";

document.addEventListener("turbo:load", function () {
  initSelect2();
  // initIonRangeSlider();
  initSlick();
  initMagnificPopUp();
});

import "./packs/custom";
// import "./packs/slider-bg";
