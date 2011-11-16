# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("FORM").nestedFields beforeInsert: (item) ->
    item.find(".item_details").hide()
    item.find(".delivered_date_value").hide()
    item.find(".rent_price_value").hide()
    item.find("INPUT[type=text]").bind "railsAutocomplete.select", (event, data) ->
      $.ajax
        url: "update_data"
        data: "item_id=" + item.attr("data-record-id") + "&movie_id=" + data.item.value
        type: "POST"
        dataType: "script"
        beforeSend: (dato) ->
          #$(".container").empty().html "<img src=\"../assets/rails.png\" />"
	  	
	      
	    
		$(document).ready ->
		  $ ->
		    $("FORM").nestedFields()