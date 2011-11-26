# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("FORM").nestedFields beforeInsert: (item) ->
    item.find(".item_details").hide()
    item.find(".deliver_date_value").hide()
    item.find(".rent_price_value").hide()
    item.find("INPUT[data-autocomplete*=autocomplete_movie_name]").bind "railsAutocomplete.select", (event, data) ->
      $.ajax
        url: "http://localhost:3000/rents/update_data"
        data: "item_id=" + item.attr("data-record-id") + "&movie_id=" + data.item.value + "&cont=" + $("INPUT[data-autocomplete*=autocomplete_movie_code]").length
        type: "POST"
        dataType: "script"
        beforeSend: (dato) ->
          #$(".container").empty().html "<img src=\"../assets/rails.png\" />"	  		      
	    
		$("#rent_customer_code_name").bind "railsAutocomplete.select", (event, data) ->
	      $.ajax
	        url: "http://localhost:3000/rents/validate_customer"
	        data: "customer_id=" + data.item.value
	        type: "POST"
	        dataType: "script"
	        beforeSend: (dato) ->
	          #$(".container").empty().html "<img src=\"../assets/rails.png\" />"		
	
			$(document).ready ->
			  $("FORM").nestedFields()
			  arr = $(".item")
			  arr.each (index, item) ->
			    $(item).remove()  if $(item).find("INPUT[id*=movie_id]").val() is ""
			    
			  
			
			