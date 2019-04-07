$(document).ready(function () {

    $('[id=classRoomForm]').hide();
    $('[id=onlineForm]').hide();
   
    $('[id=classRoom]').click(function() {
        $('[id=classRoomForm]').show();
        $('[id=onlineForm]').hide().prop('required', false);
    })
    
    $('[id=online]').click(function() {
        $('[id=onlineForm]').show();
        $('[id=classRoomForm]').hide().prop('required', false);
    })
    
});