// import $ from "jquery";
import "select2";

const initSelect2 = () => {
  // $(".select2").select2();

  // Select Bedrooms
  $("#bedrooms").select2({
    placeholder: "Bedrooms",
    allowClear: true,
  });

  // Select Bathrooms
  $("#bathrooms").select2({
    placeholder: "Bathrooms",
    allowClear: true,
  });

  // Select Property Types
  $("#ptypes").select2({
    placeholder: "Mostrar tot",
    allowClear: true,
  });

  // Select Property Types
  $("#status").select2({
    placeholder: "Mostrar tot",
    allowClear: true,
  });

  // specialisms
  $("#shorty").select2({
    placeholder: "Mostrar tot",
    allowClear: true,
  });

  // Select Min price
  $("#minprice").select2({
    placeholder: "Mín",
    allowClear: true,
  });

  // Select built
  $("#built").select2({
    placeholder: "Year Built",
    allowClear: true,
  });

  // Select Max Price
  $("#maxprice").select2({
    placeholder: "Màx",
    allowClear: true,
  });

  // Select Country
  $("#country").select2({
    placeholder: "Country",
    allowClear: true,
  });

  // Select Town
  $("#town").select2({
    placeholder: "Ubicació",
    allowClear: true,
  });

  // Select Town
  $("#location").select2({
    placeholder: "Mostrar tot",
    allowClear: true,
  });

  // Select Cities
  $("#cities").select2({
    placeholder: "All Cities",
    allowClear: true,
  });

  // Select Status
  $("#status").select2({
    placeholder: "Select Status",
    allowClear: true,
  });

  // Select Rooms
  $("#rooms").select2({
    placeholder: "Choose Rooms",
    allowClear: true,
  });

  // Select Garage
  $("#garage").select2({
    placeholder: "Choose Rooms",
    allowClear: true,
  });

  // Select Rooms
  $("#bage").select2({
    placeholder: "Select An Option",
    allowClear: true,
  });
};

export { initSelect2 };
