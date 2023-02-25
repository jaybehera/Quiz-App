<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style><%@include file="/WEB-INF/appcss/index.css"%></style>
<%-- <style><%@include file="/WEB-INF/css/bootstrap.min.css"%></style> --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, 
                   initial-scale=1" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous" />
<link rel="stylesheet" href="style.css" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap"
	rel="stylesheet" />
<title>Home</title>


</head>
<body>
<input type="hidden" id="status" value = "<%= request.getAttribute("status") %>">

<!-- Header component -->
<%@include file="/html/header.html"%><br>

<div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
          <div class="card-img-left d-none d-md-flex">
            <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Add a Question</h5>
            
            
            <form method="post" action="addquestion" class="login-form" id="addquestion-form">
              
               <div class="form-floating mb-3">
         
               </div>
               
               <label for="subCode">Select Subject</label>
               <select class="form-select form-select-lg mb-3" id="subCode" name ="subCode" required>
				  <option value="java" selected>Java</option>
				  <option value="cpp">C++</option>
				  <option value="python">Python</option>
				  <option value="html">HTML</option>
				  <option value="react">React</option>
				  <option value="angular">Angular</option>
				</select>
				
               <label for="question">Question</label>
                <textarea class="form-control" id="question"  name="question" maxlength="200" rows="5" required></textarea><br>
                
                <label for="optionA">Option A</label>
                <textarea class="form-control" id="optionA" name="optionA" maxlength="100" rows="2" required></textarea><br>
                <label for="optionB">Option B</label>
                <textarea class="form-control" id="optionB" name="optionB" maxlength="100" rows="2" required></textarea><br>
                <label for="optionC">Option C</label>
               <textarea class="form-control" id="optionC" name="optionC" maxlength="100" rows="2" required></textarea><br>
               <label for="optionD">Option D</label>
               <textarea class="form-control" id="optionD" name="optionD"  maxlength="100" rows="2" required></textarea><br>
               
                <label for="answer">Select Correct Option</label>
               <select class="form-select form-select-lg mb-3" id="answer" name="answer" required>
				  <option value="a" selected>A</option>
				  <option value="b">B</option>
				  <option value="c">C</option>
				  <option value="d">D</option>
				</select>
               

              <div class="d-grid mb-2">
                <button class="btn btn-lg btn-primary btn-login fw-bold text-uppercase" type="submit">Submit</button>
              </div>


              <hr class="my-4">

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

<!-- Footer component -->
<%@include file="/html/footer.html"%>

<!-- Option 1: Bootstrap Bundle with Popper -->
    <script
      src=
"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
      integrity=
"sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
      crossorigin="anonymous"
    ></script>

<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
		 alert("Congrats!! Question added successfully"); 
		}
	</script>
</body>
</html>