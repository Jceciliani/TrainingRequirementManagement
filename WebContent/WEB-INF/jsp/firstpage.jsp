<%@page import="trm.vt.dao.employee.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page
	import="trm.vt.dao.trainingRequest.*,java.util.*,
				java.util.ArrayList,
				java.util.List,
				org.springframework.context.ApplicationContext,
				org.springframework.context.support.ClassPathXmlApplicationContext,
				org.springframework.jdbc.core.JdbcTemplate,
				org.springframework.jdbc.core.RowMapper,
				trm.vt.dao.trainingRequest.TrainingRequestMapper,
				trm.vt.dao.trainingRequest.TrainingRequest,
				java.io.File, java.io.FileNotFoundException,
				java.io.FileReader,java.io.FileWriter,
				java.io.IOException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TRM</title>
<link rel="icon" href="<c:url value="/resources/img/trm cropped.png" />">


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>


<link
	href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link href='<c:url value="/resources/css/temp.css" />' rel="stylesheet">
<link href='<c:url value="/resources/css/drop.css" />' rel="stylesheet">

<script src="<c:url value="/resources/js/landing.js" />"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

</head>
<body>

	<nav class="main-header navbar navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #3c8dbc">
	<div class="container">
		<a class="navbar-brand" href="#"> <img height="50"
			style="margin-top: -6px"
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
					type="search" id="search" aria-label="Search"
					style="color: black; border-radius: 15px; border: #fff 2px solid; background-color: white; padding-top: 2px; padding-bottom: 3px; margin-right: 95px; padding-right: 95px"
					placeholder="  Filter..." /></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" style="color: white;" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-user-circle"
						style="float: none;"></i> ${username}
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<span class="dropdown-item">Welcome, <em>${manager.first_name}
								${manager.last_name }</em></span> <span class="dropdown-item">Your
							Vertical: &nbsp;<em>${manager.vertical}</em>
						</span>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href='/SpringApp/logout'> <b
							style="color: tomato">Logout</b>
						</a>
					</div></li>
			</ul>
		</div>
	</div>
	</nav>

	<c:set var="errormsg" value="${errMesTrainReqModel}" />
	<script>
		if ("${errormsg}" !== "Your request has been submitted!" && /.CreateRequestModal$/.test(window.location.href)) {

                //$('#CreateRequestModal').modal('show');
                //alert("${errMesTrainReqModel}");
                Swal.fire({
				  position: 'center',
				  type: 'error',
				  html: '${errormsg}',
				  title: 'Form Error Occurred',
				});

        }
		</script>
	<div id="message" class="d-none">View Processed Requests</div>

	<!--MAIN CONTAINER FOR THE PAGE BELOW NAV BAR-->
	<div id="mainContainer" style="margin-top: 50px;"
		class="container-fluid" style="background-color:rgb(185, 184, 184)">
		<div id="buttonRowContainer"
			class="btn_row row card-columns offset-lg-1 col-lg-10"
			style="background: rgb(226, 224, 224);">
			<div>
				<button id="createNewRequest" class="btn btn-primary"
					data-toggle="modal" data-target="#CreateRequestModal">
					<i style="" class="fas fa-plus"></i> New Training Request
				</button>
			</div>
			<div>
				<input type="checkbox" id="mycheck" checked onchange="test()"
					data-offstyle="success" data-toggle="toggle"
					data-off="Processed Requests " data-on="Pending Requests"
					style="white-space: nowrap" data-class="fast"></input>
			</div>
		</div>

		<div id="cardContainer" class="row offset-lg-1 col-lg-10 my-contain"
			style="min-height: 70vh; display: flex; background: rgb(226, 224, 224);">

			<!--Cards-->

			<c:forEach var="card" items="${Cards}">
				<div class="col-sm-4 my-card" id="${card.training_request_id}">
					<script>
				statpop(${card.status.status},${card.training_request_id});
			</script>
					<div class="card border">
						<div class="card-body">
							<ul class="list-group list-group-flush my-list-group">
								<li class="list-group-item">
									<h5>Request ID: ${card.training_request_id}</h5>
									<h6>Request Date: ${card.date_requested }</h6>
								</li>
								<li class="list-group-item">
									<table>
										<tr>
											<td class="first-td"><i
												class="fas fa-chalkboard-teacher my-teach"
												aria-hidden="true"></i></td>
											<td width="100%">${card.request_training_module}</td>
											<td nowrap><button data-html="true" type="button"
													title="Module" data-toggle="popover"
													class="btn btn-sm btn-light pull-right moduleDetails my-fa"
													data-content="Training Exec Type: ${card.request_training_type }<br>Scope: ${ card.request_training_module_scope}<br> Training Mode: ${card.request_training_mode }<br><button class='btn btn-primary btn-sm pull-right' data-toggle='modal' data-target='#UpdateModule${card.training_request_id }'>Update</button>">
													<i class="fa fa-ellipsis-h "></i>
												</button></td>
										</tr>
										<tr>
											<td class="first-td"><i
												class="fas fa-calendar-alt my-cal" aria-hidden="true"></i></td>
											<td>${card.start_date }</td>
										</tr>
										<tr>
											<td class="first-td"><i class="fas fa-users my-ppl"
												aria-hidden="true"></i></td>
											<td>${card.request_approx_participant }</td>
										</tr>
										<tr>
											<td class="first-td"><i
												class="fas fa-address-card my-address" aria-hidden="true"></i></td>
											<td width="100%">${card.spoc.last_name },
												${card.spoc.first_name }</td>
											<td nowrap><button data-html="true" type="button"
													class="btn btn-sm btn-light pull-right spocDetails my-fa"
													data-content="Vertical: ${card.vertical }<br>Email: ${card.spoc.email }<br>Phone Number: ${card.spoc.phone_number }<br>Location: ${card.spoc.city }, ${card.spoc.state }"
													data-toggle="popover">
													<i class="fa fa-ellipsis-h"></i>
												</button></td>
										</tr>
										<tr>
											<td class="first-td"><i
												class="fas fa-map-marker-alt my-pin" aria-hidden="true"></i></td>
											<td>${card.request_location }</td>
										</tr>
									</table>
								</li>

								<li class="list-group-item my-list">
									<!-- Status hover-->
									<button type="button"
										class="btn btn-light pull-right status my-fa ${card.status.status }"
										data-html="true" data-toggle="popover"
										data-content="<c:forEach var='log' items='${card.log}'>Description: ${log.description } Status Changed to: ${log.status_changed_to}<br></c:forEach>">
										<i class="fa fa-spinner fa-fw fa-fh"></i>
									</button> <!-- Details Button-->
									<button data-html="true" type="button"
										class="btn btn-light pull-right expandDetails my-fa"
										data-toggle="popover"
										data-content="Start Date: ${card.start_date }<br>End Date: ${card.end_date }<br>Location: ${card.request_location }<br>Timezone: ${card.request_time_zone }<br> <button data-toggle='modal' data-target='#UpdateDate${card.training_request_id }' class='btn btn-primary btn-sm updatebtn pull-right' >Edit</button> <hr>Justification: ${card.justification_of_request }<br><button class='btn btn-primary btn-sm updatebtn pull-right' data-toggle='modal' data-target='#UpdateDetails${card.training_request_id }'>Edit</button>">
										<i class="fa fa-bars fa-fw fa-fh"></i>
									</button>
									<button type="button" data-toggle='modal'
										data-target='#participants${card.training_request_id}'
										class="btn btn-light pull-right">
										<i style="font-size: 10px; text-align: center;"
											class="fas fa-plus"></i><i
											class="fas fa-users my-user-fa fa-fw fa-fh"></i>
									</button>
									<button type="button" data-toggle='modal'
										data-target='#Approval${card.training_request_id}'
										class="btn btn-success approve-btn pull-right">
										<i class="fas fa-check-square fa-fw fa-fh"></i>
									</button>

								</li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Update Module Modal -->
				<div id="UpdateModule${card.training_request_id }"
					class="modal fade">
					<div class="modal-dialog modal-md" role="document">
						<div class="modal-content">
							<div class="modal-header" style="background-color: #3c8dbc">
								<h5 class="modal-title" id="exampleModalLabel">Update
									Module Details</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="updateModule/${card.status.status}"
									id="updateModule${card.training_request_id }"
									onsubmit="submit.disabled = true; return true;">
									<div class="form-group">
										<input type="hidden" name="training_id"
											value="${card.training_request_id}"></input> <label
											for="module">Training Module:</label> <select
											class="form-control philoutside${card.status.status}"
											name="module" id="saturn">
											<option>Java FSD</option>
											<option>.Net</option>
											<option>Cisco CCNA</option>
											<option>Azure</option>
											<option>Python</option>
											<option>Front End</option>
											<option>Mobile</option>
											<option>Spring MVC</option>
											<option>Spring Boot</option>
											<!-- for javaFSD -->
											<option>Net Core</option>
											<option>Net Framework</option>
											<option>MVC5</option>
											<!-- Net -->
											<option>Azure</option>
											<option>Machine Learning</option>
											<!-- Azure -->
											<option>Numpy</option>
											<option>TensorFlow</option>
											<!-- Python -->
											<option>Bootstrap</option>
											<!-- Front end -->
											<option>Spring Mobile</option>
											<!-- Mobile -->
											<option>Other</option>
										</select>
									</div>
									<div id="otherinput2${card.status.status}"
										class="form-group d-none otherinput2">
										<label for="updateother">Please Specify Module</label> <input
											class="form-control" type="text" name="updateother"
											placeholder="Module Name" />
									</div>
									<div class="form-group">
										<label for="type">Training Type:</label> <select
											class="form-control" name="type">
											<option>IT</option>
											<option>VTT</option>
											<option>DT</option>
										</select>
									</div>
									<div class="form-group">
										<label for="scope">Module Scope</label>
										<textarea class="form-control" id="scope" name="scope"
											rows="3" placeholder="Enter here"></textarea>
									</div>
									<div class="form-group">
										<label for="mode">Training Module Mode:</label> <select
											class="form-control" name="mode">
											<option>Classroom</option>
											<option>eLearning</option>
											<option>Video</option>
											<option>Other</option>
										</select>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" name="submit"
									class="btn btn-outline-primary"
									form="updateModule${card.training_request_id }">Submit</button>
							</div>
						</div>
					</div>
				</div>
				<script>
		$(".philoutside${card.status.status}").change(function(){
			var select = $(".philoutside${card.status.status}").val();
			//alert(select);
			if (select === "Other") {
				//alert("in other");
				$("#otherinput2${card.status.status}").removeClass("d-none");
			}
			else {
				//alert("not in other");
				$("#otherinput2${card.status.status}").addClass("d-none");
			}
		});
		</script>
				<!-- update details modal -->
				<div id="UpdateDetails${card.training_request_id }"
					class="modal fade">
					<div class="modal-dialog modal-md" role="document">
						<div class="modal-content">
							<div class="modal-header" style="background-color: #3c8dbc">
								<h5 class="modal-title" id="exampleModalLabel">Number of
									Participants/Justification</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="updateNewDetail/${card.status.status}"
									id="updateComments${card.training_request_id }"
									onsubmit="submit.disabled = true; return true;">
									<input type="hidden" name="training_request_id"
										value="${card.training_request_id }" /> Justification: <input
										class="form-control" name="justification_of_request"
										value="${card.justification_of_request }" /><br> Number
									of Participants: <input type="number" class="form-control"
										name="request_approx_participant"
										value="${card.request_approx_participant}" /><br>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" name="submit"
									class="btn btn-outline-primary"
									form="updateComments${card.training_request_id }">Submit</button>

							</div>
						</div>
					</div>
				</div>

				<!-- Update Date Form Modal -->
				<div id="UpdateDate${card.training_request_id }" class="modal fade">
					<div class="modal-dialog modal-md" role="document">
						<div class="modal-content">
							<div class="modal-header" style="background-color: #3c8dbc">
								<h5 class="modal-title" id="exampleModalLabel">Update Date
									and Location</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="updateNewDate/${card.status.status}"
									id="updateDate${card.training_request_id }"
									onsubmit="submit.disabled = true; return true;">
									<input type="hidden" name="training_request_id"
										value="${card.training_request_id }" /> Start Date:<input
										class="form-control" type="date" value="${card.start_date }"
										name="start_date" /><br> End Date:<input
										class="form-control" type="date" value="${card.end_date }"
										name="end_date" /><br> Location: <input
										class="form-control" name="request_location"
										value="${card.request_location}" /><br> Timezone: <input
										class="form-control" name="request_time_zone"
										value="${card.request_time_zone}" /><br>
								</form>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" name="submit"
									class="btn btn-outline-primary"
									form="updateDate${card.training_request_id }">Submit</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Approve Modal -->
				<div class="modal fade" id="Approval${card.training_request_id}"
					onsubmit="submit.disabled = true; return true;">
					<div class="modal-dialog modal-md" role="document">
						<div class="modal-content">
							<div class="modal-header" style="background-color: #3c8dbc">
								<h5 class="modal-title" id="exampleModalLabel">Request
									Approval</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="sendApproval/${card.training_request_id}"
									id="subForm/${card.training_request_id}">
									<div class="container col-md-10 text-center">
										<div class="form-group">
											<label for="selection">Approve? Please Provide
												Explanation if Declined</label>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="selection" id="inlineRadio1" value="approve">
												<label class="form-check-label" for="inlineRadio1">Approve</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="selection" id="inlineRadio2" value="decline">
												<label class="form-check-label" for="inlineRadio2">Decline</label>
											</div>
											<br> <br>
										</div>
										<div class="form-group">
											<label for="justification"> Justification </label>
											<textarea class="form-control" id="justification"
												name="justification" rows="3" placeholder="Enter here"></textarea>
										</div>
									</div>
								</form>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" name="submit"
									class="btn btn-outline-primary"
									form="subForm/${card.training_request_id}">Submit</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="participants${card.training_request_id}"
					role="dialog" name="participants${card.training_request_id}">
					<div class="modal-dialog" style="max-width: 70%;">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header"
								style="background-color: #3c8dbc; color: white">

								<h4 class="modal-title">Add Employees to Training</h4>
							</div>
							<div class="modal-body" style="height: 320px;">
								<br>
								<div>
									<form action="insertNewTRequest" autocomplete="off"
										class="emoform">
										<input type="hidden" value="${card.training_request_id}"
											name="training_session_attended" />
										<div style="position: absolute; display: inline-block;">
											Employee Id <input id="myInput${card.training_request_id }"
												style="padding: 5px; border-right-width: 50px;" required
												type="text" name="participant_employee_id">
										</div>

										<div style="display: inline-block;">
											<button class="btn btn-primary" id="reloader" type="submit"
												style="width: 178px; height: 26px; padding-left: 6px; margin-left: 377px; margin-top: 20px; background-color: #3c8dbc; color: white; padding-top: 3px; margin-right: 0px;">Insert</button>
										</div>


									</form>
								</div>
								<br>
								<div>
									<table class="table table-striped"
										style="overflow: scroll; max-height: 600px;">
										<thead class="thead-dark"
											style="background-color: rgb(220, 220, 220)">
											<tr>
												<td>Remove</td>
												<td>Employee Id</td>
												<td>Training Id</td>
												<td>First Name</td>
												<td>Last Name</td>
												<td>Email</td>
												<td>Phone Number</td>
											</tr>
										</thead>

										<c:forEach var="pro" items="${participants}">
											<c:if
												test="${card.training_request_id == pro.training_session_id}">
												<tr>
													<td><form action="RemoveParticipant">
															<input type="hidden" value="${card.training_request_id}"
																name="trid" /> <input type="hidden"
																value="${pro.employee_id}" name="eid" />
															<button type="submit" class="btn btn-danger btn-sm "
																style="display: block; margin: auto;">X</button>
														</form></td>
													<td>${pro.employee_id}</td>
													<td>${pro.training_session_id}</td>
													<td>${pro.first_name}</td>
													<td>${pro.last_name}</td>
													<td>${pro.email}</td>
													<td>${pro.phone_number}</td>
												</tr>
											</c:if>
										</c:forEach>


									</table>
								</div>


								<script>

