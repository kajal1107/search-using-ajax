
document.addEventListener("turbolinks: load", function() {
  var options = {
    data: ["John", "Paul", "George", "Ringo"]
  };
  $('*[data-behavior="autocomplete"]').easyAutocomplete(options);
});