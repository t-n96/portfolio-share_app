// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require('jquery')

$(document).on('turbolinks:load', function() {

$(function(){
  $('.notice').fadeOut(1500);
});

$(function(){

  $(".hamburger-menu").on("click", function(){
    $('.menu-list').toggleClass('active');
  });

});

$(function(){

  $(".menu_close").on("click", function(){
    $('.menu-list').removeClass('active');
  });

});

});
