(function(){$(function(){var t;return t=function(){return $(".activeadmin-translations > ul").each(function(){var t,i,r;return i=$(this),i.data("ready")?void 0:(i.data("ready",!0),r=$("li > a",this),t=$(this).siblings("fieldset"),r.click(function(){var i;return i=$(this),r.not(i).removeClass("active"),i.addClass("active"),t.hide(),t.filter(i.attr("href")).show(),!1}),r.eq(0).click(),r.each(function(){var i,r,n;return r=$(this),i=t.filter(r.attr("href")),n=i.find(".input.error").length>0,r.toggleClass("error",n)}))})},$("a").bind("click",function(){return setTimeout(function(){return t()},50)}),t()})}).call(this);