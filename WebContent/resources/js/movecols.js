$(document).ready(function(){
    $('#hidebutton').click(
      function(){
        if($('#inprogress').is(':visible')){
          $('#inprogress').hide();
          $('processing-col').removeClass("col-md-4");
          $('processing-col').addClass("col-5");
          $('#itog').removeClass("fa-toggle-on");
          $('#itog').addClass("fa-toggle-off");
        } else {
          $('#inprogress').show();
          $('processing-col').removeClass("col-5");
          $('processing-col').addClass("col-md-4");
          $('#itog').removeClass("fa-toggle-off");
          $('#itog').addClass("fa-toggle-on");

        }
      }
    );
    
    $('#bpbutton').click(function(){
      if ($('#check1').is(':checked')) {
        $('#check1').hide();
        $('#overlay1').hide();
        $("#p1").prependTo("#hp");
      }
      if ($('#check2').is(':checked')) {
        $('#check2').hide();
        $('#overlay2').hide();
        $("#p2").prependTo("#hp");
      }
    })

    $('#sb').change( function () {
        $('.card').show();
        var filter = $(this).val(); // get the value of the input, which we filter on
        $('.container').find(".card-title:not(:contains(" + filter + "))").parent().css('display','none');
   
    });

});