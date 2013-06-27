// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

//************
//Workaround for the FB ... Change in Session Redirect Behavior
//Ref: https://groups.google.com/forum/#!msg/rubyonrails-talk/NTHkLAyq_7I/5zRNJZvd3mEJ
if (window.location.href.indexOf('#_=_') > 0) { 
	window.location = window.location.href.replace(/#.*/, '');
}
//End of workaround
//************
$(document).ready(function(){
 $('.votes').click(function () {
     $(".votes").val('Down');
     });
 

 $('.comment-post').click(function (){
 	//alert('hello');
 	//window.location.href = 'https://www.facebook.com/dialog/feed? app_id=670347169648397&link=https://localhost:3000/&picture=http://fbrell.com/f8.jpg&name=Facebook%20Dialogs&caption=Reference%20Documentation&description=Post Question&redirect_uri=https://mighty-lowlands-6381.herokuapp.com/' 	
 	//return false;
 // 	//alert('hello');
 // 	FB.init({appId: "670347169648397", status: true, cookie: true});

 //      function postToFeed() {

 //        // calling the API ...
 //        var obj = {
 //          method: 'feed',
 //          redirect_uri: 'localhost:3000',
 //          link: 'https://developers.facebook.com/docs/reference/dialogs/',
 //          picture: 'http://fbrell.com/f8.jpg',
 //          name: 'Facebook Dialogs',
 //          caption: 'Reference Documentation',
 //          description: 'Using Dialogs to interact with people.'
 //        };

 //        function callback(response) {
 //          document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
 //        }

 //        FB.ui(obj, callback);
 //      }

 })
})

  
