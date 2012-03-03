# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
sumar = ->
    arr = $("fieldset:visible").find($(".rent_price_value"))
 	  total = 0
	   arr.each (index, item) ->
	    precio = parseFloat($(item).find("select[id*=rent_price_id]").text())
	    precio = 0 if isNaN(precio)
	    total += precio	    
	    #alert precio
    $("#rent_total").val(total)

	validar_remove = (item) ->
	  $.ajax
	    url: "remove_movie"
	    data: "customer_id=" + data.item.value
	    type: "POST"
	    dataType: "script"
    #alert item

$ ->
  $("FORM").nestedFields beforeInsert: (item, insert) ->
    insert() if $("#rent_customer_code_name").val() != ""
    item.find(".item_details").hide()
    item.find(".deliver_date_value").hide()
    item.find(".rent_price_value").hide()
    item.find("INPUT[data-autocomplete*=autocomplete_movie_name]").bind "railsAutocomplete.select", (event, data) ->
      $.ajax
        url: "update_data"
        data: "item_id=" + item.attr("data-record-id") + "&movie_id=" + data.item.value + "&cont=" + $("INPUT[data-autocomplete*=autocomplete_movie_code]").length
        type: "POST"
        dataType: "script"
        success: (dato) ->
          sumar()
		beforeRemove: (item, remove) ->
		    $.ajax url:"rents/remove_movie", data: "movie_id="+item.find($("#rent_rent_details_attributes_"+item.attr("data-record-id")+"_movie_id")).val(), type:"POST", success: (dato) ->
		    remove()

		$("#rent_customer_code_name").bind "railsAutocomplete.select", (event, data) ->
	      $.ajax
	        url: "validate_customer"
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