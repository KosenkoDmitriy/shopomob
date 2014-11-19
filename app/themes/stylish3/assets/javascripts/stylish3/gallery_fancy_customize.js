$(".fancybox")
    .attr('rel', 'gallery')
    .fancybox({
        beforeShow: function () {
            var caption = $(this.element).data("caption") ? $(this.element).data("caption") : "";
            this.title = this.title ? this.title + caption : '<script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script><div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="button" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir,lj,friendfeed,moikrug,gplus,surfingbird"></div>' + caption;
        },
        afterShow: function () {
//            stButtons.locateElements();
        }
    });