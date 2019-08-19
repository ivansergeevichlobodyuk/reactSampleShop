$(function () {


   var mymap = L.map('map').setView([50.910321, 34.805873], 13);

   L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
      maxZoom: 18,
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
          '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
          'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      id: 'mapbox.streets'
   }).addTo(mymap);

   L.marker([50.903481, 34.809148]).bindPopup('Суми, вул.Харківська, 4').addTo(mymap);
   L.marker([50.903121, 34.791945]).bindPopup('Суми, вул.Петропавлівська, 72').addTo(mymap);
   L.marker([50.915719, 34.830243]).bindPopup('Суми, вул.М.Лушпи, 45/1').addTo(mymap);
   L.marker([50.910220, 34.792577]).bindPopup('Суми, вул.Іллінська, 7а').addTo(mymap);


});
