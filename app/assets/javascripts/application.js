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
//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require bootstrap-sprockets
//= require activestorage
//= require underscore
//= require gmaps/google
//= require turbolinks
//= require_tree .

function postChatMessage() {
  event.preventDefault();
  var element = document.querySelector('input[type="text"]');
  App.room.speak(element.value);
  element.value = '';
}

//キャンプ場詳細画面
$(document).on('turbolinks:load', function() {
  $('.camp-site-subtitle-info').on('click', function(){
    $(this).css({'border-bottom': 'solid 7px #006400'});
    $('.camp-site-show-info').css({'display': 'block'});
    $('.camp-site-chat-index').css({'display': 'none'});
    $('.camp-site-board-index').css({'display': 'none'});
    $('#camp-show-map').css({'display': 'none'});
    $('.camp-site-subtitle-chat').css({'border-bottom': 'solid 0px'});
    $('.camp-site-subtitle-board').css({'border-bottom': 'solid 0px'});
    $('.camp-site-subtitle-map').css({'border-bottom': 'solid 0px'});
  });
  $('.camp-site-subtitle-board').on('click', function(){
    $(this).css({'border-bottom': 'solid 7px #006400'});
    $('.camp-site-chat-index').css({'display': 'none'});
    $('.camp-site-board-index').css({'display': 'block'});
    $('.camp-site-show-info').css({'display': 'none'});
    $('#camp-show-map').css({'display': 'none'});
    $('.camp-site-subtitle-chat').css({'border-bottom': 'solid 0px'});
    $('.camp-site-subtitle-info').css({'border-bottom': 'solid 0px'});
    $('.camp-site-subtitle-map').css({'border-bottom': 'solid 0px'});
  });
  $('.camp-site-subtitle-chat').on('click', function(){
    $(this).css({'border-bottom': 'solid 7px #006400'});
    $('.camp-site-board-index').css({'display': 'none'});
    $('.camp-site-show-info').css({'display': 'none'});
    $('#camp-show-map').css({'display': 'none'});
    $('.camp-site-chat-index').css({'display': 'block'});
    $('.camp-site-subtitle-board').css({'border-bottom': 'solid 0px'});
    $('.camp-site-subtitle-info').css({'border-bottom': 'solid 0px'});
    $('.camp-site-subtitle-map').css({'border-bottom': 'solid 0px'});
  });
  $('.camp-site-subtitle-map').on('click', function(){
    $(this).css({'border-bottom': 'solid 7px #006400'});
    $('#camp-show-map').css({'display': 'block'});
    $('.camp-site-show-info').css({'display': 'none'});
    $('.camp-site-chat-index').css({'display': 'none'});
    $('.camp-site-board-index').css({'display': 'none'});
    $('.camp-site-subtitle-chat').css({'border-bottom': 'solid 0px'});
    $('.camp-site-subtitle-board').css({'border-bottom': 'solid 0px'});
    $('.camp-site-subtitle-info').css({'border-bottom': 'solid 0px'});
  });
  $('.camp-site-subtitle-board').mouseover(function(){
    $(this).css({'background-color': '#808000'});
  });
  $('.camp-site-subtitle-chat').mouseover(function(){
    $(this).css({'background-color': '#808000'});
  });
  $('.camp-site-subtitle-info').mouseover(function(){
    $(this).css({'background-color': '#808000'});
  });
  $('.camp-site-subtitle-map').mouseover(function(){
    $(this).css({'background-color': '#808000'});
  });
  $('.camp-site-subtitle-board').mouseout(function(){
    $(this).css({'background-color': '#bdb76b'});
  });
  $('.camp-site-subtitle-chat').mouseout(function(){
    $(this).css({'background-color': '#bdb76b'});
  });
  $('.camp-site-subtitle-info').mouseout(function(){
    $(this).css({'background-color': '#bdb76b'});
  });
  $('.camp-site-subtitle-map').mouseout(function(){
    $(this).css({'background-color': '#bdb76b'});
  });
});

