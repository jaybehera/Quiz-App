<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style><%@include file="/WEB-INF/appcss/index.css"%></style>    
<style><%@include file="/WEB-INF/appcss/quiz.css"%></style>  
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
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap"
	rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>

	<!-- Header component -->
	<%@include file="/html/header.html"%><br>

	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div
					class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
					<div class="card-img-left d-none d-md-flex">
						<!-- Background image for card set in CSS! -->
					</div>
					<div class="card-body p-4 p-sm-5">

						<div id="box">
							<div id="qnBox">1) Just a test question?</div>
							<div id="options">

								<input type="radio" class="options" name="answer" value="a">
								<label>A) Option 1 </label> <br> 
								<input type="radio"class="options" name="answer" value="b"> 
								<label>B) Option 2 </label> <br> 
								<input type="radio" class="options" name="answer" value="c"> 
								<label> C) Option 3 </label> <br>
								<input type="radio" class="options" name="answer" value="d">
								<label> D) Option 4 </label>
							</div>
							<br>

							<button class="btn btn-secondary btn-lg btn1" type="button"
								id="prev" onclick="prevQn()">Previous</button>

							<button class="btn btn-primary btn-lg btn2" type="submit"
								id="submit" onclick="submitQuiz()">Submit</button>

							<button class="btn btn-secondary btn-lg btn3" type="button"
								id="next" onclick="nextQn()">Next</button>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer component -->
	<%@include file="/html/footer.html"%>

	<script>
//convert questions into json
var questions =JSON.parse(`${questions}`);
</script>

	<script src="js/quiz.js">
</script>


	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>


</body>
</html>