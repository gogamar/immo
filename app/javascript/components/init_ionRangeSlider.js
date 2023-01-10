// import $ from "jquery"; // we don't import jquery here because it's imported globally in add_jquery.js
import "ion-rangeslider";

const initIonRangeSlider = () => {
  $(".js-range-slider").ionRangeSlider({
    type: "double",
    min: 0,
    max: 1000,
    from: 200,
    to: 500,
    grid: true,
  });
};

export { initIonRangeSlider };
