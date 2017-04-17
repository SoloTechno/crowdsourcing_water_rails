function initAutocomplete() {
  $latlng = $('#latlng');
  pac_input = document.getElementById('location-input');          

  var selectFirstPac = (function(input) {
    var _addEventListener = input.addEventListener ? input.addEventListener : input.attachEvent;

    var addEventListenerWrapper = function(type, listener) {
      if (type == "keydown") {
        var origListener = listener;
        listener = function(event) {
          var suggestion_selected = $(".pac-item-selected").length > 0;
          if (event.which == 13 && !suggestion_selected) {
            var simulated_downarrow = $.Event("keydown", {
              keyCode: 40,
              which: 40
            });
            origListener.apply(input, [simulated_downarrow]);
          }

          origListener.apply(input, [event]);
        };
      }
      _addEventListener.apply(input, [type, listener]);
    }

    input.addEventListener = addEventListenerWrapper;
    input.attachEvent = addEventListenerWrapper;

    var autocomplete = new google.maps.places.Autocomplete(input);

    autocomplete.addListener('place_changed', function() {
      place = autocomplete.getPlace();

      if (place.geometry != undefined) {
        lat = place.geometry.location.lat();
        lng = place.geometry.location.lng();
        if ($latlng != null) {
          $latlng.children('.lat').val(lat);
          $latlng.children('.lng').val(lng);
        }

        $latlng.find('.lat').val(lat);
        $latlng.find('.lng').val(lng);
      }
    })

  })(pac_input);
}