# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

 $ ->
  $("#rent_price_price").maskMoney(symbol:'$ ', showSymbol:true)
  $("#rent_price_surcharge").maskMoney(symbol:'$ ', showSymbol:true)
  $("#rent_price_days").maskMoney(precision: 0)
  $("#rent_price_movies_quantity").maskMoney(precision: 0)