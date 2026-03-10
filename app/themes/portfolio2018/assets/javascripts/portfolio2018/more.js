jQuery(window).load(function(){
var moreOrLessLink = document.getElementById("more_less_link");
var isExpanded = false;

moreOrLessLink.addEventListener("click", function(){
    isExpanded = !isExpanded;
    if(isExpanded){
        moreOrLessLink.innerHTML = "Less...";
    } else {
        moreOrLessLink.innerHTML = "More...";
    }
  })  
});