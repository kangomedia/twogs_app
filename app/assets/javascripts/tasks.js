jQuery.fn.submitOnCheck = function () {
  this.find('input[type=submit]').remove();
  this.find('input[type=checkbox]').click(function () {
    $(this).parent('form').submit();
  });  
  return this;
};

var Tasks = function () {


    return {

        //main function to initiate the module
        initDashboardWidget: function () {
			$('input.liChild').change(function() {
				if ($(this).is(':checked')) { 
					$(this).parents('li').addClass("task-done"); 
				} else { 
					$(this).parents('li').removeClass("task-done"); 
				}
			}); 
        }

    };

}();