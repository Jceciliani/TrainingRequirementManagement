$(document).ready(function () {

    $("#nv-btn").on("click", function () {
        $(".vendor-list-pg").hide();
        $(".vendor-add-pg").show();
    });

    $("#return-btn").on("click", function () {
        $(".vendor-add-pg").hide();
        $(".vendor-list-pg").show();
    });

    $("#vm-open").on("click", function () {
        $(".vendor-list-pg").show();
        $(".vendor-add-pg").hide();
    });




    // /* Resets modal to the list tab upon close. Delete this if you don't want that to happen. */
    // $("#close-vtm-btn").on("click", function() {
    //     $(".pg1").show();
    //     $(".pg2").hide();
    //     $(".pg3").hide();
    //     $(".pg4").hide();
    // });

    // // /* Causes the collapsibles in the list tab to collapse when clicking away from them. QOL */
    // // $(document).click(function (e) {
    // //     if (!$(e.target).is('.list-group-item')) {
    // //         $('.collapse').collapse('hide');
    // //     }
    // // });


    // /* 
    // Makes the delete buttons work.
    // This will only work for the hard-coded vendors.
    // Will not work for vendors added dynamically.
    // Don't know why yet.
    // */
    // $(":button:contains('Delete')").on("click", function () {
    //     $(this).closest(".row").remove();
    // });


    // /*
    // This dumb function enables adding vendors to the vendor list. 
    // Once we move to database interface some of this will be changed,
    // but I think some of it can be re-used.
    //  */
    // $(":button:contains('Submit')").on("click", function () {
    //     var name = $('#nameForm').val();    // TODO: Require this field. Makes list look funny when empty
    //     var phone = $('#phoneForm').val();
    //     var email = $('#emailForm').val();
    //     var city = $('#cityForm').val();
    //     var state = $('#stateForm').val();
    //     var country = $('#countryForm').val();
    //     var zip = $('#zipForm').val();
    //     var timezone = $('#timezone').val();
    //     var rowCount = $('#vtlist .row').length;

    //     var wtf = "<div class=\"row\"><div class=\"col\"\>\
    //     <button type=\"button\" id=\"v-btn\"\
    //             class=\"btn btn-warning btn-block\">Select</button></div\>\
    //     <div class=\"col\"\>\
    //         <div class=\"panel-group\"\>\
    //             <div class=\"panel panel-default\"\>\
    //                 <div class=\"panel-heading\"\>\
    //                     <h4 class=\"panel-title\"\>\
    //                         <button type=\"button\" id=\"v-btn\"\
    //                             class=\"btn btn-primary btn-block\" data-toggle=\"collapse\"\
    //                             href=\"#collapse" + (rowCount + 1) + "\"\>" + name + "</button\>\
    //                     </h4\>\
    //                 </div\>\
    //                 <div id=\"collapse" + (rowCount + 1) + "\" class=\"panel-collapse vm-panel-collapse collapse\"\>\
    //                     <ul class=\"list-group vm-list-group\"\>\
    //                         <li class=\"list-group-item vm-list-group-item\">Name: " + name + "</li\>\
    //                         <li class=\"list-group-item vm-list-group-item\">Phone: " + phone + "</li\>\
    //                         <li class=\"list-group-item vm-list-group-item\">Email: " + email + "</li\>\
    //                         <li class=\"list-group-item vm-list-group-item\">City: " + city + "</li\>\
    //                         <li class=\"list-group-item vm-list-group-item\">State: " + state + "</li\>\
    //                         <li class=\"list-group-item vm-list-group-item\">Country: " + country + "</li\>\
    //                         <li class=\"list-group-item vm-list-group-item\">Zipcode: " + zip + "</li\>\
    //                         <li class=\"list-group-item vm-list-group-item\">Time zone: " + timezone + "</li\>\
    //                     </ul\>\
    //                 </div\>\
    //             </div\>\
    //         </div\>\
    //     </div\>\
    //     <div class=\"col\"><button type=\"button\"\
    //             class=\"btn btn-danger btn-block\">Delete</button></div\>\
    // </div\>";

    //     //console.log(wtf);

    //     $('#vtlist').append(wtf);

    //     $('#va-form').get(0).reset()
    //     alert("New Vendor added to Vendor List.");
    // });
});