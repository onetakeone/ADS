// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require jquery_ujs
//= require bootstrap-sprockets
//= require popper.js 
//= require cocoon
//= require_tree .

$(function() {
  $("#ajax th a, #ajax .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
	$("#ads_search").keyup(function() {		
	  $.get($("#ads_search").attr("action"), $("#ads_search").serialize(), null, "script");
	  return false;
	});
	// $("#search_button").click(function(){
	// 	$("#search_button").prop('value',"Search "+count.value);
	// });
});