//ユーザー詳細ページ
$(document).on('turbolinks:load', function() {
  //お気に入りキャンプ場タブ
  $('.user-show-subtitle-like-camp').on('click', function(){
    $(this).css({'border-bottom': 'solid 7px #006400'});
    $('.user-show-like-camp').css({'display': 'block'});
    $('.user-show-like-board').css({'display': 'none'});
    $('.user-show-post-board').css({'display': 'none'});
    $('.user-show-follow').css({'display': 'none'});
    $('.user-show-follower').css({'display': 'none'});
    $('.user-show-subtitle-like-board').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-post-board').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-follow').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-follower').css({'border-bottom': 'solid 0px'});
  });
  $('.user-show-subtitle-like-camp').mouseover(function(){
    $(this).css({'background-color': '#808000'});
  });
  $('.user-show-subtitle-like-camp').mouseout(function(){
    $(this).css({'background-color': '#bdb76b'});
  });
  // 気になる掲示板タブ
  $('.user-show-subtitle-like-board').on('click', function(){
    $(this).css({'border-bottom': 'solid 7px #006400'});
    $('.user-show-like-camp').css({'display': 'none'});
    $('.user-show-like-board').css({'display': 'block'});
    $('.user-show-post-board').css({'display': 'none'});
    $('.user-show-follow').css({'display': 'none'});
    $('.user-show-follower').css({'display': 'none'});
    $('.user-show-subtitle-like-camp').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-post-board').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-follow').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-follower').css({'border-bottom': 'solid 0px'});
  });
  $('.user-show-subtitle-like-board').mouseover(function(){
    $(this).css({'background-color': '#808000'});
  });
  $('.user-show-subtitle-like-board').mouseout(function(){
    $(this).css({'background-color': '#bdb76b'});
  });
  // 掲示板投稿履歴
  $('.user-show-subtitle-post-board').on('click', function(){
    $(this).css({'border-bottom': 'solid 7px #006400'});
    $('.user-show-like-camp').css({'display': 'none'});
    $('.user-show-like-board').css({'display': 'none'});
    $('.user-show-post-board').css({'display': 'block'});
    $('.user-show-follow').css({'display': 'none'});
    $('.user-show-follower').css({'display': 'none'});
    $('.user-show-subtitle-like-camp').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-like-board').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-follow').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-follower').css({'border-bottom': 'solid 0px'});
  });
  $('.user-show-subtitle-post-board').mouseover(function(){
    $(this).css({'background-color': '#808000'});
  });
  $('.user-show-subtitle-post-board').mouseout(function(){
    $(this).css({'background-color': '#bdb76b'});
  });
  // フォローユーザー
  $('.user-show-subtitle-follow').on('click', function(){
    $(this).css({'border-bottom': 'solid 7px #006400'});
    $('.user-show-like-camp').css({'display': 'none'});
    $('.user-show-like-board').css({'display': 'none'});
    $('.user-show-post-board').css({'display': 'none'});
    $('.user-show-follow').css({'display': 'block'});
    $('.user-show-follower').css({'display': 'none'});
    $('.user-show-subtitle-like-camp').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-like-board').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-post-board').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-follower').css({'border-bottom': 'solid 0px'});
  });
  $('.user-show-subtitle-follow').mouseover(function(){
    $(this).css({'background-color': '#808000'});
  });
  $('.user-show-subtitle-follow').mouseout(function(){
    $(this).css({'background-color': '#bdb76b'});
  });
  // フォロワー
  $('.user-show-subtitle-follower').on('click', function(){
    $(this).css({'border-bottom': 'solid 7px #006400'});
    $('.user-show-like-camp').css({'display': 'none'});
    $('.user-show-like-board').css({'display': 'none'});
    $('.user-show-post-board').css({'display': 'none'});
    $('.user-show-follow').css({'display': 'none'});
    $('.user-show-follower').css({'display': 'block'});
    $('.user-show-subtitle-like-camp').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-like-board').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-post-board').css({'border-bottom': 'solid 0px'});
    $('.user-show-subtitle-follow').css({'border-bottom': 'solid 0px'});
  });
  $('.user-show-subtitle-follower').mouseover(function(){
    $(this).css({'background-color': '#808000'});
  });
  $('.user-show-subtitle-follower').mouseout(function(){
    $(this).css({'background-color': '#bdb76b'});
  });
});
