//	INTERVENTION FORM 
var _hash = window.location.hash;

// Classes
$(".building-class, .battery-class, .column-class, .elevator-class").hide();

// Show and hide buildings for customer X
$("#customer").change(function() {
    var select = document.getElementById('customer');
    value = select.options[select.selectedIndex].value;
    console.log(value);
    $.ajax({
        type:'GET',
        url:"/get_building/" + value,
        success:function(data){
          console.log(data);
          // Clear all options from course select
          $("select#building option").remove();
          //put in a empty default line
          var row = "<option value=\"" + "" + "\">" + "option" + "</option>";
          $(row).appendTo("select#building");
          // Fill course select
          $.each(data, function(i, j) {
            row = "<option value=\"" + j.id + "\">" + j.admin_name + "</option>";
            $(row).appendTo("select#building");
           });
        }
      });
  });


// Show and hide batteries for building X
$("#building").change(function() {
    var select = document.getElementById('building');
    value = select.options[select.selectedIndex].value;
    console.log(value);
    $.ajax({
        type:'GET',
        url:"/get_battery/" + value,
        success:function(data){
          console.log(data);
          // Clear all options from course select
          $("select#battery option").remove();
          //put in a empty default line
          var row = "<option value=\"" + "" + "\">" + "option" + "</option>";
          $(row).appendTo("select#battery");
          // Fill course select
          $.each(data, function(i, j) {
            row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
            $(row).appendTo("select#battery");
           });
        }
      });
  });

// Show and hide columns for battery X
$("#battery").change(function() {
    var select = document.getElementById('battery');
    value = select.options[select.selectedIndex].value;
    console.log(value);
    $.ajax({
        type:'GET',
        url:"/get_column/" + value,
        success:function(data){
          console.log(data);
          // Clear all options from course select
          $("select#column option").remove();
          //put in a empty default line
          var row = "<option value=\"" + "" + "\">" + "none" + "</option>";
          $(row).appendTo("select#column");
          // Fill course select
          $.each(data, function(i, j) {
            row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
            $(row).appendTo("select#column");
           });
        }
      });
  });

// Show and hide elevators for column X
$("#column").change(function() {
    var select = document.getElementById('column');
    value = select.options[select.selectedIndex].value;
    console.log(value);
    $.ajax({
        type:'GET',
        url:"/get_elevator/" + value,
        success:function(data){
          console.log(data);
          // Clear all options from course select
          $("select#elevator option").remove();
          //put in a empty default line
          var row = "<option value=\"" + "" + "\">" + "none" + "</option>";
          $(row).appendTo("select#elevator");
          // Fill course select
          $.each(data, function(i, j) {
            row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
            $(row).appendTo("select#elevator");
           });
        }
      });
  });


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
