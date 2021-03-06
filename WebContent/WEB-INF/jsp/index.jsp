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
<script src="<c:url value="resources/vendor/jquery/jquery.min.js"/>"></script>
<script
	src="<c:url value="resources/vendor/bootstrap/js/bootstrap.bundle.min.js" /> "></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>


<!-- Local js scripts-->
<script src="<c:url value="resources/js/vtm.js" />"></script>
<script src="<c:url value="resources/js/trainingType.js" />"></script>

<!-- DT TEAM -->
<script src="<c:url value="/resources/js/main.js?version=1" />"></script>

</head>
<body style="padding-top: 70px">

	<!-- Navigation -->
	<nav class="main-header navbar navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #3c8dbc">
	<div class="container">
		<a class="navbar-brand" href="#">
			<img height="50" style="margin-top: -6px" src="<c:url value="/resources/img/trm cropped.png" />"/>
			<img style="margin-top: -4px" src="<c:url value="resources/img/AtosSyntelLogoMedWhite.png" />"
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
					onclick="location.href='/SpringApp/report'" style="cursor: pointer; color: white;">
						Run Report</a></li>
				<li class="nav-item"><a class="nav-link"
					href="vendormanagement/0" style="color:white">Vendor Management</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" style="color:white" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-user-circle"
						style="float: none;"></i> ${username}
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<span class="dropdown-item">Welcome, ${fname} ${lname}</span> <span
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

	<!-- Page Content -->
	<div class="container">
		<span
			style="float: right; margin-top: 0px; margin-bottom: 10px; color: #3c8dbc;">Executive Steps
			<div style="display: inline;"
				class="Collapse navbar-collapse justify-content-end">
				<button class="openbtn" onclick="openNav()" title="Executive View">
					<i class="fas fa-angle-double-left"></i>
				</button>
			</div>
		</span> <br> <br>
		<div class="row text-left">
			<div id="new" class="col-md-3"
				style="border: 10px solid #FFFF66; border-style: none none none solid; min-height:500px;">
				<h4>New</h4>
				<!-- 	<button type="submit" class="btn btn-outline-warning " id="bpbutton"
					style="float: right; position: relative; top: -40px; margin-right: 10px;">to
					Processing</button> -->

				<div id="toProcessing-btng" class="btn-group"
					style="float: right; position: relative; top: -40px; margin-right: 10px;">
					<button id="bpbutton" type="button"
						class="btn btn-outline-warning dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						to Processing</button>
					<div id="toProcessing-ddm" class="dropdown-menu"
						style="min-width: 6rem">
						<a class="dropdown-item" id="it-link" href="toProcessing/it/"
							style="padding-left: -10px; padding-right: 10px;"> <img
							height="75px" width="width:75px"
							src="<c:url value="/resources/img/Icon Internal.png" />">
							IT
						</a> <a class="dropdown-item" id="dt-link" href="toProcessing/dt/"
							style="padding-left: -10px; padding-right: 10px;"> <img
							height="75px" width="width:75px"
							src="<c:url value="/resources/img/Icon Development.png" />">
							DT
						</a> <a class="dropdown-item" id="vt-link" href="toProcessing/vt/"
							style="padding-left: -10px; padding-right: 10px;"> <img
							height="75px" width="width:75px"
							src="<c:url value="/resources/img/Icon Vender.png" />"> VT
						</a>
					</div>
				</div>
				<!-- if statement to display img if array is empty -->
				<!-- Start of for loop for new training requests on the left of the screen -->
				<div id="newcards">
				
				<c:forEach var="pro1" items="${trainingRequestList}"
					varStatus="theCount">
					<div class="card"
						style=" box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1), 0 10px 16px 0 rgba(0, 0, 0, 0.1);
						width: 14rem; margin-left: 10px; margin-top: 20px;" id="p1">
						<div class="cardcontainer">
							<%-- <input type="checkbox" class="form-check-input" id="pro1-check-${theCount.count}"> --%>

							<label class="chkbox-container"> <input type="checkbox"
								class="chk"
								id="pro1-check-${pro1.getTrainingRequest().training_request_id}">
								<span class="checkmark"
								style="margin-top: 8px; margin-right: 8px;"></span>
							</label>

							<div class="card-body">
								<h5 class="card-title">
									<span> <i class="fa fa-id-card" aria-hidden="true"
										style="color: #3c8dbc; float: inherit;"></i>
										${pro1.getTrainingRequest().training_request_id}
									</span>
								</h5>
								<hr style="width: 90%; border-color: #b9b9b9;">
								<p class="card-text">
								<table style="margin-bottom: -15px;">
									<tr>
										<td style="text-align: center"><i class="fas fa-user"
											style="color: #ff3232; float: inherit;"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${pro1.getEmployee().first_name}
											${pro1.getEmployee().last_name}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-network-wired"
											style="float: inherit; color: #323232"
											id="p_module_icon-${theCount.count}"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${pro1.getTrainingRequest().request_training_module}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-map-marker-alt"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${pro1.getTrainingRequest().request_location}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i class="fas fa-users"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${pro1.getTrainingRequest().request_approx_participant}</td>
									</tr>
									<tr>
										<td style="text-align: center"
											id="p_date_icon-${theCount.count}"><i
											class="fas fa-calendar-day"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${pro1.getTrainingRequest().request_start_date}</td>
									</tr>
								</table>
								</p>
							</div>
							<div class="vendor-overlay" id="module-overlay-${theCount.count}">
								<div class="cardtext">
									<p
										style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: 400;">
										<b>Module Name:</b>
										${pro1.getTrainingRequest().request_training_module} <br>
										<b>Module Scope:</b>
										${pro1.getTrainingRequest().request_training_module_scope} <br>
										<b>Training Mode:</b>
										${pro1.getTrainingRequest().request_training_mode}
									</p>
								</div>
							</div>
							<div class="vendor-overlay" id="date-overlay-${theCount.count}">
								<div class="cardtext">
									<p
										style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: 400;">
										<b>Start Date:</b>
										${pro1.getTrainingRequest().request_start_date} <br> <b>End
											Date:</b> ${pro1.getTrainingRequest().request_end_date} <br>

									</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
				</div>
			</div>
			<div id="processing-col" class="col-md-9"
				style="border: 10px solid #FFC04C; border-style: none none none solid;"
				id="pd">
				<h4>Processing</h4>
				<div class="row" id="hp">
					
					<!-- VT Team Cards -->
					<c:forEach var="pro2" items="${vendorTrainingRequestList2}"
						varStatus="theCount">
						<div class="card"
							style="margin-left: 10px; margin-top: 20px; width: 16rem;  box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1), 0 10px 16px 0 rgba(0, 0, 0, 0.1);">
							<div class="card-body">
								<h5 class="card-title">
									<span> <i class="fa fa-id-card" aria-hidden="true"
										style="color: #3c8dbc; float: inherit;"></i>

										${pro2.getTrainingRequest().training_request_id}
									</span> <span style="float: right;"> <a href="#"
										data-toggle="modal"
										data-target="#ProcessVT${pro2.getVendorTrainingRequest().vendor_training_request_id}"><img
											width='75px' height='75px'
											style="margin-top: 5px; margin-right: -20px;"
											src='.//resources/img/Icon Vender.png'> </a>

										<div class="modal"
											id="ProcessVT${pro2.getVendorTrainingRequest().vendor_training_request_id}"
											tabindex="-1" role="dialog"
											aria-labelledby="myModalLabelUpdate">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="myModalLabelDelete">Choose
															Training Type</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close"></button>
													</div>
													<!-- Modal body -->
													<div class="modal-body">
														<c:catch>
															<form>
																<a class="dropdown-item" id="it-link"
																	href="changeProcessing/it/${pro2.getVendorTrainingRequest().vendor_training_request_id}/Vendor"
																	style="padding-left: 10px; padding-right: 10px;"> <img

																	height="75px" width="width:75px"
																	src="<c:url value="/resources/img/Icon Internal.png" />">

																	IT
																</a>
															</form>
															<br>
															<form>
																<a class="dropdown-item" id="dt-link"
																	href="changeProcessing/dt/${pro2.getVendorTrainingRequest().vendor_training_request_id}/Vendor"
																	style="padding-left: 10px; padding-right: 10px;"> <img

																	height="75px" width="width:75px"
																	src="<c:url value="/resources/img/Icon Development.png" />">

																	DT
																</a>
															</form>
															<br>
														</c:catch>
													</div>
												</div>
											</div>
										</div>
									</span>
								</h5>

								<hr style="width: 70%; border-color: #b9b9b9;">



								<p class="card-text">
								<table style="margin-bottom: -15px;">
									<tr>
										<td style="text-align: center"><i class="fas fa-user"
											style="color: #ff3232; float: inherit;"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${pro2.getEmployee().first_name}
											${pro2.getEmployee().last_name}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-network-wired"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;" id="n_">
											${pro2.getTrainingRequest().request_training_module}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-map-marker-alt"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${pro2.getTrainingRequest().request_location}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i class="fas fa-users"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${pro2.getTrainingRequest().request_approx_participant}</a>
										</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-calendar-day"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${pro2.getTrainingRequest().request_start_date}</td>
									</tr>
								</table>
								</p>

								<!-- Yosuf ElSaadany 3/14/2019 1:47 pm Integration of Modal- DOM for Modal -->
								<i style="margin-left: 10px; color:red" id="modalIcons" data-placement="right"
									data-original-title="Process Request" data-toggle="modal"
									data-target="#myModal${pro2.getVendorTrainingRequest().vendor_training_request_id}"
									class="fas fa-external-link-alt  fa-lg"
									onclick="ajax(${pro2.getVendorTrainingRequest().vendor_training_request_id});"></i>

								<div class="modal"
									id="myModal${pro2.getVendorTrainingRequest().vendor_training_request_id}">
									<div class="modal-dialog modal-xl">
										<div class="modal-content">
											<!-- Modal Header -->
											<div class="modal-header">
												<div class="col-lg-4">
													<p>
														<b>Vendor Training Request ID:</b>
														${pro2.getVendorTrainingRequest().vendor_training_request_id}
													</p>
												</div>
												<div class="col-lg-4">
													<p>
														<b>Project Manager:</b> ${pro2.getEmployee().first_name}
														${pro2.getEmployee().last_name}
													</p>
												</div>
												<div class="col-lg-2">
													<p>
														<b>Module:</b>
														${pro2.getTrainingRequest().request_training_module}
													</p>
												</div>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<div style="overflow-y: scroll" class="modal-body">
												<div class="row">
													<div class="col-8">
														<!--Accordion start-->
														<div class="accordion" id="accordionEx" role="tablist"
															aria-multiselectable="true">
															<div class="card">
																<!-- Card header -->
																<div
																	onclick="javascript:section1(${pro2.getVendorTrainingRequest().vendor_training_request_id});"
																	class="card-header" role="tab" id="headingOne1">
																	<a style="text-decoration: none" class="collapsed"
																		data-toggle="collapse" data-parent="#accordionEx"
																		href="#collapseOne1" aria-expanded="false"
																		aria-controls="collapseOne1">
																		<h5 class="mb-0">
																			SPOC Shortlist Vendor <i id="modalIcons"
																				class="fas fa-angle-down rotate-icon"></i>
																		</h5>
																	</a>
																</div>
																<!-- Card body -->
																<div id="collapseOne1" class="collapse" role="tabpanel"
																	aria-labelledby="headingOne1"
																	data-parent="#accordionEx">
																	<div class="card-body">
																		<%-- <a class="nav-link" href="#" id="vm-open"
																			data-toggle="modal" data-target="#vm-modal"
																			data-backdrop="static">Vendor Management</a>
																			<button onclick="openVendorModal(${pro2.getVendorTrainingRequest().vendor_training_request_id});" class="nav-link" href="#" id="vm-open"
																			data-toggle="modal" data-target="#vm-modal"
																			data-backdrop="static">Select Vendors</button> --%>
																		<a
																			href="vendormanagement/${pro2.getVendorTrainingRequest().vendor_training_request_id}"
																			id="VMLink" data-placement="right"
																			data-toggle="tooltip" title=""
																			data-original-title="Click to select vendors for Request ID: ${pro2.getVendorTrainingRequest().vendor_training_request_id} from Vendor Management">
																			Select Vendors </a><br>
																		<table id="vendorSPOC" class="table"
																			style="margin-top: 10px;">
																			<thead id="th1" class="thead-light">
																				<tr>
																					<th>
																						<!--checkbox col-->
																					</th>
																					<th>Vendor</th>
																					<th>Phone</th>
																					<th>Email</th>
																					<th>City</th>
																					<th>State</th>
																				</tr>
																			</thead>
																			<tbody id="table-body1">

																			</tbody>
																		</table>
																		<script>
																				
																			</script>
																		<a href="#"
																			onclick="$('#myModal${pro2.getVendorTrainingRequest().vendor_training_request_id}').modal({'backdrop': 'static'});"
																			id="PTApprovedLink"
																			data-modalnum="${pro2.getVendorTrainingRequest().vendor_training_request_id}"
																			data-toggle="tooltip" data-placement="right" title=""
																			data-original-title="Please choose checkboxes for Vendors that Procurment Team Approves">PT
																			Approved</a>
																	</div>
																</div>
															</div>
															<div class="card">
																<!-- Card header -->
																<div
																	onclick="javascript:section2(${pro2.getVendorTrainingRequest().vendor_training_request_id});"
																	class="card-header" role="tab" id="headingTwo2">
																	<a style="text-decoration: none" class="collapsed"
																		data-toggle="collapse" data-parent="#accordionEx"
																		href="#collapseTwo2" aria-expanded="false"
																		aria-controls="collapseTwo2">
																		<h5 class="mb-0">
																			PT Shortlist Vendor<i id="modalIcons"
																				class="fas fa-angle-down rotate-icon"></i>
																		</h5>
																	</a>
																</div>
																<!-- Card body -->
																<div id="collapseTwo2" class="collapse" role="tabpanel"
																	aria-labelledby="headingTwo2"
																	data-parent="#accordionEx">
																	<div class="card-body">
																		<table id="vendorPT" class="table" width="60%">
																			<thead class="thead-light">
																				<tr>
																					<th>Vendor</th>
																					<th>Phone</th>
																					<th>Email</th>
																					<th>City</th>
																					<th>State</th>
																				</tr>
																			</thead>
																			<tbody id="table-body2">

																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
															<div class="card">
																<!-- Card header -->
																<div class="card-header" role="tab" id="headingThree3">
																	<a style="text-decoration: none" class="collapsed"
																		data-toggle="collapse" data-parent="#accordionEx"
																		href="#collapseThree3" aria-expanded="false"
																		aria-controls="collapseThree3">
																		<h5 class="mb-0">
																			PM Approval <i id="modalIcons"
																				class="fas fa-angle-down rotate-icon"></i>
																		</h5>
																	</a>
																</div>
																<!-- Card body -->
																<div id="collapseThree3" class="collapse"
																	role="tabpanel" aria-labelledby="headingThree3"
																	data-parent="#accordionEx">
																	<div class="card-body">
																		<a
																			href="PTListtoPM/${pro2.getVendorTrainingRequest().vendor_training_request_id}"

																			id="pmApproval" class="btn btn-info btn-lg btn-block">
																			Send PT Approved List to PM </a>
																		<div id="pendingApproval"></div>

																	</div>
																</div>
															</div>
															<div class="card">
																<!-- Card header -->
																<div
																	onclick="javascript:section4(${pro2.getVendorTrainingRequest().vendor_training_request_id});"
																	class="card-header" role="tab" id="headingFour4">
																	<a style="text-decoration: none" class="collapsed"
																		data-toggle="collapse" data-parent="#accordionEx"
																		href="#collapseFour4" aria-expanded="false"
																		aria-controls="collapseFour4">
																		<h5 class="mb-0">
																			Training Schedule <i id="modalIcons"
																				class="fas fa-angle-down rotate-icon"></i>
																		</h5>
																	</a>
																</div>
																<!-- Card body -->
																<div id="collapseFour4" class="collapse" role="tabpanel"
																	aria-labelledby="headingFour4"
																	data-parent="#accordionEx">
																	<div class="card-body">
																		<form
																			action="trainingSchedule/${pro2.getVendorTrainingRequest().vendor_training_request_id}"
																			novalidate>
																			<!-- <label>Training Dates</label> -->
																			<div class="form-group">
																				<div class="row">
																					<div class="col-3"></div>
																					<div class="col-2">
																						<label>Start Date</label>
																					</div>
																					<div class="col-4">
																						<input id="StartDate" type="date"
																							class="form-control-sm" name="startDate"
																							data-requestID="${pro2.getVendorTrainingRequest().vendor_training_request_id}">
																					</div>
																					<div class="col-3"></div>
																				</div>
																				<div style="margin-top: 0.4rem;" class="row">
																					<div class="col-3"></div>
																					<div class="col-2">
																						<label>End Date</label>
																					</div>
																					<div class="col-4">
																						<input id="EndDate" type="date"
																							class="form-control-sm" name="endDate"
																							data-requestID="${pro2.getVendorTrainingRequest().vendor_training_request_id}">
																					</div>
																					<div class="col-3"></div>
																				</div>
																				<script>
																				</script>
																				<div style="text-align: right;">
																					<a id="insdates" href="#">Save Dates</a>
																				</div>
																			</div>
																			<hr>
																			<div class="row">
																				<div class="col-3"></div>
																				<div class="col-3">
																					<label>Training Type</label>
																				</div>
																				<div class="col-3">
																					<div class="form-check">
																						<input class="form-check-input" type="radio"
																							name="trainingType" id="online" value="option1">
																						<label class="form-check-label" for="online">
																							Online </label>
																					</div>
																					<div class="form-check">
																						<input class="form-check-input" type="radio"
																							name="trainingType" id="classRoom"
																							value="option2"> <label
																							class="form-check-label" for="classRoom">
																							Class Room </label>
																					</div>
																				</div>
																				<div class="col-3"></div>
																			</div>

																			<div id="classRoomForm" class="form-group">
																				<div class="row">
																					<div class="col">
																						<br> <input name="city" placeholder="City"
																							type="text" class="form-control"
																							id="classRoom-city">
																					</div>
																				</div>
																				<div style="margin-top: 0.4rem;" class="row">
																					<div class="col">
																						<input name="state" placeholder="State"
																							type="text" class="form-control"
																							id="classRoom-state">
																					</div>
																				</div>
																				<div style="margin-top: 0.4rem;" class="row">
																					<div class="col">
																						<input name="country" placeholder="Country"
																							type="text" class="form-control"
																							id="classRoom-country">
																					</div>
																				</div>
																				<div style="margin-top: 0.4rem;" class="row">
																					<div class="col">
																						<input name="zipcode" placeholder="Zipcode"
																							type="number" pattern="\d*" max="99999"
																							class="form-control" id="classRoom-zipcode">
																					</div>
																				</div>
																				<div style="margin-top: 0.4rem;" class="row">
																					<div class="col">
																						<input name="timezone" placeholder="Time Zone"
																							type="text" class="form-control"
																							id="classRoom-timezone">
																					</div>
																				</div>

																				<div style="margin-top: 0.4rem;" class="row">
																					<div class="col">
																						<input name="location" placeholder="Location"
																							type="text" class="form-control"
																							id="classRoom-location">
																					</div>
																				</div>
																				<div style="margin-top: 0.4rem;" class="row">
																					<div class="col">
																						<input name="room" placeholder="Room Number"
																							type="text" class="form-control"
																							id="classRoom-roomNumber">
																					</div>
																				</div>
																				<div style="margin-top: 0.4rem;" class="row">
																					<div class="col">
																						<input name="breakdown"
																							placeholder="Training Break Down" type="text"
																							class="form-control" id="classRoom-breakdown">
																					</div>
																				</div>
																			</div>
																			<div id="onlineForm" class="form-group">
																				<div class="row">
																					<div class="col">
																						<br> <input name="url"
																							placeholder="Training URL" type="text"
																							class="form-control" id="online-URL">
																					</div>
																				</div>
																				<div style="margin-top: 0.4rem;" class="row">
																					<div class="col">
																						<input name="audio" placeholder="Training Audio"
																							type="text" class="form-control"
																							id="online-audio">
																					</div>
																				</div>
																			</div>
																			<button style="float: right" type="submit"
																				class="btn btn-primary">Submit</button>
																			<br>
																		</form>
																	</div>
																</div>
															</div>
														</div>
														<!-- Accordion end -->
													</div>
													<div class="col-4">
														<div id="card" class="card">
															<div id="card-body" class="card-body">
																<h5 class="card-title">Progress</h5>
																<p class="card-text" id="progressSummary">Summary of
																	the progress of this training request is shown below</p>
															</div>
															<ul class="list-group list-group-flush">
																<li class="list-group-item">Shortlist Vendor <span
																	id="dot-sec1" title="Completed" class="dot"
																	style="background-color: green;"></span>
																</li>
																<li class="list-group-item">Procurement Team
																	Shortlist <span id="dot-sec2" title="Completed"
																	class="dot" style="background-color: green;"></span>
																</li>
																<li class="list-group-item">PM Approval <span
																	id="dot-sec3" title="In Progress" class="dot"
																	style="background-color: yellow;"></span>
																</li>
																<li class="list-group-item">Training Schedule <span
																	id="dot-sec4" title="Pending" class="dot"
																	style="background-color: red;"></span>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<!-- Modal footer -->
											<div class="modal-footer">
												<button class="btn btn-primary">Save</button>
											</div>
										</div>
									</div>
								</div>

								<!-- Yosuf ElSaadany 3/15/2019 11:06 pm Adding Approval Email Popup -->
								<i id="modalIcons" data-toggle="modal" data-placement="bottom"
									data-original-title="Upload Approval Email" 
									data-target="#approval" class="fas fa-upload fa-lg"></i>
								<div class="modal" id="approval">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<!-- Modal Header -->
											<div class="modal-header">
												<div class="modal-title">Attach Approval Email</div>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<!-- Modal body -->
											<div class="modal-body">
												<input type="file" />
											</div>
											<!-- Modal footer -->
											<div class="modal-footer">
												<button class="btn btn-primary">Upload</button>
											</div>
										</div>
									</div>
								</div>
								<img
									id="logtooltip-${pro2.getVendorTrainingRequest().vendor_training_request_id}"
									data-html="true"
									onclick="logg(${pro2.getVendorTrainingRequest().vendor_training_request_id});"
									title="Click icon to load log"
									style="margin-right: 8px; float: right;"
									src="https://img.icons8.com/ios/24/000000/edit-property.png"
									data-toggle="tooltip" data-placement="left" />

							</div>
						</div>
					</c:forEach>


					<!-- IT Team Cards -->
					<c:forEach var="itList" items="${internalTrainingRequestList2}"
						varStatus="theCount">
						<div class="card"
							style="margin-left: 10px; margin-top: 20px; width: 16rem;  box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1), 0 10px 16px 0 rgba(0, 0, 0, 0.1);">
							<div class="card-body">
								<h5 class="card-title">
									<span> <i class="fa fa-id-card" aria-hidden="true"
										style="color: #3c8dbc; float: inherit;"></i>

										${itList.getTrainingRequest().training_request_id}
									</span> <span style="float: right;"> <a href="#"
										data-toggle="modal"
										data-target="#ProcessIT${itList.getInternalTrainingRequest().internal_training_id}"><img
											width='75px' height='75px'
											style="margin-top: 5px; margin-right: -20px;"
											src='.//resources/img/Icon Internal.png'> </a>

										<div class="modal"
											id="ProcessIT${itList.getInternalTrainingRequest().internal_training_id}"
											tabindex="-1" role="dialog"
											aria-labelledby="myModalLabelUpdate">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="myModalLabelDelete">Choose
															Training Type</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close"></button>
													</div>
													<!-- Modal body -->
													<div class="modal-body">
														<c:catch>
															<form>
																<a class="dropdown-item" id="it-link"
																	href="changeProcessing/dt/${itList.getInternalTrainingRequest().internal_training_id}/Internal"
																	style="padding-left: 10px; padding-right: 10px;"> <img

																	height="75px" width="width:75px"
																	src="<c:url value="/resources/img/Icon Development.png" />">

																	DT
																</a>
															</form>
															<br>
															<form>
																<a class="dropdown-item" id="dt-link"
																	href="changeProcessing/vt/${itList.getInternalTrainingRequest().internal_training_id}/Internal"

																	style="padding-left: 10px; padding-right: 10px;"> <img
																	height="75px" width="width:75px"
																	src="<c:url value="/resources/img/Icon Vender.png" />">

																	VT
																</a>
															</form>
															<br>
														</c:catch>
													</div>
												</div>
											</div>
										</div>
									</span>
								</h5>
								<hr style="width: 70%; border-color: #b9b9b9;">

								<p class="card-text">
								<table style="margin-bottom: -15px;">
									<tr>
										<td style="text-align: center"><i class="fas fa-user"
											style="color: #ff3232; float: inherit;"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${itList.getEmployee().first_name}
											${itList.getEmployee().last_name}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-network-wired"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;" id="n_">
											${itList.getTrainingRequest().request_training_module}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-map-marker-alt"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${itList.getTrainingRequest().request_location}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i class="fas fa-users"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${itList.getTrainingRequest().request_approx_participant}</a>
										</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-calendar-day"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">
											${itList.getTrainingRequest().request_start_date}</td>
									</tr>
								</table>
								</p>
								<%-- <a href="it"><i data-placement="right"
									data-original-title="Process Request" 
									style="margin-left: 10px; color: red;" id="modalIcons"
									class="fas fa-external-link-alt fa-lg"
									onclick="openItPage(${itList.getInternalTrainingRequest().internal_training_id});"></i></a> --%>
								<!-- 
								<i id="modalIcons" data-toggle="modal" data-placement="bottom"
									data-original-title="Upload Approval Email" 
									data-target="#approval" class="fas fa-upload fa-lg"></i>
								<div class="modal" id="approval">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											Modal Header
											<div class="modal-header">
												<div class="modal-title">Attach Approval Email</div>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											Modal body
											<div class="modal-body">
												<input type="file" />
											</div>
											Modal footer
											<div class="modal-footer">
												<button class="btn btn-primary">Upload</button>
											</div>
										</div>
									</div>
								</div> -->
								
														<div style="margin-top: 20px;">
									<i style="margin-left: 10px; color: red;" id="modalIcons"
										title="Open" data-toggle="modal"
										data-target="#edit_steps${inProcess.request.training_request_id}"
										class="fas fa-external-link-alt fa-lg"></i>
								</div>
								</p>

								<div class="modal"
									id="edit_steps${inProcess.request.training_request_id}">

									<div style="margin-top: 45px;"
										class="modal-dialog modal-dialog-centered modal-xl">
										<div class="modal-content">

											<div class="modal-header">
												<h4 class="modal-title">Update Training Request</h4>
												<button type="button" class="close" data-dismiss="modal">x</button>
											</div>

											<!-- Modal body -->
											<div style="overflow-y: scroll" class="modal-body">
												<div class="container">
													<div class="row">
														<div class="col-8">
															<div
																class="accordion md-accordion accordion-4 z-depth-1-half"
																id="accordion" role="tablist"
																aria-multiselectable="true">


																<div class="card-header" role="tab" id="heading4">
																	<a style="text-decoration: none" class="collapsed"
																		data-toggle="collapse" data-parent="#accordion"
																		href="#collapse4" aria-expanded="false"
																		aria-controls="collapse4">
																		<h5 class="mb-0">
																			<i class="fa fa-database"></i> I.T Trainer <i
																				id="modalIcons"
																				class="fas fa-angle-down rotate-icon"></i>
																		</h5>
																	</a>
																</div>

																<!-- Card body -->
																<div>
																	<form
																		action="updateDate/${inProcess.trainer.getDtt_trainer_request_id()}/${inProcess.request.training_request_id}">
																		<div id="collapse4" class="collapse" role="tabpanel"
																			aria-labelledby="heading4" data-parent="#accordion">
																			<div class="card-body pt-0">
																				<div style="padding-top: 30px">
																					<i class="hfas fas fa-user-tie"><label>Trainer</label></i>


																					<!-- 		<form action="updateTrainer/${inProcess.trainer.getDtt_trainer_request_id()}">  -->

																					<input class="col-6" type="number"
																						name="employee_id"
																						placeholder="Employee/Trainer ID">
																					<!-- 			 <input class="btn btn-primary" type="submit" />  -->
																					<!-- 		</form>  -->




																				</div>
																				<!-- Search By ID -->
																				<p>
																					<!-- 	
																		<label style="padding-left: 5px; font-size: 10px;">Search
																			Employee By ID:</label> <input type="text" id="itV" /> <input
																			type="button" id="EmpId"
																			style="font-size: 14px; height: 25px; width: 70px;"
																			value="Search">
																	</p>  -->

																					<!-- 		<p>
																		<i class="hfas fas fa-check"
																			style="padding-right: 50px"><label>Trainer
																				Acceptance</label></i> <input type="checkbox" />
																	</p>  -->
																			</div>
																		</div>
																		<div class="card">

																			<!-- Card header -->
																			<div class="card-header" role="tab" id="heading5">
																				<a style="text-decoration: none" class="collapsed"
																					data-toggle="collapse" data-parent="#accordion"
																					href="#collapse5" aria-expanded="false"
																					aria-controls="collapse5">
																					<h5 class="mb-0">
																						<i class="fa fa-code"></i> Date & Type<i
																							id="modalIcons"
																							class="fas fa-angle-down rotate-icon"></i>
																					</h5>

																				</a>
																			</div>

																			<!-- Card body -->
																			<div id="collapse5" class="collapse" role="tabpanel"
																				aria-labelledby="heading5" data-parent="#accordion">
																				<!-- 			<form action="updateDate/${inProcess.request.training_request_id}">  -->
																				<div class="card-body pt-0">
																					<p>
																					<div class="row">
																						<div class="block">
																							<label>Start</label>
																						</div>
																						<div class="block" style="padding-left: 50px">
																							<input type="date" class="datepicker"
																								name="request_start_date" />
																						</div>
																					</div>
																					</p>

																					<p>
																					<div class="row">
																						<div class="block">
																							<label style="padding-right: 5.5px">End </label>
																						</div>
																						<div class="block" style="padding-left: 50px">
																							<input type="date" class="datepicker"
																								name="request_end_date">
																						</div>
																					</div>
																					</p>

																					<p>
																					<table>
																						<tr>
																							<td style="width: 100%">
																								<div class="checkboxes">
																									<c:if
																										test="${inProcess.request.request_training_mode eq 'class room'}">
																										<input type="radio"
																											name="request_training_mode"
																											value="class room" checked />
																									</c:if>
																									<c:if
																										test="${inProcess.request.request_training_mode ne 'class room'}">
																										<input type="radio"
																											name="request_training_mode"
																											value="class room" />
																									</c:if>
																									<label> Classroom</label>

																									<c:if
																										test="${inProcess.request.request_training_mode eq 'web based'}">
																										<input type="radio"
																											name="request_training_mode"
																											value="web based" checked />
																									</c:if>
																									<c:if
																										test="${inProcess.request.request_training_mode ne 'web based'}">
																										<input type="radio"
																											name="request_training_mode"
																											value="web based" />
																									</c:if>
																									<label> Web Based</label>

																								</div> <input class="btn btn-primary" type="submit"
																								value="Update" />

																							</td>
																						</tr>
																					</table>
																					</p>
																				</div>

																			</div>


																		</div>
																	</form>
																</div>
																<div class="card">

																	<!-- Card header -->
																	<div class="card-header" role="tab" id="heading6">
																		<a style="text-decoration: none" class="collapsed"
																			data-toggle="collapse" data-parent="#accordion"
																			href="#collapse6" aria-controls="collapse6">
																			<h5 class="mb-0">
																				<i class="hfas fas fa-check"></i> PM Approved <i
																					id="modalIcons"
																					class="fas fa-angle-down rotate-icon"></i>
																			</h5>

																		</a>
																	</div>

																	<!-- Card body -->

																	<div id="collapse6" class="collapse" role="tabpanel"
																		aria-labelledby="heading6" data-parent="#accordion">
																		<div class="card-body pt-0">
																			<p>${inProcess.reqLog.description}</p>
																		</div>
																	</div>
																</div>

																<div class="card">
																	<!-- Card header -->
																	<div class="card-header" role="tab" id="headingFour4">
																		<a id="ts${inProcess.request.training_request_id}"
																			style="text-decoration: none" class="collapsed"
																			data-toggle="collapse" data-parent="#accordion"
																			href="#collapseFour4" aria-expanded="false"
																			aria-controls="collapseFour4">
																			<h5 class="mb-0">
																				<i class="fas fa-cloud"></i> Training Schedule <i
																					id="modalIcons"
																					class="fas fa-angle-down rotate-icon"></i>
																			</h5>
																		</a>
																	</div>
																	<!-- Card body -->
																	<div id="collapseFour4" class="collapse"
																		role="tabpanel" aria-labelledby="headingFour4"
																		data-parent="#accordion">
																		<div class="card-body">
																			<form
																				action="trainingSchedule/${inProcess.schedule.getTraining_schedule_id()}/${inProcess.request.training_request_id}">

																				<!-- <label>Training Dates</label> -->
																				<div class="form-group">
																					<div class="row">
																						<div class="col-3"></div>


																						<div class="col-3"></div>
																					</div>
																				</div>

																				<div class="classRoomForm" class="form-group">
																					<div class="row">
																						<!-- 		<div class="col-2">
																				<p class="lableClass">City: </p>
																				</div>  -->
																						<div class="col">


																							<input name="training_city"
																								placeholder="City: ${inProcess.schedule.training_city}"
																								type="text" class="form-control">
																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">
																							<input name="training_state"
																								placeholder="State:  ${inProcess.schedule.training_state}"
																								type="text" class="form-control">
																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">
																							<input name="training_country"
																								placeholder="Country: ${inProcess.schedule.training_country}"
																								type="text" class="form-control">
																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">
																							<input name="training_zipcode"
																								placeholder="Zipcode: ${inProcess.schedule.training_zipcode}"
																								type="number" pattern="\d*" max="99999"
																								class="form-control">
																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<input name="timezone" placeholder="Time Zone"
																								type="text" class="form-control">
																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<select name="training_time_zone"
																								class="form-control" id="timezone">

																								<option selected="selected" disabled>Time
																									Zone</option>
																								<option timeZoneId="1" gmtAdjustment="GMT-12:00"
																									useDaylightTime="0" value="-12">(GMT-12:00)
																									International Date Line West</option>
																								<option timeZoneId="2" gmtAdjustment="GMT-11:00"
																									useDaylightTime="0" value="-11">(GMT-11:00)
																									Midway Island, Samoa</option>
																								<option timeZoneId="3" gmtAdjustment="GMT-10:00"
																									useDaylightTime="0" value="-10">(GMT-10:00)
																									Hawaii</option>
																								<option timeZoneId="4" gmtAdjustment="GMT-09:00"
																									useDaylightTime="1" value="-9">(GMT-09:00)
																									Alaska</option>
																								<option timeZoneId="5" gmtAdjustment="GMT-08:00"
																									useDaylightTime="1" value="-8">(GMT-08:00)
																									Pacific Time (US & Canada)</option>
																								<option timeZoneId="6" gmtAdjustment="GMT-08:00"
																									useDaylightTime="1" value="-8">(GMT-08:00)
																									Tijuana, Baja California</option>
																								<option timeZoneId="7" gmtAdjustment="GMT-07:00"
																									useDaylightTime="0" value="-7">(GMT-07:00)
																									Arizona</option>
																								<option timeZoneId="8" gmtAdjustment="GMT-07:00"
																									useDaylightTime="1" value="-7">(GMT-07:00)
																									Chihuahua, La Paz, Mazatlan</option>
																								<option timeZoneId="9" gmtAdjustment="GMT-07:00"
																									useDaylightTime="1" value="-7">(GMT-07:00)
																									Mountain Time (US & Canada)</option>
																								<option timeZoneId="10"
																									gmtAdjustment="GMT-06:00" useDaylightTime="0"
																									value="-6">(GMT-06:00) Central America</option>
																								<option timeZoneId="11"
																									gmtAdjustment="GMT-06:00" useDaylightTime="1"
																									value="-6">(GMT-06:00) Central Time
																									(US & Canada)</option>
																								<option timeZoneId="12"
																									gmtAdjustment="GMT-06:00" useDaylightTime="1"
																									value="-6">(GMT-06:00) Guadalajara,
																									Mexico City, Monterrey</option>
																								<option timeZoneId="13"
																									gmtAdjustment="GMT-06:00" useDaylightTime="0"
																									value="-6">(GMT-06:00) Saskatchewan</option>
																								<option timeZoneId="14"
																									gmtAdjustment="GMT-05:00" useDaylightTime="0"
																									value="-5">(GMT-05:00) Bogota, Lima,
																									Quito, Rio Branco</option>
																								<option timeZoneId="15"
																									gmtAdjustment="GMT-05:00" useDaylightTime="1"
																									value="-5">(GMT-05:00) Eastern Time
																									(US & Canada)</option>
																								<option timeZoneId="16"
																									gmtAdjustment="GMT-05:00" useDaylightTime="1"
																									value="-5">(GMT-05:00) Indiana (East)</option>
																								<option timeZoneId="17"
																									gmtAdjustment="GMT-04:00" useDaylightTime="1"
																									value="-4">(GMT-04:00) Atlantic Time
																									(Canada)</option>
																								<option timeZoneId="18"
																									gmtAdjustment="GMT-04:00" useDaylightTime="0"
																									value="-4">(GMT-04:00) Caracas, La Paz</option>
																								<option timeZoneId="19"
																									gmtAdjustment="GMT-04:00" useDaylightTime="0"
																									value="-4">(GMT-04:00) Manaus</option>
																								<option timeZoneId="20"
																									gmtAdjustment="GMT-04:00" useDaylightTime="1"
																									value="-4">(GMT-04:00) Santiago</option>
																								<option timeZoneId="21"
																									gmtAdjustment="GMT-03:30" useDaylightTime="1"
																									value="-3.5">(GMT-03:30) Newfoundland</option>
																								<option timeZoneId="22"
																									gmtAdjustment="GMT-03:00" useDaylightTime="1"
																									value="-3">(GMT-03:00) Brasilia</option>
																								<option timeZoneId="23"
																									gmtAdjustment="GMT-03:00" useDaylightTime="0"
																									value="-3">(GMT-03:00) Buenos Aires,
																									Georgetown</option>
																								<option timeZoneId="24"
																									gmtAdjustment="GMT-03:00" useDaylightTime="1"
																									value="-3">(GMT-03:00) Greenland</option>
																								<option timeZoneId="25"
																									gmtAdjustment="GMT-03:00" useDaylightTime="1"
																									value="-3">(GMT-03:00) Montevideo</option>
																								<option timeZoneId="26"
																									gmtAdjustment="GMT-02:00" useDaylightTime="1"
																									value="-2">(GMT-02:00) Mid-Atlantic</option>
																								<option timeZoneId="27"
																									gmtAdjustment="GMT-01:00" useDaylightTime="0"
																									value="-1">(GMT-01:00) Cape Verde Is.</option>
																								<option timeZoneId="28"
																									gmtAdjustment="GMT-01:00" useDaylightTime="1"
																									value="-1">(GMT-01:00) Azores</option>
																								<option timeZoneId="29"
																									gmtAdjustment="GMT+00:00" useDaylightTime="0"
																									value="0">(GMT+00:00) Casablanca,
																									Monrovia, Reykjavik</option>
																								<option timeZoneId="30"
																									gmtAdjustment="GMT+00:00" useDaylightTime="1"
																									value="0">(GMT+00:00) Greenwich Mean
																									Time : Dublin, Edinburgh, Lisbon, London</option>
																								<option timeZoneId="31"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) Amsterdam,
																									Berlin, Bern, Rome, Stockholm, Vienna</option>
																								<option timeZoneId="32"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) Belgrade,
																									Bratislava, Budapest, Ljubljana, Prague</option>
																								<option timeZoneId="33"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) Brussels,
																									Copenhagen, Madrid, Paris</option>
																								<option timeZoneId="34"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) Sarajevo,
																									Skopje, Warsaw, Zagreb</option>
																								<option timeZoneId="35"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) West Central
																									Africa</option>
																								<option timeZoneId="36"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Amman</option>
																								<option timeZoneId="37"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Athens,
																									Bucharest, Istanbul</option>
																								<option timeZoneId="38"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Beirut</option>
																								<option timeZoneId="39"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Cairo</option>
																								<option timeZoneId="40"
																									gmtAdjustment="GMT+02:00" useDaylightTime="0"
																									value="2">(GMT+02:00) Harare, Pretoria</option>
																								<option timeZoneId="41"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Helsinki, Kyiv,
																									Riga, Sofia, Tallinn, Vilnius</option>
																								<option timeZoneId="42"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Jerusalem</option>
																								<option timeZoneId="43"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Minsk</option>
																								<option timeZoneId="44"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Windhoek</option>
																								<option timeZoneId="45"
																									gmtAdjustment="GMT+03:00" useDaylightTime="0"
																									value="3">(GMT+03:00) Kuwait, Riyadh,
																									Baghdad</option>
																								<option timeZoneId="46"
																									gmtAdjustment="GMT+03:00" useDaylightTime="1"
																									value="3">(GMT+03:00) Moscow, St.
																									Petersburg, Volgograd</option>
																								<option timeZoneId="47"
																									gmtAdjustment="GMT+03:00" useDaylightTime="0"
																									value="3">(GMT+03:00) Nairobi</option>
																								<option timeZoneId="48"
																									gmtAdjustment="GMT+03:00" useDaylightTime="0"
																									value="3">(GMT+03:00) Tbilisi</option>
																								<option timeZoneId="49"
																									gmtAdjustment="GMT+03:30" useDaylightTime="1"
																									value="3.5">(GMT+03:30) Tehran</option>
																								<option timeZoneId="50"
																									gmtAdjustment="GMT+04:00" useDaylightTime="0"
																									value="4">(GMT+04:00) Abu Dhabi,
																									Muscat</option>
																								<option timeZoneId="51"
																									gmtAdjustment="GMT+04:00" useDaylightTime="1"
																									value="4">(GMT+04:00) Baku</option>
																								<option timeZoneId="52"
																									gmtAdjustment="GMT+04:00" useDaylightTime="1"
																									value="4">(GMT+04:00) Yerevan</option>
																								<option timeZoneId="53"
																									gmtAdjustment="GMT+04:30" useDaylightTime="0"
																									value="4.5">(GMT+04:30) Kabul</option>
																								<option timeZoneId="54"
																									gmtAdjustment="GMT+05:00" useDaylightTime="1"
																									value="5">(GMT+05:00) Yekaterinburg</option>
																								<option timeZoneId="55"
																									gmtAdjustment="GMT+05:00" useDaylightTime="0"
																									value="5">(GMT+05:00) Islamabad,
																									Karachi, Tashkent</option>
																								<option timeZoneId="56"
																									gmtAdjustment="GMT+05:30" useDaylightTime="0"
																									value="5.5">(GMT+05:30) Sri
																									Jayawardenapura</option>
																								<option timeZoneId="57"
																									gmtAdjustment="GMT+05:30" useDaylightTime="0"
																									value="5.5">(GMT+05:30) Chennai,
																									Kolkata, Mumbai, New Delhi</option>
																								<option timeZoneId="58"
																									gmtAdjustment="GMT+05:45" useDaylightTime="0"
																									value="5.75">(GMT+05:45) Kathmandu</option>
																								<option timeZoneId="59"
																									gmtAdjustment="GMT+06:00" useDaylightTime="1"
																									value="6">(GMT+06:00) Almaty,
																									Novosibirsk</option>
																								<option timeZoneId="60"
																									gmtAdjustment="GMT+06:00" useDaylightTime="0"
																									value="6">(GMT+06:00) Astana, Dhaka</option>
																								<option timeZoneId="61"
																									gmtAdjustment="GMT+06:30" useDaylightTime="0"
																									value="6.5">(GMT+06:30) Yangon
																									(Rangoon)</option>
																								<option timeZoneId="62"
																									gmtAdjustment="GMT+07:00" useDaylightTime="0"
																									value="7">(GMT+07:00) Bangkok, Hanoi,
																									Jakarta</option>
																								<option timeZoneId="63"
																									gmtAdjustment="GMT+07:00" useDaylightTime="1"
																									value="7">(GMT+07:00) Krasnoyarsk</option>
																								<option timeZoneId="64"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Beijing,
																									Chongqing, Hong Kong, Urumqi</option>
																								<option timeZoneId="65"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Kuala Lumpur,
																									Singapore</option>
																								<option timeZoneId="66"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Irkutsk, Ulaan
																									Bataar</option>
																								<option timeZoneId="67"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Perth</option>
																								<option timeZoneId="68"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Taipei</option>
																								<option timeZoneId="69"
																									gmtAdjustment="GMT+09:00" useDaylightTime="0"
																									value="9">(GMT+09:00) Osaka, Sapporo,
																									Tokyo</option>
																								<option timeZoneId="70"
																									gmtAdjustment="GMT+09:00" useDaylightTime="0"
																									value="9">(GMT+09:00) Seoul</option>
																								<option timeZoneId="71"
																									gmtAdjustment="GMT+09:00" useDaylightTime="1"
																									value="9">(GMT+09:00) Yakutsk</option>
																								<option timeZoneId="72"
																									gmtAdjustment="GMT+09:30" useDaylightTime="0"
																									value="9.5">(GMT+09:30) Adelaide</option>
																								<option timeZoneId="73"
																									gmtAdjustment="GMT+09:30" useDaylightTime="0"
																									value="9.5">(GMT+09:30) Darwin</option>
																								<option timeZoneId="74"
																									gmtAdjustment="GMT+10:00" useDaylightTime="0"
																									value="10">(GMT+10:00) Brisbane</option>
																								<option timeZoneId="75"
																									gmtAdjustment="GMT+10:00" useDaylightTime="1"
																									value="10">(GMT+10:00) Canberra,
																									Melbourne, Sydney</option>
																								<option timeZoneId="76"
																									gmtAdjustment="GMT+10:00" useDaylightTime="1"
																									value="10">(GMT+10:00) Hobart</option>
																								<option timeZoneId="77"
																									gmtAdjustment="GMT+10:00" useDaylightTime="0"
																									value="10">(GMT+10:00) Guam, Port
																									Moresby</option>
																								<option timeZoneId="78"
																									gmtAdjustment="GMT+10:00" useDaylightTime="1"
																									value="10">(GMT+10:00) Vladivostok</option>
																								<option timeZoneId="79"
																									gmtAdjustment="GMT+11:00" useDaylightTime="1"
																									value="11">(GMT+11:00) Magadan,
																									Solomon Is., New Caledonia</option>
																								<option timeZoneId="80"
																									gmtAdjustment="GMT+12:00" useDaylightTime="1"
																									value="12">(GMT+12:00) Auckland,
																									Wellington</option>
																								<option timeZoneId="81"
																									gmtAdjustment="GMT+12:00" useDaylightTime="0"
																									value="12">(GMT+12:00) Fiji,
																									Kamchatka, Marshall Is.</option>
																								<option timeZoneId="82"
																									gmtAdjustment="GMT+13:00" useDaylightTime="0"
																									value="13">(GMT+13:00) Nuku'alofa</option>
																							</select>

																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<input name="training_location"
																								placeholder="Location: ${inProcess.schedule.training_location}"
																								type="text" class="form-control">

																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<input name="training_room_number"
																								placeholder="Room Number: ${inProcess.schedule.training_room_number}"
																								type="text" class="form-control">

																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<input name="training_break_down"
																								placeholder="Training Break Down: ${inProcess.schedule.training_break_down}"
																								type="text" class="form-control">
																						</div>
																					</div>
																				</div>

																				<div class="onlineForm" class="form-group">
																					<div class="row">
																						<div class="col">
																							<br> <input name="training_url"
																								placeholder="Training URL: ${inProcess.schedule.training_url}"
																								type="text" class="form-control">

																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<input name="training_phone"
																								placeholder="Training Phone: ${inProcess.schedule.training_phone}"
																								type="text" class="form-control">

																						</div>
																					</div>
																				</div>
																				<button style="float: right" type="submit"
																					class="btn btn-primary">Submit</button>
																				<br>
																			</form>
																		</div>
																	</div>
																</div>
															</div>
														</div>





														<div class="col-sm-4">
															<div class="card proc-card">
																<div class="card-header"
																	style="color: white; text-align: center; weight: bold">Summary:
																	${inProcess.request.training_request_id}</div>

																<div class="card-body proc-card-body">
																	<i class="fas fa-chalkboard-teacher" title="Training"></i>
																	${inProcess.request.request_training_type}:
																	${inProcess.request.request_training_module}
																	(${inProcess.request.request_training_module_scope})<br>

																	<i class="fas fa-user" title="Trainer"></i>
																	${inProcess.currentTrainer.first_name}
																	${inProcess.currentTrainer.last_name}<br> <i
																		class="fas fa-calendar-alt" title="Requested Dates"></i>
																	${inProcess.request.request_start_date.substring(0,10)}
																	- ${inProcess.request.request_end_date.substring(0,10)}<br>
																	<i class="fas fa-map-marker-alt" title="Location"></i>
																	${inProcess.request.request_location}<br> <i
																		class="fas fa-building" title="Training Mode"></i> <span>${inProcess.request.request_training_mode}</span>
																	<hr>
																	<p id="status">Status: ${inProcess.status.status}</p>

																</div>
															</div>
														</div>
													</div>
												</div>
											</div>

											<!-- Modal footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-danger"
													data-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>

								<i id="modalIcons" data-toggle="modal" data-placement="bottom"
									data-original-title="Upload Approval Email"
									data-target="#approval" class="fas fa-upload fa-lg"></i>
								<div class="modal" id="approval">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<!-- Modal Header -->
											<div class="modal-header">
												<div class="modal-title">Attach Approval Email</div>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<!-- Modal body -->
											<div class="modal-body">
												<input type="file" />
											</div>
											<!-- Modal footer -->
											<div class="modal-footer">
												<button class="btn btn-primary">Upload</button>
											</div>
										</div>
									</div>
								</div>
								
								<img
									id="logtooltip-${itList.getInternalTrainingRequest().internal_training_id}"
									data-html="true"
									onclick="ITLog(${itList.getInternalTrainingRequest().internal_training_id});"
									title="Click icon to load log"
									style="margin-right: 8px; float: right;"
									src="https://img.icons8.com/ios/24/000000/edit-property.png"
									data-toggle="tooltip" data-placement="left" />

							</div>

						</div>
					</c:forEach>

					<!-- DT Team Cards -->
					<c:forEach var="inProcess" items="${inProcessList}"
						varStatus="index">
						<div class="card"
							style="margin-left: 10px; margin-top: 20px; width: 16rem;  box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1), 0 10px 16px 0 rgba(0, 0, 0, 0.1);">

							<div class="card-body">
								<h5 class="card-title">
									<span><i class="fa fa-id-card" aria-hidden="true"
										style="color: #3c8dbc; float: inherit;"></i>
										${inProcess.request.training_request_id} </span> <span

										style="float: right;"> <a href="#" data-toggle="modal"
										data-target="#ProcessDT${inProcess.training.getDtt_training_id()}"><img
											width='75px' height='75px'
											style="margin-top: 5px; margin-right: -20px;"
											src='.//resources/img/Icon Development.png'> </a>
										<div class="modal"
											id="ProcessDT${inProcess.training.getDtt_training_id()}"
											tabindex="-1" role="dialog"
											aria-labelledby="myModalLabelUpdate">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" id="myModalLabelDelete">Choose
															Training Type</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close"></button>
													</div>
													<!-- Modal body -->
													<div class="modal-body">
														<c:catch>
															<form>
																<a class="dropdown-item" id="it-link"
																	href="changeProcessing/it/${inProcess.training.getDtt_training_id()}/Develop"
																	style="padding-left: 10px; padding-right: 10px;"> <img
																	height="75px" width="width:75px"
																	src="<c:url value="/resources/img/Icon Internal.png" />">
																	IT
																</a>
															</form>
															<br>
															<form>
																<a class="dropdown-item" id="dt-link"
																	href="changeProcessing/vt/${inProcess.training.getDtt_training_id()}/Develop"
																	style="padding-left: 10px; padding-right: 10px;"> <img
																	height="75px" width="width:75px"
																	src="<c:url value="/resources/img/Icon Vender.png" />">
																	VT
																</a>
															</form>
															<br>
														</c:catch>
													</div>
												</div>
											</div>
										</div>
									</span>
								</h5>
								<hr style="width: 70%; border-color: #b9b9b9;">

								<p class="card-text">
								
								<table style="margin-bottom: -15px;">
									<tr>
										<td style="text-align: center"><i class="fas fa-user"
											style="color: #ff3232; float: inherit;"></i></td>
										<td style="text-align: left; padding-left: 5px;">${inProcess.projectManager.first_name}
											${inProcess.projectManager.last_name}</td>
									</tr>

									<tr>
										<td style="text-align: center"><i
											class="fas fa-network-wired"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">${inProcess.request.request_training_type}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-map-marker-alt"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">${inProcess.getRequest().getRequest_location()}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i class="fas fa-users"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">${inProcess.request.request_approx_participant}</td>
									</tr>
									<tr>
										<td style="text-align: center"><i
											class="fas fa-calendar-day"
											style="float: inherit; color: #323232"></i></td>
										<td style="text-align: left; padding-left: 5px;">${inProcess.request.request_start_date}</td>
									</tr>
								</table>
								<div style="margin-top: 20px;">
									<i style="margin-left: 10px; color: red;" id="modalIcons"
										title="Open" data-toggle="modal"
										data-target="#edit_steps${inProcess.request.training_request_id}"
										class="fas fa-external-link-alt fa-lg"></i>
								</div>
								</p>

								<div class="modal"
									id="edit_steps${inProcess.request.training_request_id}">

									<div style="margin-top: 45px;"
										class="modal-dialog modal-dialog-centered modal-xl">
										<div class="modal-content">

											<div class="modal-header">
												<h4 class="modal-title">Update Training Request</h4>
												<button type="button" class="close" data-dismiss="modal">x</button>
											</div>

											<!-- Modal body -->
											<div style="overflow-y: scroll" class="modal-body">
												<div class="container">
													<div class="row">
														<div class="col-8">
															<div
																class="accordion md-accordion accordion-4 z-depth-1-half"
																id="accordion" role="tablist"
																aria-multiselectable="true">


																<div class="card-header" role="tab" id="heading4">
																	<a style="text-decoration: none" class="collapsed"
																		data-toggle="collapse" data-parent="#accordion"
																		href="#collapse4" aria-expanded="false"
																		aria-controls="collapse4">
																		<h5 class="mb-0">
																			<i class="fa fa-database"></i> D.T Trainer <i
																				id="modalIcons"
																				class="fas fa-angle-down rotate-icon"></i>
																		</h5>
																	</a>
																</div>

																<!-- Card body -->
																<div>
																	<form
																		action="updateDate/${inProcess.trainer.getDtt_trainer_request_id()}/${inProcess.request.training_request_id}">
																		<div id="collapse4" class="collapse" role="tabpanel"
																			aria-labelledby="heading4" data-parent="#accordion">
																			<div class="card-body pt-0">
																				<div style="padding-top: 30px">
																					<i class="hfas fas fa-user-tie"><label>Trainer</label></i>


																					<!-- 		<form action="updateTrainer/${inProcess.trainer.getDtt_trainer_request_id()}">  -->

																					<input class="col-6" type="number"
																						name="employee_id"
																						placeholder="Employee/Trainer ID">
																					<!-- 			 <input class="btn btn-primary" type="submit" />  -->
																					<!-- 		</form>  -->




																				</div>
																				<!-- Search By ID -->
																				<p>
																					<!-- 	
																		<label style="padding-left: 5px; font-size: 10px;">Search
																			Employee By ID:</label> <input type="text" id="itV" /> <input
																			type="button" id="EmpId"
																			style="font-size: 14px; height: 25px; width: 70px;"
																			value="Search">
																	</p>  -->

																					<!-- 		<p>
																		<i class="hfas fas fa-check"
																			style="padding-right: 50px"><label>Trainer
																				Acceptance</label></i> <input type="checkbox" />
																	</p>  -->
																			</div>
																		</div>
																		<div class="card">

																			<!-- Card header -->
																			<div class="card-header" role="tab" id="heading5">
																				<a style="text-decoration: none" class="collapsed"
																					data-toggle="collapse" data-parent="#accordion"
																					href="#collapse5" aria-expanded="false"
																					aria-controls="collapse5">
																					<h5 class="mb-0">
																						<i class="fa fa-code"></i> Date & Type<i
																							id="modalIcons"
																							class="fas fa-angle-down rotate-icon"></i>
																					</h5>

																				</a>
																			</div>

																			<!-- Card body -->
																			<div id="collapse5" class="collapse" role="tabpanel"
																				aria-labelledby="heading5" data-parent="#accordion">
																				<!-- 			<form action="updateDate/${inProcess.request.training_request_id}">  -->
																				<div class="card-body pt-0">
																					<p>
																					<div class="row">
																						<div class="block">
																							<label>Start</label>
																						</div>
																						<div class="block" style="padding-left: 50px">
																							<input type="date" class="datepicker"
																								name="request_start_date" />
																						</div>
																					</div>
																					</p>

																					<p>
																					<div class="row">
																						<div class="block">
																							<label style="padding-right: 5.5px">End </label>
																						</div>
																						<div class="block" style="padding-left: 50px">
																							<input type="date" class="datepicker"
																								name="request_end_date">
																						</div>
																					</div>
																					</p>

																					<p>
																					<table>
																						<tr>
																							<td style="width: 100%">
																								<div class="checkboxes">
																									<c:if
																										test="${inProcess.request.request_training_mode eq 'class room'}">
																										<input type="radio"
																											name="request_training_mode"
																											value="class room" checked />
																									</c:if>
																									<c:if
																										test="${inProcess.request.request_training_mode ne 'class room'}">
																										<input type="radio"
																											name="request_training_mode"
																											value="class room" />
																									</c:if>
																									<label> Classroom</label>

																									<c:if
																										test="${inProcess.request.request_training_mode eq 'web based'}">
																										<input type="radio"
																											name="request_training_mode"
																											value="web based" checked />
																									</c:if>
																									<c:if
																										test="${inProcess.request.request_training_mode ne 'web based'}">
																										<input type="radio"
																											name="request_training_mode"
																											value="web based" />
																									</c:if>
																									<label> Web Based</label>

																								</div> 
																								<input class="btn btn-primary" type="submit"
																								value="Update" />

																							</td>
																						</tr>
																					</table>
																					</p>
																				</div>

																			</div>


																		</div>
																	</form>
																</div>
																<div class="card">

																	<!-- Card header -->
																	<div class="card-header" role="tab" id="heading6">
																		<a style="text-decoration: none" class="collapsed"
																			data-toggle="collapse" data-parent="#accordion"
																			href="#collapse6" aria-controls="collapse6">
																			<h5 class="mb-0">
																				<i class="hfas fas fa-check"></i> PM Approved <i
																					id="modalIcons"
																					class="fas fa-angle-down rotate-icon"></i>
																			</h5>

																		</a>
																	</div>

																	<!-- Card body -->

																	<div id="collapse6" class="collapse" role="tabpanel"
																		aria-labelledby="heading6" data-parent="#accordion">
																		<div class="card-body pt-0">
																			<p>${inProcess.reqLog.description}</p>
																		</div>
																	</div>
																</div>

																<div class="card">
																	<!-- Card header -->
																	<div class="card-header" role="tab" id="headingFour4">
																		<a id="ts${inProcess.request.training_request_id}"
																			style="text-decoration: none" class="collapsed"

																			data-toggle="collapse" data-parent="#accordion"
																			href="#collapseFour4" aria-expanded="false"
																			aria-controls="collapseFour4">
																			<h5 class="mb-0">
																				<i class="fas fa-cloud"></i> Training Schedule <i
																					id="modalIcons"
																					class="fas fa-angle-down rotate-icon"></i>
																			</h5>
																		</a>
																	</div>
																	<!-- Card body -->
																	<div id="collapseFour4" class="collapse"
																		role="tabpanel" aria-labelledby="headingFour4"
																		data-parent="#accordion">
																		<div class="card-body">
																			<form

																				action="trainingSchedule/${inProcess.schedule.getTraining_schedule_id()}/${inProcess.request.training_request_id}">

																				<!-- <label>Training Dates</label> -->
																				<div class="form-group">
																					<div class="row">
																						<div class="col-3"></div>


																						<div class="col-3"></div>
																					</div>
																				</div>

																				<div class="classRoomForm" class="form-group">
																					<div class="row">
																						<!-- 		<div class="col-2">
																				<p class="lableClass">City: </p>
																				</div>  -->
																						<div class="col">


																							<input name="training_city"
																								placeholder="City: ${inProcess.schedule.training_city}"
																								type="text" class="form-control">
																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">
																							<input name="training_state"
																								placeholder="State:  ${inProcess.schedule.training_state}"
																								type="text" class="form-control">
																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">
																							<input name="training_country"
																								placeholder="Country: ${inProcess.schedule.training_country}"
																								type="text" class="form-control">
																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">
																							<input name="training_zipcode"
																								placeholder="Zipcode: ${inProcess.schedule.training_zipcode}"
																								type="number" pattern="\d*" max="99999"
																								class="form-control">
																						</div>
																					</div>

																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<select name="training_time_zone"
																								class="form-control" id="timezone">

																								<option selected="selected" disabled>Time
																									Zone</option>
																								<option timeZoneId="1" gmtAdjustment="GMT-12:00"
																									useDaylightTime="0" value="-12">(GMT-12:00)
																									International Date Line West</option>
																								<option timeZoneId="2" gmtAdjustment="GMT-11:00"
																									useDaylightTime="0" value="-11">(GMT-11:00)
																									Midway Island, Samoa</option>
																								<option timeZoneId="3" gmtAdjustment="GMT-10:00"
																									useDaylightTime="0" value="-10">(GMT-10:00)
																									Hawaii</option>
																								<option timeZoneId="4" gmtAdjustment="GMT-09:00"
																									useDaylightTime="1" value="-9">(GMT-09:00)
																									Alaska</option>
																								<option timeZoneId="5" gmtAdjustment="GMT-08:00"
																									useDaylightTime="1" value="-8">(GMT-08:00)
																									Pacific Time (US & Canada)</option>
																								<option timeZoneId="6" gmtAdjustment="GMT-08:00"
																									useDaylightTime="1" value="-8">(GMT-08:00)
																									Tijuana, Baja California</option>
																								<option timeZoneId="7" gmtAdjustment="GMT-07:00"
																									useDaylightTime="0" value="-7">(GMT-07:00)
																									Arizona</option>
																								<option timeZoneId="8" gmtAdjustment="GMT-07:00"
																									useDaylightTime="1" value="-7">(GMT-07:00)
																									Chihuahua, La Paz, Mazatlan</option>
																								<option timeZoneId="9" gmtAdjustment="GMT-07:00"
																									useDaylightTime="1" value="-7">(GMT-07:00)
																									Mountain Time (US & Canada)</option>
																								<option timeZoneId="10"
																									gmtAdjustment="GMT-06:00" useDaylightTime="0"
																									value="-6">(GMT-06:00) Central America</option>
																								<option timeZoneId="11"
																									gmtAdjustment="GMT-06:00" useDaylightTime="1"
																									value="-6">(GMT-06:00) Central Time
																									(US & Canada)</option>
																								<option timeZoneId="12"
																									gmtAdjustment="GMT-06:00" useDaylightTime="1"
																									value="-6">(GMT-06:00) Guadalajara,
																									Mexico City, Monterrey</option>
																								<option timeZoneId="13"
																									gmtAdjustment="GMT-06:00" useDaylightTime="0"
																									value="-6">(GMT-06:00) Saskatchewan</option>
																								<option timeZoneId="14"
																									gmtAdjustment="GMT-05:00" useDaylightTime="0"
																									value="-5">(GMT-05:00) Bogota, Lima,
																									Quito, Rio Branco</option>
																								<option timeZoneId="15"
																									gmtAdjustment="GMT-05:00" useDaylightTime="1"
																									value="-5">(GMT-05:00) Eastern Time
																									(US & Canada)</option>
																								<option timeZoneId="16"
																									gmtAdjustment="GMT-05:00" useDaylightTime="1"
																									value="-5">(GMT-05:00) Indiana (East)</option>
																								<option timeZoneId="17"
																									gmtAdjustment="GMT-04:00" useDaylightTime="1"
																									value="-4">(GMT-04:00) Atlantic Time
																									(Canada)</option>
																								<option timeZoneId="18"
																									gmtAdjustment="GMT-04:00" useDaylightTime="0"
																									value="-4">(GMT-04:00) Caracas, La Paz</option>
																								<option timeZoneId="19"
																									gmtAdjustment="GMT-04:00" useDaylightTime="0"
																									value="-4">(GMT-04:00) Manaus</option>
																								<option timeZoneId="20"
																									gmtAdjustment="GMT-04:00" useDaylightTime="1"
																									value="-4">(GMT-04:00) Santiago</option>
																								<option timeZoneId="21"
																									gmtAdjustment="GMT-03:30" useDaylightTime="1"
																									value="-3.5">(GMT-03:30) Newfoundland</option>
																								<option timeZoneId="22"
																									gmtAdjustment="GMT-03:00" useDaylightTime="1"
																									value="-3">(GMT-03:00) Brasilia</option>
																								<option timeZoneId="23"
																									gmtAdjustment="GMT-03:00" useDaylightTime="0"
																									value="-3">(GMT-03:00) Buenos Aires,
																									Georgetown</option>
																								<option timeZoneId="24"
																									gmtAdjustment="GMT-03:00" useDaylightTime="1"
																									value="-3">(GMT-03:00) Greenland</option>
																								<option timeZoneId="25"
																									gmtAdjustment="GMT-03:00" useDaylightTime="1"
																									value="-3">(GMT-03:00) Montevideo</option>
																								<option timeZoneId="26"
																									gmtAdjustment="GMT-02:00" useDaylightTime="1"
																									value="-2">(GMT-02:00) Mid-Atlantic</option>
																								<option timeZoneId="27"
																									gmtAdjustment="GMT-01:00" useDaylightTime="0"
																									value="-1">(GMT-01:00) Cape Verde Is.</option>
																								<option timeZoneId="28"
																									gmtAdjustment="GMT-01:00" useDaylightTime="1"
																									value="-1">(GMT-01:00) Azores</option>
																								<option timeZoneId="29"
																									gmtAdjustment="GMT+00:00" useDaylightTime="0"
																									value="0">(GMT+00:00) Casablanca,
																									Monrovia, Reykjavik</option>
																								<option timeZoneId="30"
																									gmtAdjustment="GMT+00:00" useDaylightTime="1"
																									value="0">(GMT+00:00) Greenwich Mean
																									Time : Dublin, Edinburgh, Lisbon, London</option>
																								<option timeZoneId="31"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) Amsterdam,
																									Berlin, Bern, Rome, Stockholm, Vienna</option>
																								<option timeZoneId="32"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) Belgrade,
																									Bratislava, Budapest, Ljubljana, Prague</option>
																								<option timeZoneId="33"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) Brussels,
																									Copenhagen, Madrid, Paris</option>
																								<option timeZoneId="34"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) Sarajevo,
																									Skopje, Warsaw, Zagreb</option>
																								<option timeZoneId="35"
																									gmtAdjustment="GMT+01:00" useDaylightTime="1"
																									value="1">(GMT+01:00) West Central
																									Africa</option>
																								<option timeZoneId="36"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Amman</option>
																								<option timeZoneId="37"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Athens,
																									Bucharest, Istanbul</option>
																								<option timeZoneId="38"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Beirut</option>
																								<option timeZoneId="39"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Cairo</option>
																								<option timeZoneId="40"
																									gmtAdjustment="GMT+02:00" useDaylightTime="0"
																									value="2">(GMT+02:00) Harare, Pretoria</option>
																								<option timeZoneId="41"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Helsinki, Kyiv,
																									Riga, Sofia, Tallinn, Vilnius</option>
																								<option timeZoneId="42"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Jerusalem</option>
																								<option timeZoneId="43"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Minsk</option>
																								<option timeZoneId="44"
																									gmtAdjustment="GMT+02:00" useDaylightTime="1"
																									value="2">(GMT+02:00) Windhoek</option>
																								<option timeZoneId="45"
																									gmtAdjustment="GMT+03:00" useDaylightTime="0"
																									value="3">(GMT+03:00) Kuwait, Riyadh,
																									Baghdad</option>
																								<option timeZoneId="46"
																									gmtAdjustment="GMT+03:00" useDaylightTime="1"
																									value="3">(GMT+03:00) Moscow, St.
																									Petersburg, Volgograd</option>
																								<option timeZoneId="47"
																									gmtAdjustment="GMT+03:00" useDaylightTime="0"
																									value="3">(GMT+03:00) Nairobi</option>
																								<option timeZoneId="48"
																									gmtAdjustment="GMT+03:00" useDaylightTime="0"
																									value="3">(GMT+03:00) Tbilisi</option>
																								<option timeZoneId="49"
																									gmtAdjustment="GMT+03:30" useDaylightTime="1"
																									value="3.5">(GMT+03:30) Tehran</option>
																								<option timeZoneId="50"
																									gmtAdjustment="GMT+04:00" useDaylightTime="0"
																									value="4">(GMT+04:00) Abu Dhabi,
																									Muscat</option>
																								<option timeZoneId="51"
																									gmtAdjustment="GMT+04:00" useDaylightTime="1"
																									value="4">(GMT+04:00) Baku</option>
																								<option timeZoneId="52"
																									gmtAdjustment="GMT+04:00" useDaylightTime="1"
																									value="4">(GMT+04:00) Yerevan</option>
																								<option timeZoneId="53"
																									gmtAdjustment="GMT+04:30" useDaylightTime="0"
																									value="4.5">(GMT+04:30) Kabul</option>
																								<option timeZoneId="54"
																									gmtAdjustment="GMT+05:00" useDaylightTime="1"
																									value="5">(GMT+05:00) Yekaterinburg</option>
																								<option timeZoneId="55"
																									gmtAdjustment="GMT+05:00" useDaylightTime="0"
																									value="5">(GMT+05:00) Islamabad,
																									Karachi, Tashkent</option>
																								<option timeZoneId="56"
																									gmtAdjustment="GMT+05:30" useDaylightTime="0"
																									value="5.5">(GMT+05:30) Sri
																									Jayawardenapura</option>
																								<option timeZoneId="57"
																									gmtAdjustment="GMT+05:30" useDaylightTime="0"
																									value="5.5">(GMT+05:30) Chennai,
																									Kolkata, Mumbai, New Delhi</option>
																								<option timeZoneId="58"
																									gmtAdjustment="GMT+05:45" useDaylightTime="0"
																									value="5.75">(GMT+05:45) Kathmandu</option>
																								<option timeZoneId="59"
																									gmtAdjustment="GMT+06:00" useDaylightTime="1"
																									value="6">(GMT+06:00) Almaty,
																									Novosibirsk</option>
																								<option timeZoneId="60"
																									gmtAdjustment="GMT+06:00" useDaylightTime="0"
																									value="6">(GMT+06:00) Astana, Dhaka</option>
																								<option timeZoneId="61"
																									gmtAdjustment="GMT+06:30" useDaylightTime="0"
																									value="6.5">(GMT+06:30) Yangon
																									(Rangoon)</option>
																								<option timeZoneId="62"
																									gmtAdjustment="GMT+07:00" useDaylightTime="0"
																									value="7">(GMT+07:00) Bangkok, Hanoi,
																									Jakarta</option>
																								<option timeZoneId="63"
																									gmtAdjustment="GMT+07:00" useDaylightTime="1"
																									value="7">(GMT+07:00) Krasnoyarsk</option>
																								<option timeZoneId="64"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Beijing,
																									Chongqing, Hong Kong, Urumqi</option>
																								<option timeZoneId="65"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Kuala Lumpur,
																									Singapore</option>
																								<option timeZoneId="66"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Irkutsk, Ulaan
																									Bataar</option>
																								<option timeZoneId="67"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Perth</option>
																								<option timeZoneId="68"
																									gmtAdjustment="GMT+08:00" useDaylightTime="0"
																									value="8">(GMT+08:00) Taipei</option>
																								<option timeZoneId="69"
																									gmtAdjustment="GMT+09:00" useDaylightTime="0"
																									value="9">(GMT+09:00) Osaka, Sapporo,
																									Tokyo</option>
																								<option timeZoneId="70"
																									gmtAdjustment="GMT+09:00" useDaylightTime="0"
																									value="9">(GMT+09:00) Seoul</option>
																								<option timeZoneId="71"
																									gmtAdjustment="GMT+09:00" useDaylightTime="1"
																									value="9">(GMT+09:00) Yakutsk</option>
																								<option timeZoneId="72"
																									gmtAdjustment="GMT+09:30" useDaylightTime="0"
																									value="9.5">(GMT+09:30) Adelaide</option>
																								<option timeZoneId="73"
																									gmtAdjustment="GMT+09:30" useDaylightTime="0"
																									value="9.5">(GMT+09:30) Darwin</option>
																								<option timeZoneId="74"
																									gmtAdjustment="GMT+10:00" useDaylightTime="0"
																									value="10">(GMT+10:00) Brisbane</option>
																								<option timeZoneId="75"
																									gmtAdjustment="GMT+10:00" useDaylightTime="1"
																									value="10">(GMT+10:00) Canberra,
																									Melbourne, Sydney</option>
																								<option timeZoneId="76"
																									gmtAdjustment="GMT+10:00" useDaylightTime="1"
																									value="10">(GMT+10:00) Hobart</option>
																								<option timeZoneId="77"
																									gmtAdjustment="GMT+10:00" useDaylightTime="0"
																									value="10">(GMT+10:00) Guam, Port
																									Moresby</option>
																								<option timeZoneId="78"
																									gmtAdjustment="GMT+10:00" useDaylightTime="1"
																									value="10">(GMT+10:00) Vladivostok</option>
																								<option timeZoneId="79"
																									gmtAdjustment="GMT+11:00" useDaylightTime="1"
																									value="11">(GMT+11:00) Magadan,
																									Solomon Is., New Caledonia</option>
																								<option timeZoneId="80"
																									gmtAdjustment="GMT+12:00" useDaylightTime="1"
																									value="12">(GMT+12:00) Auckland,
																									Wellington</option>
																								<option timeZoneId="81"
																									gmtAdjustment="GMT+12:00" useDaylightTime="0"
																									value="12">(GMT+12:00) Fiji,
																									Kamchatka, Marshall Is.</option>
																								<option timeZoneId="82"
																									gmtAdjustment="GMT+13:00" useDaylightTime="0"
																									value="13">(GMT+13:00) Nuku'alofa</option>
																							</select>

																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<input name="training_location"
																								placeholder="Location: ${inProcess.schedule.training_location}"
																								type="text" class="form-control">

																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<input name="training_room_number"
																								placeholder="Room Number: ${inProcess.schedule.training_room_number}"
																								type="text" class="form-control">

																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<input name="training_break_down"
																								placeholder="Training Break Down: ${inProcess.schedule.training_break_down}"

																								type="text" class="form-control">
																						</div>
																					</div>
																				</div>

																				<div class="onlineForm" class="form-group">
																					<div class="row">
																						<div class="col">
																							<br> <input name="training_url"
																								placeholder="Training URL: ${inProcess.schedule.training_url}"
																								type="text" class="form-control">

																						</div>
																					</div>
																					<div style="margin-top: 0.4rem;" class="row">
																						<div class="col">

																							<input name="training_phone"
																								placeholder="Training Phone: ${inProcess.schedule.training_phone}"
																								type="text" class="form-control">

																						</div>
																					</div>
																				</div>
																				<button style="float: right" type="submit"
																					class="btn btn-primary">Submit</button>
																				<br>
																			</form>
																		</div>
																	</div>
																</div>
															</div>
														</div>





														<div class="col-sm-4">
															<div class="card proc-card">
																<div class="card-header" style="color: white; text-align:center; weight:bold">Summary: ${inProcess.request.training_request_id}</div>

																<div class="card-body proc-card-body">
																	<i class="fas fa-chalkboard-teacher" title="Training"></i>
																	${inProcess.request.request_training_type}:
																	${inProcess.request.request_training_module}
																	(${inProcess.request.request_training_module_scope})<br>

																	<i class="fas fa-user" title="Trainer"></i>
																	${inProcess.currentTrainer.first_name}
																	${inProcess.currentTrainer.last_name}<br> <i
																		class="fas fa-calendar-alt" title="Requested Dates"></i>
																	${inProcess.request.request_start_date.substring(0,10)}
																	- ${inProcess.request.request_end_date.substring(0,10)}<br>
																	<i class="fas fa-map-marker-alt" title="Location"></i>
																	${inProcess.request.request_location}<br> <i
																		class="fas fa-building" title="Training Mode"></i> <span>${inProcess.request.request_training_mode}</span>
																	<hr>
																	<p id="status">Status: ${inProcess.status.status}</p>

																</div>
															</div>
														</div>
													</div>
												</div>
											</div>

											<!-- Modal footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-danger"
													data-dismiss="modal">Close</button>

											</div>

										</div>
										

									</div>
								</div>
								<!-- DTT Modal End -->
								<i id="modalIcons" data-toggle="modal" data-placement="bottom"
									data-original-title="Upload Approval Email"
									data-target="#approval" class="fas fa-upload fa-lg"></i>
								<div class="modal" id="approval">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<!-- Modal Header -->
											<div class="modal-header">
												<div class="modal-title">Attach Approval Email</div>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<!-- Modal body -->
											<div class="modal-body">
												<input type="file" />
											</div>
											<!-- Modal footer -->
											<div class="modal-footer">
												<button class="btn btn-primary">Upload</button>
											</div>
										</div>
									</div>
								</div>
								<img
									id="logtooltip-${inProcess.request.training_request_id}"
									data-html="true"
									onclick="logDT(${inProcess.request.training_request_id});"
									title="Click icon to load log"
									style="margin-right: 8px; float: right;"
									src="https://img.icons8.com/ios/24/000000/edit-property.png"
									data-toggle="tooltip" data-placement="left" />
							</div>
						</div>
					</c:forEach>
 
				</div>
			</div>

		</div>

		<div style="margin-top: 50px" id="mySidebar" class="sidebar">
			<script>
      function openNav() {
        document.getElementById("mySidebar").style.width = "350px";
      }

      function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
      }
      $(document).ready(function () {
        $(".exec-check-box").click(function () {
          if ($(this).find("span").attr("class") == "far fa-square")
            $(this).find("span").removeClass("far fa-square").addClass("far fa-check-square");
          else
            $(this).find("span").removeClass("far fa-check-square").addClass("far fa-square");
        });


      });
    </script>
			<div class="container">
				<a href="javascript:void(0)" style="color: white" class="closebtn"
					onclick="closeNav()">&times;</a> <br>
				<c:forEach var="wf" items="${TRM_DTT_Homepage3}">
					<c:catch>
						<div class="card exec-card">
							<div class="card-header exec-card-header">

								<h4 class="card=title">

									<span class="fa fa-calendar-check"></span>
									${wf.request.training_request_id}

									<button id="exec-expand-btn" data-toggle="collapse"
										data-target="#exec-table">
										<span class="fa fa-angle-double-down" title="Expand"></span>
									</button>
								</h4>

								<table width="100%">
									<tr>
										<td align="center"><span class="fa fa-book"
											title="Training Course"></span></td>
										<td>${wf.request.request_training_module}</td>
									</tr>
									<tr>
										<td align="center"><span class="fa fa-chalkboard-teacher"
											title="Trainer"></span></td>
										<td>${wf.ct.first_name}${wf.ct.last_name}</td>
									</tr>
									<tr>
										<td align="center"><span class="fa fa-calendar-alt"
											title="Start and End Dates"></span></td>
										<td>${wf.schedule.training_start_date}-
											${wf.schedule.training_end_date}</td>
									</tr>
								</table>

							</div>
							<div class="card-body">
								<div id="exec-table" class="collapse">
									<form
										action="updateWorkflowStatus/${wf.workflow.executive_workflow_status_id}">
										<c:if test="${wf.workflow.sent_invitations == 1}">
											<input type="checkbox" class="wfcl" name="sent_invitations"
												value="1" checked /> Invitations Sent<br>
										</c:if>
										<c:if test="${wf.workflow.sent_invitations == 0}">
											<input type="checkbox" class="wfcl" name="sent_invitations"
												value="0" /> Invitations Sent<br>
										</c:if>

										<c:if
											test="${wf.workflow.completed_skillport_enrollment == 1}">
											<input type="checkbox" class="wfcl"
												name="completed_skillport_enrollment" value="1" checked /> Skillport Enrollment<br>
										</c:if>
										<c:if
											test="${wf.workflow.completed_skillport_enrollment == 0}">
											<input type="checkbox" class="wfcl"
												name="completed_skillport_enrollment" value="0" /> Skillport Enrollment<br>
										</c:if>


										<c:if test="${wf.workflow.assessments_recorded == 1}">
											<input type="checkbox" class="wfcl"
												name="assessments_recorded" value="1" checked /> Assessments Recorded<br>
										</c:if>
										<c:if test="${wf.workflow.assessments_recorded == 0}">
											<input type="checkbox" class="wfcl"
												name="assessments_recorded" value="0" /> Assessments Recorded<br>
										</c:if>


										<c:if test="${wf.workflow.vendor_training_clearance == 1}">
											<input type="checkbox" class="wfcl"
												name="vendor_training_clearance" value="1" checked /> Vendor Training Clearance<br>
										</c:if>
										<c:if test="${wf.workflow.vendor_training_clearance == 0}">
											<input type="checkbox" class="wfcl"
												name="vendor_training_clearance" value="0" /> Vendor Training Clearance<br>
										</c:if>

										<c:if test="${wf.workflow.completed_feedback == 1}">
											<input type="checkbox" class="wfcl" name="completed_feedback"
												value="1" checked /> Feedback Received<br>
										</c:if>
										<c:if test="${wf.workflow.completed_feedback == 0}">
											<input type="checkbox" class="wfcl" name="completed_feedback"
												value="0" /> Feedback Received<br>
										</c:if>

										<c:if test="${wf.workflow.training_completed == 1}">
											<input type="checkbox" class="wfcl" name="training_completed"
												value="1" checked /> Training Completed<br>
										</c:if>
										<c:if test="${wf.workflow.training_completed == 0}">
											<input type="checkbox" class="wfcl" name="training_completed"
												value="0" /> Training Completed<br>
										</c:if>

										<input type="submit" label="Save" value="Save"
											class="btn btn-primary btn-wf" />
									</form>
									<script>
					$(document).ready(function() {
						$(".wfcl").click(function() {
							if($(this).is(":checked")){
								$(this).val(1);
							}
							else {
								$(this).val(0);
							}
						});
					});			
					</script>
								</div>
							</div>
						</div>
					</c:catch>
				</c:forEach>
			
	<%-- 			<c:forEach var="VTList" items="${vendorTrainingRequestList3}">
					
					${VTList.getTrainingRequest().training_request_id}
					
				</c:forEach>  --%>
			</div>
		</div>
		<br> <br> <br>
	</div>

	<!-- Footer -->
	<footer class="py-0"
		style="background-color: #3c8dbc; width: 100%; bottom: 0; position: fixed; z-index:1;">
	<div class="container">
		<p class="m-0 text-left text-white"
			style="position: relative; top: 10px">Version 0.0.1</p>
		<p class="m-0 text-right text-white"
			style="position: relative; top: -14px">
			Copyright 2019</b>
		</p>
	</div>
	</div>
	</footer>

	<script>
		$(document).ready(
				function() {
					$("[id^=p_module_icon]").hover(function() {
						var id = this.id.substring(14, 15);
						var vendis = $('#module-overlay-'+id);
						vendis.css("visibility", "visible");
					}, function() {
						var id = this.id.substring(14, 15);
						//console.log(id+' id');
						var vendis = $('#module-overlay-'+id);
						vendis.css("visibility", "hidden");
					}); 
					
					$("[id^=p_date_icon]").hover(function() {
						var id = this.id.substring(12, 13);
						var vendis = $('#date-overlay-'+id);
						vendis.css("visibility", "visible");
					}, function() {
						var id = this.id.substring(12, 13);
						var vendis = $('#date-overlay-'+id);
						vendis.css("visibility", "hidden");
					}); 		
					
					$("#bpbutton").click(function(e){
					    if($('input[type=checkbox]:checked').length == 0){
					    	alert("Please select minimum one checkbox");
					    	/* $('#toProcessing-ddm').hide(); */
					    } else {
					    	/* $('#toProcessing-ddm').show(); */
					    	var checkedIds = $(".chk:checked").map(function() {
							    return this.id.substring(11,16);
							    }).toArray();		  
				    		var itl = 'toProcessing/it/'+checkedIds;
			    		  	var dtl = 'toProcessing/dt/'+checkedIds.join(",");
						  	var vtl = 'toProcessing/vt/'+checkedIds.join();
						    $("#it-link").attr("href", itl);
					    	$("#dt-link").attr("href", dtl);
						  	$("#vt-link").attr("href", vtl);
						  /* alert("You selected: " + checkedIds.join(", ") + " to process"); */
					    }
					});   
					
					if( !$.trim( $('#newcards').html() ).length ) {
						//newcards is empty or is only white space
						//add empty card
						$('#newcards').html(' <div class="card" style=" box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1), 0 10px 16px 0 rgba(0, 0, 0, 0.19); width: 14rem; margin-left: 10px; margin-top: 20px;"><div class="cardcontainer"><div class="card-body"><h5 class="card-title">No new requests</h5><hr style="width: 90%; border-color: #b9b9b9;"><p class="card-text"></p><img src="<c:url value="resources/img/trm.png" />" height="190" /></div></div></div> ');
					}
					
				/* 	if(${theCount} == 0) {
						$('#newcards').html(' <div class="card" style=" box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1), 0 10px 16px 0 rgba(0, 0, 0, 0.19); width: 14rem; margin-left: 10px; margin-top: 20px;"><div class="cardcontainer"><div class="card-body"><h5 class="card-title">No new requests</h5><hr style="width: 90%; border-color: #b9b9b9;"><p class="card-text"></p><img src="<c:url value="resources/img/trm.png" />" height="190" /></div></div></div> ');
					} */
					
					
					$('#sb').keyup(function() {
						$('.card').removeClass('d-none');
						var filter = $(this).val(); //input value
						$(document).find('.card .card-body h5:not(:contains("'+filter+'"))').parent().parent().addClass('d-none');
					});
				});
	</script>

	<script>
	$(document).ready(function(){
		if (/.myModal+.....$/.test(window.location.href)) {

			
	  		var myModal = window.location.hash.substr(1);
	  			  		
	  		$('#' + myModal).modal('show');
	  		
	  		ajax(myModal.substr(7));
	  		
	  		
		}
		if (/.myModal+.....#2$/.test(window.location.href)) {
			//open section 2
			var val = window.location.hash.substr(1);
			var myModal = val.substring(7,12)
			console.log(myModal);

	  		$('#myModal' + myModal).modal('show');
	  		ajax(myModal);
	  		
	  		section2(myModal);
	  		$('[id=collapseTwo2]').attr("class","collapse show");

		}
	});
	</script>
	<script>
		document.getElementById("StartDate").addEventListener("change", function() {
		    var strt = this.value;
		    var end = document.getElementById("EndDate").value;
		    var reqID = parseInt(this.dataset.requestid);
		    var ins = "insertDates/"+ reqID +"/" + strt + "/" + end;
		    document.getElementById("insdates").setAttribute('href', ins);
		});
		document.getElementById("EndDate").addEventListener("change", function() {
		    var end = this.value;
		    var strt = document.getElementById("StartDate").value;
		    var reqID = parseInt(this.dataset.requestid);
		    var ins = "insertDates/"+ reqID +"/" + strt + "/" + end;
		    document.getElementById("insdates").setAttribute('href', ins);
		});
	</script>

	<!-- All Ajax Requests -->
	<script>

	// Open Modal
	function ajax(id) {
		console.log('id is : ' + id);
		$.ajax({
        	type: "POST",
        	data: {id: id},
            url : 'progress',
            success : function(data) {
           		//titles: Completed In Progress Pending
           		//styles: green     yellow      red
           		
           		//headingOne1 href="#collapseOne1"
           		//headingTwo2 
            	if(data.status === 303){
            		$('[id=headingOne1link]').attr("href","#collapseOne1");
            		$('[id=headingTwo2link]').attr("href","");
            		$('[id=headingThree3link]').attr("href","");
            		$('[id=headingFour4link]').attr("href","");
            		
            		$("[id=dot-sec1]").attr("title", "In Progress");
            		$("[id=dot-sec1]").attr("style", "background-color:yellow;");
            		$("[id=dot-sec2]").attr("title", "Pending");
            		$("[id=dot-sec2]").attr("style", "background-color:red;");
            		$("[id=dot-sec3]").attr("title", "Pending");
            		$("[id=dot-sec3]").attr("style", "background-color:red;");
            		$("[id=dot-sec4]").attr("title", "Pending");
            		$("[id=dot-sec4]").attr("style", "background-color:red;"); 
            		$("[id=progressSummary]").text("Select Vendors for SPOC Shortlist from Vendor Management");
            	}
            	if(data.status === 304){
            		$('[id=headingOne1link]').attr("href","#collapseOne1");
            		$('[id=headingTwo2link]').attr("href","#collapseTwo2");
            		$('[id=headingThree3link]').attr("href","");
            		$('[id=headingFour4link]').attr("href","");
            		
            		$("[id=dot-sec1]").attr("title", "Completed");
            		$("[id=dot-sec1]").attr("style", "background-color:green;");
            		$("[id=dot-sec2]").attr("title", "In Progress");
            		$("[id=dot-sec2]").attr("style", "background-color:yellow;");
            		$("[id=dot-sec3]").attr("title", "Pending");
            		$("[id=dot-sec3]").attr("style", "background-color:red;");
            		$("[id=dot-sec4]").attr("title", "Pending");
            		$("[id=dot-sec4]").attr("style", "background-color:red;"); 
            		$("[id=progressSummary]").text("Select Procurement Team approved Vendors from SPOC Shortlist");
            	}
            	if(data.status === 305){
            		$("[id=pmApproval]").show();
            		$('[id=pendingApproval]').html("");
            		$('[id=headingOne1link]').attr("href","#collapseOne1");
            		$('[id=headingTwo2link]').attr("href","#collapseTwo2");
            		$('[id=headingThree3link]').attr("href","#collapseThree3");
            		$('[id=headingFour4link]').attr("href","");
            		
            		$("[id=dot-sec1]").attr("title", "Completed");
            		$("[id=dot-sec1]").attr("style", "background-color:green;");
            		$("[id=dot-sec2]").attr("title", "Completed");
            		$("[id=dot-sec2]").attr("style", "background-color:green;");
            		$("[id=dot-sec3]").attr("title", "In Progress");
            		$("[id=dot-sec3]").attr("style", "background-color:yellow;");
            		$("[id=dot-sec4]").attr("title", "Pending");
            		$("[id=dot-sec4]").attr("style", "background-color:red;"); 
            		$("[id=progressSummary]").text("Send Procurement Team Shortlist to Project Manager");
            	}
            	if(data.status === 310){
            		$('[id=pendingApproval]').html("");	
            		$('[id=headingOne1link]').attr("href","#collapseOne1");
            		$('[id=headingTwo2link]').attr("href","#collapseTwo2");
            		$('[id=headingThree3link]').attr("href","#collapseThree3");
            		$('[id=headingFour4link]').attr("href","");
            		
            		$("[id=dot-sec1]").attr("title", "Completed");
            		$("[id=dot-sec1]").attr("style", "background-color:green;");
            		$("[id=dot-sec2]").attr("title", "Completed");
            		$("[id=dot-sec2]").attr("style", "background-color:green;");
            		$("[id=dot-sec3]").attr("title", "Pending");
            		$("[id=dot-sec3]").attr("style", "background-color:orange;");
            		$("[id=dot-sec4]").attr("title", "Pending");
            		$("[id=dot-sec4]").attr("style", "background-color:red;"); 
            		$("[id=progressSummary]").text("Sent to Project Manager for approval");
            		
            		// Hide button after sending to PM for approval
            		$("[id=pmApproval]").hide();
            		
            		// Show icon for message sent
            		$('[id=pendingApproval]').append('<img src="https://img.icons8.com/office/40/000000/outbox.png">Sent')
            		//$('[id=pendingApproval]').append('<img src="https://img.icons8.com/ultraviolet/40/000000/reading-confirmation.png">Received')
            		//$('[id=pendingApproval]').append('<img src="https://img.icons8.com/ios/50/000000/data-pending.png">Pending')
            		//$('[id=pendingApproval]').append('<img src="https://img.icons8.com/ultraviolet/40/000000/ok.png">Approved');
            	}
            	if(data.status === 320){
            		$("[id=pmApproval]").hide();
            		$('[id=pendingApproval]').html("");
            		$('[id=headingOne1link]').attr("href","#collapseOne1");
            		$('[id=headingTwo2link]').attr("href","#collapseTwo2");
            		$('[id=headingThree3link]').attr("href","#collapseThree3");
            		$('[id=headingFour4link]').attr("href","");
            		
            		$("[id=dot-sec1]").attr("title", "Completed");
            		$("[id=dot-sec1]").attr("style", "background-color:green;");
            		$("[id=dot-sec2]").attr("title", "Completed");
            		$("[id=dot-sec2]").attr("style", "background-color:green;");
            		$("[id=dot-sec3]").attr("title", "Pending");
            		$("[id=dot-sec3]").attr("style", "background-color:orange;");
            		$("[id=dot-sec4]").attr("title", "Pending");
            		$("[id=dot-sec4]").attr("style", "background-color:red;"); 
            		$("[id=progressSummary]").text("Received by Project Manager<br>Pending approval");
            		
            		// Show icon for message read
            		$('[id=pendingApproval]').append('<img src="https://img.icons8.com/ultraviolet/40/000000/reading-confirmation.png">Received')
            	}
            	if(data.status === 321){
            		$("[id=pmApproval]").hide();
            		$('[id=pendingApproval]').html("");
            		$('[id=headingOne1link]').attr("href","#collapseOne1");
            		$('[id=headingTwo2link]').attr("href","#collapseTwo2");
            		$('[id=headingThree3link]').attr("href","#collapseThree3");
            		$('[id=headingFour4link]').attr("href","");
            		
            		$("[id=dot-sec1]").attr("title", "Declined");
            		$("[id=dot-sec1]").attr("style", "background-color:red;");
            		$("[id=dot-sec2]").attr("title", "Declined");
            		$("[id=dot-sec2]").attr("style", "background-color:red;");
            		$("[id=dot-sec3]").attr("title", "Declined");
            		$("[id=dot-sec3]").attr("style", "background-color:red;");
            		$("[id=dot-sec4]").attr("title", "Declined");
            		$("[id=dot-sec4]").attr("style", "background-color:red;");
            		$("[id=progressSummary]").text("Request has been declined by the Project Manager");
            		
            		// Show icon for Pending approval
            		$('[id=pendingApproval]').append('<img src="https://img.icons8.com/ios/50/000000/data-pending.png">Pending')
            	}
            	if(data.status === 322){
            		$("[id=pmApproval]").hide();
            		$('[id=pendingApproval]').html("");
            		$('[id=headingOne1link]').attr("href","#collapseOne1");
            		$('[id=headingTwo2link]').attr("href","#collapseTwo2");
            		$('[id=headingThree3link]').attr("href","#collapseThree3");
            		$('[id=headingFour4link]').attr("href","#collapseFour4");
            		
            		$("[id=dot-sec1]").attr("title", "Completed");
            		$("[id=dot-sec1]").attr("style", "background-color:green;");
            		$("[id=dot-sec2]").attr("title", "Completed");
            		$("[id=dot-sec2]").attr("style", "background-color:green;");
            		$("[id=dot-sec3]").attr("title", "Completed");
            		$("[id=dot-sec3]").attr("style", "background-color:green;");
            		$("[id=dot-sec4]").attr("title", "Pending");
            		$("[id=dot-sec4]").attr("style", "background-color:yellow;"); 
            		$("[id=progressSummary]").text("Request has been approved by the Project Manager");  
            		
            		// Show icon for Approved
            		$('[id=pendingApproval]').append('<img src="https://img.icons8.com/ultraviolet/40/000000/ok.png">Approved');
            	}
            	if(data.status === 330){
            		$('[id=pendingApproval]').html("");	 
            		$('[id=headingOne1link]').attr("href","#collapseOne1");
            		$('[id=headingTwo2link]').attr("href","#collapseTwo2");
            		$('[id=headingThree3link]').attr("href","#collapseThree3");
            		$('[id=headingFour4link]').attr("href","#collapseFour4");
            		
            		$("[id=dot-sec1]").attr("title", "Completed");
            		$("[id=dot-sec1]").attr("style", "background-color:green;");
            		$("[id=dot-sec2]").attr("title", "Completed");
            		$("[id=dot-sec2]").attr("style", "background-color:green;");
            		$("[id=dot-sec3]").attr("title", "Completed");
            		$("[id=dot-sec3]").attr("style", "background-color:green;");
            		$("[id=dot-sec4]").attr("title", "Pending");
            		$("[id=dot-sec4]").attr("style", "background-color:green;"); 
            		$("[id=progressSummary]").text("Training schedule has been submitted");
            	}
            	
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) { 
                alert("Status: " + textStatus); alert("Error: " + errorThrown); 
            }   
		});
	}
	
	// Section 1 accordion
	function section1(id) {
		$("#vendorSPOC").find("tr:gt(0)").remove();
		$.ajax({
        	type: "POST",
        	data: {id: id},
            url : 'section1',
            success : function(data) {
            	//$("#th1").show();
             	$('[id=table-body1]').html("");
            	for(var i = 0; i < data.length; i++){
    				var shortlistSPOC = data[i];
            		var tr = '<tr><td><input class="SPOCchckbx form-check-input" type="checkbox" onchange="SPOCchkbx(this,'+id+')" name="'+shortlistSPOC.vendor_name+'" id="'+shortlistSPOC.vendor_id+'"/></td><td>' + shortlistSPOC.vendor_name +  '</td><td>' + shortlistSPOC.vendor_phone +  '</td><td>' + shortlistSPOC.vendor_email +  '</td><td>' + shortlistSPOC.vendor_city +  '</td><td>' + shortlistSPOC.vendor_state +  '</td></tr>';
            		$('[id=table-body1]').append(tr);
            	}      	
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) { 
                alert("Status: " + textStatus); alert("Error: " + errorThrown); 
            }   
		});
	}
	
	$('#PTApprovedLink').tooltip();
	$('#VMLink').tooltip();
	$('[id^=logtooltip]').tooltip();
	$('[id=modalIcons]').tooltip();

	
	function SPOCchkbx(checkboxElem, id) {
		console.log('The vendor training request id is: ' + id);
		var checkedIds = $(".SPOCchckbx:checked").map(function() {
		    return this.id;
		    }).toArray();
		
		console.log('The checked ids are: ' + checkedIds);
		
		var checkedNames = $(".SPOCchckbx:checked").map(function() {
		    return this.name;
		    }).toArray();
		
		console.log('The checked names are: ' + checkedNames);
		
    	var xx = "Click to move " + checkedNames.join(", ") + " to PT shortlist";
    	//$('#PTApprovedLink').attr("data-original-title", xx);
    	$('[id=PTApprovedLink]').attr("data-original-title", xx);

    	//console.log('')
    	var yy = "vendor/PTApproved/" + id +"/" + checkedIds.join(",");
    	//$('#PTApprovedLink').attr("href", yy);
    	$('[id=PTApprovedLink]').attr("href", yy);

	}
	
	// Section 2 accordion
	function section2(id) {
		$("#vendorPT").find("tr:gt(0)").remove();
		$.ajax({
        	type: "POST",
        	data: {id: id},
            url : 'section2',
            success : function(data) {
            	//$("#th2").show();
            	for(var i = 0; i < data.length; i++){
    				var shortlistPT = data[i];
    				console.log('the shortlist data: ' + shortlistPT.vendor_name);
            		var tr='<tr><td>' + shortlistPT.vendor_name +  '</td><td>' + shortlistPT.vendor_phone +  '</td><td>' + shortlistPT.vendor_email +  '</td><td>' + shortlistPT.vendor_city +  '</td><td>' + shortlistPT.vendor_state +  '</td></tr>';
            		$('#table-body2').append(tr);
            	}       
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) { 
                alert("Status: " + textStatus); alert("Error: " + errorThrown); 
            }   
		});
	}
	
	// Section 4 accordion
	function section4(id) {
		$.ajax({
        	type: "POST",
        	data: {id: id},
            url : 'section4',
            success : function(data) {
				$('#StartDate').val(data.training_start_date);
				$('#EndDate').val(data.training_end_date);
				
				$('#classRoom-city').val(data.training_city);
				$('#classRoom-state').val(data.training_state);
				$('#classRoom-country').val(data.training_country);
				$('#classRoom-zipcode').val(data.training_zipcode);
				$('#classRoom-timezone').val(data.training_time_zone);
				$('#timezone').val(data.training_time_zone);

				$('#classRoom-location').val(data.training_location);
				$('#classRoom-roomNumber').val(data.training_room_number)
				$('#classRoom-breakdown').val(data.training_break_down);
				
				$('#online-URL').val(data.training_url);
				$('#online-audio').val(data.training_phone);
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) { 
                //alert("Status: " + textStatus); alert("Error: " + errorThrown); 
            }   
		});
	}
	
	</script>

	<!-- Yosuf ElSaadany 3/24/2019 10:30pm -->
	<!-- All Ajax Requests -->
	<script>
	
	function logg(id) {
        $.ajax({
           type: "POST",
           data: {id: id},
           url : 'logs',
           success : function(data) {
               console.log(data);
				var table = "<table>";
               for(var i = 0; i < data.length; i++){
                   var log = data[i];
                    var tr = '<tr><td>' + log.description +  '</td><td>' + log.status_change_time +  '</td></tr>';
                    //$('#vendorLogs').append(tr);
                    table += tr;
               }
				table += "</table><br>End of log for: " + log.training_request_id;
				var ttid = "logtooltip-" + id;
              	$("#"+ttid).attr("data-original-title",table);
           }
        });
    }
	
	function logDT(id) {
        $.ajax({
           type: "POST",
           data: {id: id},
           url : 'DTLogs',
           success : function(data) {
               console.log(data);
				var table = "<table>";
               for(var i = 0; i < data.length; i++){
                   var log = data[i];
                    var tr = '<tr><td>' + log.description +  '</td><td>' + log.status_change_time +  '</td></tr>';
                    table += tr;
               }
				table += "</table><br>End of log for: " + log.training_request_id;
				var ttid = "logtooltip-" + id;
              	$("#"+ttid).attr("data-original-title",table);
           }
        });
    }
	
	function ITLog(id) {
        $.ajax({
           type: "POST",
           data: {id: id},
           url : 'ITLogs',
           success : function(data) {
               console.log(data);
				var table = "<table>";
               for(var i = 0; i < data.length; i++){
                   var log = data[i];
                    var tr = '<tr><td>' + log.description +  '</td><td>' + log.status_change_time +  '</td></tr>';
                    table += tr;
               }
				table += "</table><br>End of log for: " + log.training_request_id;
				var ttid = "logtooltip-" + id;
              	$("#"+ttid).attr("data-original-title",table);
           }
        });
    }
	
	// Open IT TEAM JSP Page
	function openItPage(id) {	
		$.ajax({
        	type: "POST",
        	data: {id: id},
            url : 'it',
            success : function(data) {
				window.open('http://localhost:9999/SpringApp/it');
            } 
		});
	}	
	</script>

</body>
</html>