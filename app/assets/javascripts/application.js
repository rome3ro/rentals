// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.nested-fields
//= require autocomplete-rails
//= require nested_fields
//= require jquery.maskMoney
//= provide_tree ../../../vendor/assets/javascripts/plupload-rails3
//= provide_tree ../../../vendor/assets/stylesheets/plupload-rails3
//= provide_tree ../../../vendor/assets/images/plupload-rails3
//= require_tree .
// 
// 

//Esta función es para el colorear los rows de las tablas en los index
$(function() {
        /* For zebra striping */
        $(".tabla tr:nth-child(odd)").addClass("odd-row");
        /* For cell text alignment */
        $(".tabla td:first-child, .tabla th:first-child").addClass("first");
        /* For removing the last border */
        $(".tabla td:last-child, .tabla th:last-child").addClass("last");
});