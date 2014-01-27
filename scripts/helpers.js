      /**
       * Place the helper methods here even though they are not invoked until
       * the end of the page.
       *
       * This first one assumes the first fieldset is a keyword search. The rest
       * are hidden from view and taken out of flow.
       */
     function collapseAdvancedSearch() {
       $('fieldset').hide();
       $('fieldset[class*="simple"]').show();
       
       $('nav.controls a').removeClass('active');
       $('nav.controls a.simple').addClass('active');
     };

     function expandAdvancedSearch() {
       $('fieldset').show();

       $('nav.controls a').removeClass('active');
       $('nav.controls a.advanced').addClass('active');
     };


/**
 * These two helper methods control the visibility of the tooltips that appear
 * when you hover over an entry for additional information
 *
 * NOTE - this feature is shelved for the time being but might see future
 *        revision once the final design is in place after other ideas are
 *        explored.
 */
function showDVDTooltip(trigger) {
  resource_location = "resources/dvd.txt";
  
  $.ajax({
    url: resource_location,
    success : function(data) {
      aside = $('aside#tooltip');
      trigger = $(trigger);
      
      if (0 == aside.length) {
        $('body').append('<aside id="tooltip"></aside>');
        aside = $('aside#tooltip');
      }
      
      target_element = $('aside#tooltip');
      
      if (!target_element.visible) {
        target_element.fadeIn(500);
      }
      
      /** 
       * Fixing the position to the right is easy. It is just the vertical
       * that needs to be fine tuned
       */
      aside_padding = 60;
      aside_left = trigger.offset().left + trigger.outerWidth() + aside_padding;
      aside_top = trigger.offset().top - (aside.height()/2);
      if (aside_top < 0) { aside_top = aside_padding; };
      if ((aside_top + aside.height()) > $(document).height()) {
        aside_top = $(document).height() - aside.height() - aside_padding;
      };
      
      target_element.offset({
        left: aside_left, 
        top: aside_top
      }); 
      target_element.empty().append(data);
        
      console.log('Retrieving relevant information for ' + $(trigger).text());
      console.log('Trigger at (' + trigger.offset().left + ', ' + trigger.offset().top + ')');
      console.log('Relocating aside to (' + aside.offset().left + ', ' + aside.offset().top + ')');
    },
    failure: function() {
      console.log('Could not create tooltip for ' + trigger);
    }
  });
}

function hideDVDTooltip(trigger) {
  $("aside.tooltip").fadeOut(500);
}