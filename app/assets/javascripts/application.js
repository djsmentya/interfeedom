// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//= require profile/products
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require ckeditor/init

$(function() {
    $("#product_avalible_on").datepicker();
});


$(document).ready(function() {
    $("#languages").change(function() {
        var lan = $("#languages option:selected").attr('value');
        $.get('/home/change_locale','language=' +lan);
    })
});


jQuery(document).ready(function() {
  jQuery("#flash").slideDown(2000);
  setTimeout(
    function(){
      $('#flash_button').show();
      $("#flash").slideUp(1000);
    },5000);
});

$('#flash').mouseout(function (){
  setTimeout(
    function(){
      $('#flash_button').show();
      $("#flash").slideUp(1000);
    },5000);
});

$('#flash_button').mouseover(function (){
  $('#flash_button').hide();
  jQuery("#flash").slideDown(2000);
});

