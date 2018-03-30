/*global $*/

var submitComment;

submitComment = function() {
   $(".btn btn-primary btn-lg pull-right").onclick("#comment-body").val(" ");
};


$(document).ready(function(){
    submitComment(); 
})