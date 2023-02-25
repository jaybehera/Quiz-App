<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style><%@include file="/WEB-INF/css/bootstrap.min.css"%></style>
<style><%@include file="/WEB-INF/appcss/index.css"%></style>    
<%-- <style><%@include file="/WEB-INF/appcss/signup.css"%></style>    
 --%>
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
<title>Insert title here</title>
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
            <h5 class="card-title text-center mb-5 fw-light fs-5">Register</h5>
            
            <form method="post" action="register" class="register-form" id="signup-form">

              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="username" name="username" placeholder="myusername" required autofocus>
                <label for="floatingInputUsername">Username</label>
              </div>

              <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
                <label for="floatingInputEmail">Email address</label>
              </div>

              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                <label for="floatingPassword">Password</label>
              </div>

              <div class="d-grid mb-2">
                <button class="btn btn-lg btn-primary btn-login fw-bold text-uppercase" type="submit">Register</button>
              </div>

              <a class="d-block text-center mt-2 small" href="/QuizApp/login.jsp">Have an account? Sign In</a>

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
		 alert("Congrats!! account created successfully"); 
		}
	</script>

</body>
</html>