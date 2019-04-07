/**
 * 
 */
$(document).ready(function(){
					$("#message").text("View Processed Requests");
					$('.card-green').css('display','none');
					//to make filter work
					$('#search').keyup(function() {
						$('.card').removeClass('d-none');
						var filter = $(this).val(); //input value
						$('#cardContainer').find('.card .card-body h5:not(:contains("'+filter+'"))').parent().parent().parent().parent().addClass('d-none');
					});
			        $('#createNewRequest').hover(function() {
			            $("#createNewRequest").addClass('transition');
			        
			        }, function() {
			            $("#createNewRequest").removeClass('transition');
			        });

			});

			$(window).on('load', function() {
				if (/.participants+.....$/.test(window.location.href)){
			  		var modal = window.location.hash.substr(1);
			  		$('#' + modal).modal('show');
				}
				if (/.CreateRequestModal$/.test(window.location.href)){
			  		var modal = window.location.hash.substr(1);
			  		$('#' + modal).modal('show');
				}
				$("#sel1").change(function() {
					var select = $("#sel1").val();
					//alert(select);
					if (select === "Other") {
						$("#otherinput").removeClass("d-none");
					}
					else {
						$("#otherinput").addClass("d-none");
					}
					
				})
			});
		

			$("form").submit(function() {
   				$(":submit", this).attr("disabled", "disabled");
			});
			
			function toggle(){
				if($("#message").text()=="View Pending Requests"){
					$('#mycheck').bootstrapToggle('on');
					$("#message").text("View Processed Requests");
					$('.card-green').css('display','none');
					$('.card-yellow').css('display','');
					$('.card-red').css('display','');
					}
					else{
					$('#mycheck').bootstrapToggle('off')
					$("#message").text("View Pending Requests");
					$('.card-green').css('display','');
					$('.card-yellow').css('display','none');
					$('.card-red').css('display','none');
				}
			};
			
			function test() {
				console.log("HELLO");
				if($("#message").text()=="View Processed Requests"){
					$("#message").text("View Pending Requests");
					$('.card-green').css('display','');
					$('.card-yellow').css('display','none');
					$('.card-red').css('display','none');
				}
				else{
					$("#message").text("View Processed Requests");
					$('.card-green').css('display','none');
					$('.card-yellow').css('display','');
					$('.card-red').css('display','');
					
				}
			};
	        function autocomplete(inp, arr) {
	        	  /*the autocomplete function takes two arguments,
	        	  the text field element and an array of possible autocompleted values:*/
	        	  var currentFocus;
	        	  /*execute a function when someone writes in the text field:*/
	        	  inp.addEventListener("input", function(e) {
	        	      var a, b, i, val = this.value;
	        	      /*close any already open lists of autocompleted values*/
	        	      closeAllLists();
	        	      if (!val) { return false;}
	        	      currentFocus = -1;
	        	      /*create a DIV element that will contain the items (values):*/
	        	      a = document.createElement("DIV");
	        	      a.setAttribute("id", this.id + "autocomplete-list");
	        	      a.setAttribute("class", "autocomplete-items");
	        	      /*append the DIV element as a child of the autocomplete container:*/
	        	      this.parentNode.appendChild(a);
	        	      /*for each item in the array...*/
	        	      for (i = 0; i < arr.length; i++) {
	        	        /*check if the item starts with the same letters as the text field value:*/
	        	        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
	        	          /*create a DIV element for each matching element:*/
	        	          b = document.createElement("DIV");
	        	          /*make the matching letters bold:*/
	        	          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
	        	          b.innerHTML += arr[i].substr(val.length);
	        	          /*insert a input field that will hold the current array item's value:*/
	        	          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
	        	          /*execute a function when someone clicks on the item value (DIV element):*/
	        	          b.addEventListener("click", function(e) {
	        	              /*insert the value for the autocomplete text field:*/
	        	              inp.value = this.getElementsByTagName("input")[0].value;
	        	              /*close the list of autocompleted values,
	        	              (or any other open lists of autocompleted values:*/
	        	              closeAllLists();
	        	          });
	        	          a.appendChild(b);
	        	        }
	        	      }
	        	  });
	        	  /*execute a function presses a key on the keyboard:*/
	        	  inp.addEventListener("keydown", function(e) {
	        	      var x = document.getElementById(this.id + "autocomplete-list");
	        	      if (x) x = x.getElementsByTagName("div");
	        	      if (e.keyCode == 40) {
	        	        /*If the arrow DOWN key is pressed,
	        	        increase the currentFocus variable:*/
	        	        currentFocus++;
	        	        /*and and make the current item more visible:*/
	        	        addActive(x);
	        	      } else if (e.keyCode == 38) { //up
	        	        /*If the arrow UP key is pressed,
	        	        decrease the currentFocus variable:*/
	        	        currentFocus--;
	        	        /*and and make the current item more visible:*/
	        	        addActive(x);
	        	      } else if (e.keyCode == 13) {
	        	        /*If the ENTER key is pressed, prevent the form from being submitted,*/
	        	        e.preventDefault();
	        	        if (currentFocus > -1) {
	        	          /*and simulate a click on the "active" item:*/
	        	          if (x) x[currentFocus].click();
	        	        }
	        	      }
	        	  });
	        	  function addActive(x) {
	        	    /*a function to classify an item as "active":*/
	        	    if (!x) return false;
	        	    /*start by removing the "active" class on all items:*/
	        	    removeActive(x);
	        	    if (currentFocus >= x.length) currentFocus = 0;
	        	    if (currentFocus < 0) currentFocus = (x.length - 1);
	        	    /*add class "autocomplete-active":*/
	        	    x[currentFocus].classList.add("autocomplete-active");
	        	  }
	        	  function removeActive(x) {
	        	    /*a function to remove the "active" class from all autocomplete items:*/
	        	    for (var i = 0; i < x.length; i++) {
	        	      x[i].classList.remove("autocomplete-active");
	        	    }
	        	  }
	        	  function closeAllLists(elmnt) {
	        	    /*close all autocomplete lists in the document,
	        	    except the one passed as an argument:*/
	        	    var x = document.getElementsByClassName("autocomplete-items");
	        	    for (var i = 0; i < x.length; i++) {
	        	      if (elmnt != x[i] && elmnt != inp) {
	        	        x[i].parentNode.removeChild(x[i]);
	        	      }
	        	    }
	        	  }
	        	  /*execute a function when someone clicks in the document:*/
	        	  document.addEventListener("click", function (e) {
	        	      closeAllLists(e.target);
	        	  });
	        	}
			function statpop(stat,id){
				var green = ['122','222','322','130','230','330' ];
				var yellow = ['104','105','106','107','108','109','204','205',
					'206','207','208','209','304','305','306','307','308','309',
					'103','203','303','100','120','220','320','121','221','321',];
				var red = ['110','210','310'];

				if(green.includes(stat.toString())){

					$('#'+id).addClass("card-green");
					
					
				}else if(yellow.includes(stat.toString())){
					$('#'+id).addClass("card-yellow");
					
					
				}else if(red.includes(stat.toString())){
					$('#'+id).addClass("card-red");

				}
			}
			$(this).ready(function(){
			
				$('.btn').on('focusout', function () {
					$('.btn').popover('hide');
				});
				$('.moduleDetails').popover({
					title:"Module Details",
				});
				$('.expandDetails').popover({
					title:"Date/Location/Justification",
					placement:"top",
					
				});
				$('.status').popover({
					title:"Status Log",
					placement:"top",
				});
				$('.spocDetails').popover({
					trigger: "hover",
					title:"SPOC Contact Information",
				});
				
						
			});