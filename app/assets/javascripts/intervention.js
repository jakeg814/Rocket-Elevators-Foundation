//	INTERVENTION FORM 
var _hash = window.location.hash;

// Classes
$(".building-class, .battery-class, .column-class, .elevator-class").hide();

// Customer drop down menu
$(document).ready(function() {
  var choice = document.getElementById("customer");
  choice.addEventListener("change", customer);
  choice.addEventListener("change", clear);
});

var customer = function() {
  var choice = document.getElementById("customer").value;
  if (choice != 0) {
    $(".building-class").show();
  }
};

// Building drop down menu
$(document).ready(function() {
  var choice = document.getElementById("building");
  choice.addEventListener("change", building);
  choice.addEventListener("change", clear);
});

var building = function() {
  var choice = document.getElementById("building").value;
  if (choice != 0) {
    $(".battery-class").show();
  }
};

// Battery drop down menu
$(document).ready(function() {
  var choice = document.getElementById("battery");
  choice.addEventListener("change", battery);
  choice.addEventListener("change", clear);
});

var battery = function() {
  var choice = document.getElementById("battery").value;
  if (choice != 0) {
    $(".column-class").show();
  }
};

// Column drop down menu
$(document).ready(function() {
  var choice = document.getElementById("column");
  choice.addEventListener("change", column);
  choice.addEventListener("change", clear);
});

var column = function() {
  var choice = document.getElementById("column").value;
  if (choice != 0) {
    $(".elevator-class").show();
  }
};
