<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   -->
<style>
  /* Bootstrap css */
@import "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css";

/* Google Material icons */
@import "http://fonts.googleapis.com/icon?family=Material+Icons";

/* Propeller css */
@import "./bootstrap-datetime-picker/css/propeller.min.css";

/* Bootstrap datetimepicker */
@import "./bootstrap-datetime-picker/css/bootstrap-datetimepicker.css";

/* Propeller datetimepicker */
@import "./bootstrap-datetime-picker/css/pmd-datetimepicker.css";
</style>
<!-- jquery JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Bootstrap js -->
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Propeller textfield js --> 
<script type="text/javascript" src="./bootstrap-datetime-picker/js/propeller.min.js"></script>

<!-- Datepicker moment with locales -->
<script type="text/javascript" language="javascript" src="./bootstrap-datetime-picker/js/moment-with-locales.js"></script>

<!-- Propeller Bootstrap datetimepicker -->
<script type="text/javascript" language="javascript" src="./bootstrap-datetime-picker/js/bootstrap-datetimepicker.js"></script>

</head>
<body>

<div class="container">
  <h2>New Event</h2>
  <form class="form-horizontal" action="addEventProc.jsp">
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">Title : </label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="title" placeholder="Title" name="title">
      </div>
    </div>
    <div class="form-group">
		<div class="row">
			<div class="col-sm-6"> 
				<div class="form-group pmd-textfield pmd-textfield-floating-label">
					<label class="control-label" for="datepicker-start">Start Date</label>
					<!-- <input type="text" class="form-control" id="datepicker-start" > -->
					<input type="datetime-local" class="form-control" name="starttime">
				</div>
			</div>
			<div class="col-sm-6"> 
				<div class="form-group pmd-textfield pmd-textfield-floating-label">
					<label class="control-label" for="datepicker-end">End Date</label>
					<!-- <input type="text" class="form-control" id="datepicker-end" name="endtime"> -->
					<input type="datetime-local" class="form-control" name="endtime">
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="content">Comment</label>
		<textarea class="form-control" rows="5" name="content"></textarea>
	</div>
	
	<div class="custom-file">
	   <input type="file" class="custom-file-input" id="validatedCustomFile" name="mainimg">
	   <label class="custom-file-label" for="validatedCustomFile">Choose image</label>
	</div>
    
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>