/*An array containing all the country names in the world:*/
 
var names = ${employees};
/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput${card.training_request_id}"), names);
</script>
								<!-- 
        <script type="text/javascript">
        $("#reloader").click(function(){
            $("#content").load(" #content");
        });
        </script>
        
         -->
							</div>

							<div class="modal-footer"></div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>


		<!-- New Request Form Modal -->
		<div class="modal fade" id="CreateRequestModal" tabindex="-1"
			role="dialog" aria-labelledby="CreateRequestModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-md" role="document">
				<div class="modal-content">
					<div class="modal-header" style="background-color: #3c8dbc">
						<h5 class="modal-title" id="exampleModalLabel">Create New
							Request</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container col-lg-12">


							<form id="newR" action="TrainingReq/trainingrequest"
								onsubmit="submit.disabled = true; return true;">
								<div class="form-group">
									<label for="trainingModule">Training Module:</label> <select
										class="form-control" id="sel1" name="trainingModule">
										<option>Java FSD</option>
										<option>.Net</option>
										<option>Cisco CCNA</option>
										<option>Azure</option>
										<option>Python</option>
										<option>Front End</option>
										<option>Mobile</option>
										<option>Spring MVC</option>
										<option>Spring Boot</option>
										<!-- for javaFSD -->
										<option>Net Core</option>
										<option>Net Framework</option>
										<option>MVC5</option>
										<!-- Net -->
										<option>Azure</option>
										<option>Machine Learning</option>
										<!-- Azure -->
										<option>Numpy</option>
										<option>TensorFlow</option>
										<!-- Python -->
										<option>Bootstrap</option>
										<!-- Front end -->
										<option>Spring Mobile</option>
										<!-- Mobile -->
										<option>Other</option>
									</select>
								</div>
								<div id="otherinput" class="form-group d-none">
									<label for="other">Please Specify Module</label> <input
										class="form-control" type="text" name="other"
										placeholder="Module Name" />
								</div>

								<div class="form-group">
									<label for=trainingModuleType>Training Type:</label> <select
										class="form-control" id="sel2" name="trainingModuleType">
										<option>IT</option>
										<option>VTT</option>
										<option>DT</option>
									</select>
								</div>
								<div class="form-group">
									<label for="trainingModuleScope">Training Module Scope:</label>
									<textarea class="form-control" id="scope"
										name="trainingModuleScope" rows="3" placeholder="Enter here"></textarea>
								</div>

								<div class="form-group">
									<label for="trainingModuleMode">Training Module Mode:</label> <select
										class="form-control" id="sel1" name="trainingModuleMode">
										<option>Classroom</option>
										<option>eLearning</option>
										<option>Video</option>
										<option>Other</option>

									</select>
								</div>




								<div class="form-group">
									<label for="startDate">Start Date:</label> <input type="date"
										max="3000-01-01" class="form-control"
										placeholder="Enter Start Date" name="startDate" required>
								</div>
								<div class="form-group">
									<label for="endDate">End Date::</label> <input type="date"
										max="3000-01-01" class="form-control"
										placeholder="Enter End Date" name="endDate" required>
								</div>
								<div class="form-group">
									<label for="spoc">Spoc:</label> <input type="text"
										class="form-control" value="${manager.employee_id }"
										name="spoc" required>
								</div>
								<div class="form-group">
									<label for="participants">Participants:</label> <input min="1"
										max="50" type="number" class="form-control"
										placeholder="Enter # participants" name="participants"
										required>
								</div>
								<div class="form-group">
									<label for="justification">Justification:</label>
									<textarea type="text" class="form-control"
										placeholder=" justification" rows="5" name="justification"
										minlength="20" maxlength="200" required></textarea>
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary"
							data-dismiss="modal">Close</button>
						<button id="createRequestButton" type="submit" name="submit"
							class="btn btn-outline-primary" form="newR">Submit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- new footer -->
	<footer class="py-0"
		style="left:0px;background-color: #3c8dbc; width: 100%; bottom: 0">
	<div class="container">
		<p class="m-0 text-left text-white"
			style="position: relative; top: 10px">Version 0.0.1</p>
		<p class="m-0 text-right text-white"
			style="position: relative; top: -14px">Copyright 2019</p>
	</div>
	</footer>
</body>
</html>