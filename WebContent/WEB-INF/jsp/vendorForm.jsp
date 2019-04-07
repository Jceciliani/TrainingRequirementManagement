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
<script src="<c:url value="/resources/js/vendorform.js" />"></script>
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
                <li class="nav-item"><a class="nav-link" style="color: white;" href="#">Run
                        Report</a></li>
                <li class="nav-item"><a class="nav-link"style="color:white" href="#">Vendor
                        Management</a></li>
                <li class="nav-item dropdown"><a
                    class="nav-link dropdown-toggle" style="color:white" href="#" id="navbarDropdown"
                    role="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false"> <i class="fas fa-user-circle"
                        style="float: none;"></i> ${userid}
                </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <span class="dropdown-item">Welcome, SPOC</span> <span
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
   
    <div class="vendor-add-pg">
        <a href="vendormanagement/0"><button type="button"
                class="btn btn-primary" id="return-btn" style="margin-left: 120px;">Return</button></a> &nbsp;
        <div class="container">
            <h3>Add a New Vendor Account</h3>
            <form method="post" id="va-form" action="insertVendor" >
                <div class="form-group">
                    <label>Vendor Name</label><label id="nameError" style="color: red; float: right; display: none;">Name cannot be empty and must be between 1 and 20 characters.</label> <input type="text" class="form-control"
                        id="nameForm" placeholder="Enter Vendor name" name="v-name" path="vname" />
                    
                </div>
                <div class="form-group">
                    <label>Vendor Phone Number</label><label id="phoneError" style="color: red; float: right; display: none;">Phone number must be 9 or 10 digits.</label> <input type="text"
                        class="form-control input-medium bfh-phone" id="phoneForm"
                        data-format="+1 (ddd) ddd-dddd"
                        placeholder="Enter Vendor phone number" name="v-phone">
                </div>
                <div class="form-group">
                    <label>Vendor Email Address</label><label id="emailError" style="color: red; float: right; display: none;">Invalid email format.</label> <input type="text"
                        class="form-control" id="emailForm"
                        placeholder="Enter Vendor email" name="v-email">
                </div>
                <div class="form-group">
                    <label>Vendor City</label><label id="cityError" style="color: red; float: right; display: none;">Field cannot be empty.</label> <input type="text" class="form-control"
                        id="cityForm" placeholder="Enter Vendor City" name="v-city">
                </div>
                <div class="form-group">
                    <label>Vendor State</label><label id="stateError" style="color: red; float: right; display: none;">Field cannot be empty.</label> <input type="text" class="form-control"
                        id="stateForm" placeholder="Enter Vendor State" name="v-state">
                </div>
                <div class="form-group">
                    <label>Vendor Country</label><label id="countryError" style="color: red; float: right; display: none;">Field cannot be empty.</label> <input type="text"
                        class="form-control" id="countryForm"
                        placeholder="Enter Vendor Country" name="v-country">
                </div>
                <div class="form-group">
                    <label>Vendor Zipcode</label><label id="zipError" style="color: red; float: right; display: none;">Must be 5 digits.</label> <input type="number"
                        class="form-control" id="zipForm" placeholder="Enter Vendor Zip"
                        name="v-zipcode">
                </div>
                <div class="form-group">
                    <label>Vendor Time Zone</label><label id="timezoneError" style="color: red; float: right; display: none;">Field cannot be empty.</label> <input type="text"
                        class="form-control" id="timezoneForm"
                        placeholder="Enter Vendor Time Zone" name="v-timezone">
                </div>
                <br>
            </form>
                 <div style="text-align: center; margin-bottom: 2vh;">
                    <div type="button" id="submit-btn" class="btn btn-success">Submit</div>
                </div>
        </div>
    </div>
    
    
    
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
</body>
</html>