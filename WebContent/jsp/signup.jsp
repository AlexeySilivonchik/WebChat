<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="text" />
<!DOCTYPE html>
<html lang="${language}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sign up for WebChat</title>

    <link href="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">        
    <link href="${pageContext.request.contextPath}/css/webchat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/jquery-1.12.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/webchat.js"></script>
</head>

<body>	
  	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin: 0px; border: none; background: linear-gradient(to right, #469ef7, #31f785);border-bottom:1px double gray;">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" style="position:absolute; left:50%;">
                    <li class="navTabAnimation">
                        <a href="${pageContext.request.contextPath}/" class="navTab"><fmt:message key="nav.home"/></a>
                        <span class="anime"></span>
                    </li>
                </ul>  
                
                <ul class="nav navbar-nav navbar-right" role="navigation">       				 
        			<li class="dropdown">
          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: white;">Have an account? Log in<span class="caret"></span></a>
          				<ul class="dropdown-menu" style="padding: 20px;">
            				<li style="width:250px;">
            					<form action="${pageContext.request.contextPath}/login" method="post">
            						<p>Have an account?</p>
  									<div class="form-group">
    									<input type="text" name="user" class="form-control" id="loginInputName" placeholder="<fmt:message key="home.input.login.username"/>">
  									</div>
  									<div class="form-group">
    									<input type="password" name="pwd" class="form-control" id="loginInputPassword" placeholder="<fmt:message key="home.input.login.password"/>">    								
  									</div>    								
  									<div class="from-group">
  										<button type="submit" class="btn btn-primary pull-left" style="margin-bottom: 10px;"><fmt:message key="home.input.login.button"/></button>	
  									</div><br> 						
  									<div class="checkbox">
    									<label>
      										<input type="checkbox"> <fmt:message key="home.input.login.checkbox"/> · <a href="#">Forgot password?</a>
    									</label>
  									</div>
								</form>
								
								<hr style="margin-top: 0px; margin-bottom:10px;">
								
								<form action="${pageContext.request.contextPath}/signup" method="post">
									<p>New to WebChat?</p>
									<div class="form-group" hidden="true">
    									<input class="form-control" id="registerInputName" name="registerInputName" placeholder="<fmt:message key="home.input.signin.name"/>">
  									</div>
  									<div class="form-group" hidden="true">
    									<input type="email" class="form-control" id="registerInputEmail" name="registerInputEmail" placeholder="<fmt:message key="home.input.signin.email"/>">
  									</div>
  									<div class="form-group" hidden="true">
    									<input type="password" class="form-control" id="registerInputPassword" name="registerInputPassword" placeholder="<fmt:message key="home.input.signin.password"/>">
  									</div>  
									<div class="from-group">
  										<button type="submit" class="btn" style="background-color:lightgray; width:100%;">Sign up</button>	
  									</div><br> 	
								</form>
            				</li>
          				</ul>
        			</li>
      			</ul>	             			 
                
                <ul class="nav navbar-nav navbar-right" role="navigation">       				 
        			<li class="dropdown">
          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: white;"><fmt:message key="nav.language"/><span class="caret"></span></a>
          				<ul class="dropdown-menu" >
            				<li><a href="?language=en">English</a></li>
            				<li><a href="?language=ru">Русский</a></li>
          				</ul>
        			</li>
      			</ul>			
				
            </div>      
        </div>
    </nav>

    <div class="container">    	   
        <div class="row">
            <div class="col-md-12">        	           
            	<div class="row">          
            		<form action="${pageContext.request.contextPath}/signup" method="POST">		            		
            			<div class="col-md-4 col-md-offset-4" style="padding-top:40px;">						
							<h3>Join WebChat today.</h3>
            			
  							<div class="form-group" style="margin-top:30px;">
    							<input class="form-control" style="height:40px;" id="registerName" name="registerInputName" placeholder="<fmt:message key="home.input.signin.name"/>">
  							</div>
  						</div>
  					
  						<div class="col-md-1" style="padding-top:125px;padding-left:0px;">
            				<div id="registerNameOk" hidden="true"><span class = "col-md-1 glyphicon glyphicon-ok" aria-hidden = "true" style="display: block; padding-right: 30px; color:#66afe9;" ></span></div>
            				<div id="registerNameRemove" hidden="true"><span class = "col-md-1 glyphicon glyphicon-remove" aria-hidden = "true" style="display: block; padding-right: 30px; color:red;"></span></div>
            			</div>
            		
            			<div class="col-md-4 col-md-offset-4">	
  							<div class="form-group" style="margin-top:30px;">
    							<input type="email" class="form-control" style="height:40px;" id="registerEmail" name="registerInputEmail" placeholder="<fmt:message key="home.input.signin.email"/>">
  							</div>  							
  						</div>
  					
  						<div class="col-md-1" style="padding-left:0px;margin-top:35px;">
            				<div id="registerEmailOk" hidden="true"><span class = "col-md-1 glyphicon glyphicon-ok" aria-hidden = "true" style="display: block; padding-right: 30px; color:#66afe9;" ></span></div>
            				<div id="registerEmailRemove" hidden="true"><span class = "col-md-1 glyphicon glyphicon-remove" aria-hidden = "true" style="display: block; padding-right: 30px; color:red;"></span></div>
            			</div>
            		
            			<div class="col-md-4 col-md-offset-4">
  							<div class="form-group" style="margin-top:30px;">
    							<input type="password" class="form-control" style="height:40px;" id="registerPassword" name="registerInputPassword" placeholder="<fmt:message key="home.input.signin.password"/>">
  							</div>    							
  						</div>
  					
  						<div class="col-md-1" style="padding-left:0px;margin-top:35px;">
            				<div id="registerPasswordOk" hidden="true"><span class = "col-md-1 glyphicon glyphicon-ok" aria-hidden = "true" style="display: block; padding-right: 30px; color:#66afe9;" ></span></div>
            				<div id="registerPasswordRemove" hidden="true"><span class = "col-md-1 glyphicon glyphicon-remove" aria-hidden = "true" style="display: block; padding-right: 30px; color:red;"></span></div>
            			</div>
            		
            			<div class="col-md-4 col-md-offset-4">
  							<div class="form-group" style="margin-top:30px;">			
  							  	<button type="submit" class="btn btn-primary" style="width: 100%;height:40px;"><fmt:message key="home.input.signin.button"/></button>
  							</div>						
						</div>            		
            		</form>          		      		
            	</div>            	
            </div>
        </div>
    </div>
</body>

</html>