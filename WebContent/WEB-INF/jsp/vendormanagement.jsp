<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Vendor TRM Team">
<title>TRM</title>
<link rel="icon" href="<c:url value="/resources/img/trm cropped.png" />">
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- FontAwesome-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<!-- Custom styles-->
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/vtm-modal.css"/>"
	rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script
	src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" /> "></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<!-- Local js scripts-->
<script src="<c:url value="/resources/js/vtm.js" />"></script>
<script src="<c:url value="/resources/js/trainingType.js" />"></script>
</head>
<body style="padding-top: 70px">
	<!-- Navigation -->
	<nav class="main-header navbar navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #3c8dbc">
	<div class="container">
		<a class="navbar-brand" href="<c:url value="/dashboard" />"> <img
			height="50" style="margin-top: -6px"
			src="<c:url value="/resources/img/trm cropped.png" />" /> <img
			style="margin-top: -4px"
			src="<c:url value="/resources/img/AtosSyntelLogoMedWhite.png" />"
			height="30" />
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul style="font-weight: 500;" class="navbar-nav ml-auto">
				<li class="nav-item py-1" style="padding-right: 5px"><input
					type="search" id="sb"
					style="color: white; border-radius: 15px; border: #fff 2px solid; background-color: #3c8dbc; padding-top: 2px; padding-bottom: 3px"
					required placeholder="  Filter..." /></li>
				<li class="nav-item"><a class="nav-link"
					onclick="location.href='/SpringApp/report'"
					style="cursor: pointer; color: white;"> Run Report</a></li>
				<li class="nav-item"><a class="nav-link" style="color:white" href="#">Vendor
						Management</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" style="color:white" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-user-circle"
						style="float: none;"></i> ${username}
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<span class="dropdown-item">Welcome, ${fname} ${lname}</span><span
							class="dropdown-item">Your Vertical: ${uservert}</span>
						<div class="dropdown-divider"></div>
						<a onclick="location.href='/SpringApp/logout'"
							class="dropdown-item"> <b style="color: tomato">Logout</b>
						</a>
					</div></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- Vendor List Page -->
	<div class="vendor-list-pg" style="margin-right: 10vw;">

		<div class="md-form active-cyan active-cyan-2 mb-3" id="v-search"
			style="width: 20%">
			<input class="form-control" type="search" id="search3"
				aria-label="Search" onkeyup="dynamicSearch()" style="width: 100%">

		</div>
		<i class="fas fa-search"
			style="opacity: 0.5; position: absolute; margin-left: 37vw; margin-top: 4vh;"></i>
		<a id="submitlink" href="../dashboard"><button type="button"
				class="btn btn-info" id="submit-btn-2">Submit</button></a> <a
			href="../vendorForm"><button type="button" class="btn btn-info"
				id="nv-btn">New Vendor</button></a>
		<!-- Begin Container -->
		<div class="container-fluid vm-grid-container" id="myGrid">
			<c:forEach var="v" items="${vendorDetails}">
				<!-- Begin for loop -->
				<div class="row vm-row" id="${v.vendor_id}">
					<div class="col vm-col chkbox-col">
						<label class="chkbox-container"> <input type="checkbox">
							<span class="checkmark"></span>
						</label>
					</div>
					<div class="col vm-col vm-name">${v.vendor_name}</div>
					<div class="col vm-col">${v.vendor_phone}</div>
					<div class="col vm-col">${v.vendor_email}</div>
					<div class="col btn vm-col"
						style="border-radius: 0px; cursor: pointer; max-width: 4vw;">
						<i class="fas fa-edit fa-lg " style="padding-top: 5px;"></i><span
							class="caret"></span>
					</div>
					<div class="dropdown">
						<button id="trainers-btn" class="col btn vm-col dropdown-toggle"
							type="button" data-toggle="dropdown"
							style="border-radius: 0px; cursor: pointer;">Trainers</button>
						<div class="dropdown-menu trainer-dropdown">
							<!-- Auto-populated by Ajax. See bottom of jsp for script. -->
						</div>
					</div>
					<div class="col btn vm-col"
						style="border-radius: 0px; cursor: pointer; max-width: 4vw;">
						<i class="fas fa-ellipsis-h fa-lg" style="padding-top: 5px;"></i>
					</div>
					<!--  Delete button -->
					<div class="col btn vm-col-del"
						style="border-radius: 0px; cursor: pointer;">
						<i class="fas fa-times-circle fa-lg"
							style="padding-top: 5px; color: red;"></i>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- End Container -->
	</div>








	<!-- Begin Trainer Modal -->





	<!-- Modal -->
	<div id="trainerModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="padding: 10px;">
				<div class="modal-header" style="padding: 3px;">
					<h4 class="modal-title">Add a New Trainer</h4>

					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label>Trainer Name</label>
						</div>
					</form>
				</div>

				<!--       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div> -->

			</div>
		</div>
	</div>







	<!-- End Trainer Modal -->









	<!-- End Vendor List Page-->
	<!-- Footer -->
	<!--     <footer class="py-0"
        style="background-color: #3c8dbc; width: 100%; bottom: 0; position: fixed;">
    <div class="container">
        <p class="m-0 text-left text-white"
            style="position: relative; top: 10px">Version 0.0.1</p>
        <p class="m-0 text-right text-white"
            style="position: relative; top: -14px">
            Copyright 2019</b>
        </p>
    </div>
    </div>
    </footer> -->
	<!-- ... -->
	<script>
		$(document)
				.ready(
						function() {
							var value = window.location.href
									.substring(window.location.href
											.lastIndexOf('/') + 1);
							if (value.length > 1) {
								var val = "../dashboard#myModal" + value;
								$("#submitlink").attr("href", val);
							}
						});
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$(function() {
								var url = $(location).attr('href');
								/* console.log("url: " + url); */
								var parts = url.split("/");
								var idstate = parts[parts.length - 1];
								/*      console.log("idstate: " + idstate) */
								/*  console.log(typeof idstate); */
								if (idstate == "0" || idstate == "#") {
									$(".chkbox-container").css("display",
											"none");
									$("#submit-btn-2").css("display", "none");
								}
							});
							$(function() {
								$(".trainer-dropdown")
										.each(
												function() {
													var rowid = $(this)
															.closest(".vm-row")
															.attr('id');
													var trainers = [];
													$
															.ajax({
																type : "GET",
																url : "trainerList",
																data : {
																	rowid : rowid
																},
																context : $(this),
																success : function(
																		response) {
																	//console.log(response)
																	var str = new String(
																			response);
																	var arr = JSON
																			.parse(str);
																	var style = 'style= "font-size:x-small; padding-left: 8px; padding-right: 8px; padding-top: 0px; padding-bottom: 0px; margin: 0px;"';
																	var editIcon = '<i class="fas fa-edit" style="font-size: 13px; display: flex; justify-content: center; align-items: center;"></i>'
																	var editBtn = '<button type="button" class="btn btn-light vt-btn">'
																			+ editIcon
																			+ '</button>';
																	var delIcon = '<i class="far fa-trash-alt" style="font-size: 13px; display: flex; justify-content: center; align-items: center;"></i>';
																	var delBtn = '<button type="button" class="btn btn-light vt-btn">'
																			+ delIcon
																			+ '</button>';

																	for (var i = 0; i < arr.length; i++) {
																		var tag = '<a class="dropdown-item" ' + style + ' " href="#">'
																				+ arr[i].vendor_trainer_name
																				+ "  |  "
																				+ arr[i].email
																				+ "  |  "
																				+ editBtn
																				+ " "
																				+ delBtn
																				+ "</a>"

																		/* console.log(arr[i].vendor_trainer_name); */
																		$(this)
																				.append(
																						tag);
																	}
																	$(this)
																			.append(
																					'<div class="dropdown-divider"></div>');
																	$(this)
																			.append(
																					' <a class="dropdown-item trainer-item" style= "font-size:medium; padding: 0px; margin: 0px" href="#"><button type="button" id="new-trainer-btn" class="btn btn-primary btn-block" data-toggle="modal" data-target="#trainerModal">New Trainer</button></a>');

																},
																error : function(
																		xhr,
																		status,
																		error) {
																	// alert(error);
																},
																done : function(
																		e) {
																	console
																			.log("DONE");
																}
															})
												})
							});

							$(".vm-col-del").on(
									"click",
									function() {
										var rowid = $(this).closest(".vm-row")
												.attr('id');
										$
												.ajax({
													type : "POST",
													url : "deleteVendor",
													data : {
														rowid : rowid
													},
													success : function(id) {
														console.log(
																"SUCCESS: ",
																rowid);
													},
													error : function(xhr,
															status, error) {
														// alert(error);
													},
													done : function(e) {
														console.log("DONE")
													}
												})
										location.reload();
									});
							$("#submit-btn-2")
									.on(
											"click",
											function() {
												var idList = [];
												$(".vm-row")
														.has(
																":checkbox:checked")
														.each(
																function() {
																	idList
																			.push($(
																					this)
																					.attr(
																							'id'));
																});
												idList
														.forEach(function(
																element) {
															console
																	.log(element);
														});
												$.ajax({
													type : "POST",
													url : "submitVendors",
													data : {
														"idList" : idList
																.toString()
													},
													success : function(id) {
														console.log(
																"SUCCESS: ",
																idList);
													},
													error : function(xhr,
															status, error) {
														// alert(error);
													},
													done : function(e) {
														console.log("DONE")
													}
												})
											});
						});

		function dynamicSearch() {
			console.log("Testing Testing Testing");
			var input, filter, names, name, i, txtValue;
			input = document.getElementById("search3");
			filter = input.value.toUpperCase();
			//names = $(".vm-name").toArray();
			//console.log(names.length);
			$(".vm-name").each(function() {
				//console.log($(this).text());
				txtValue = $(this).text();
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					$(this).closest(".vm-row").css("display", "");
				} else {
					$(this).closest(".vm-row").css("display", "none");
				}
			});
		}
	</script>
</body>
</html>