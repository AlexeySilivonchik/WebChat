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

    <title>Welcome to WebChat - Login or Sign up</title>

    <link href="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">        
    <link href="${pageContext.request.contextPath}/css/webchat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/jquery-1.12.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/webchat.js"></script>
</head>

<body style="background-color: #f1f1f1;">	
  	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin: 0px; border: none;">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- <a class="navbar-brand" href="${pageContext.request.contextPath}/">WebChat</a>  -->
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="navTabAnimation">
                        <a href="${pageContext.request.contextPath}/" class="navTab"><fmt:message key="nav.home"/></a>
                        <span class="anime"></span>
                    </li>
                    <li class="navTabAnimation">
                        <a href="${pageContext.request.contextPath}/about" class="navTab"><fmt:message key="nav.about"/></a>
                        <span class="anime"></span>
                    </li>
                </ul>                          			 
                
                <ul class="nav navbar-nav navbar-right" role="navigation">       				 
        			<li class="dropdown">
          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="nav.language"/><span class="caret"></span></a>
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
            		<div class=col-md-8>            		
            			<h2 style="padding-top:40px; padding-bottom: 40px;"><strong><fmt:message key="home.body.welcome.label1"/></strong></h2>	
            			<p style="font-size: 16pt;"><fmt:message key="home.body.welcome.label2"/></p>
            		</div>
            		
            		<div class="col-md-4 pull-right" style="padding-top:40px;">
            			<div class="well" style="background-color: white;">
            				<form action="${pageContext.request.contextPath}/login" method="post">
  								<div class="form-group">
    								<input type="text" name="user" class="form-control" id="exampleInputEmai" placeholder="<fmt:message key="home.input.login.username"/>">
  								</div>
  								<div class="form-group">
    								<input type="password" name="pwd" class="form-control" id="exampleInputPasswor" placeholder="<fmt:message key="home.input.login.password"/>">    								
  								</div>    								
  								<div class="from-group">
  									<button type="submit" class="btn btn-default pull-right"><fmt:message key="home.input.login.button"/></button>	
  								</div><br> 						
  									<div class="checkbox">
    									<label>
      										<input type="checkbox"> <fmt:message key="home.input.login.checkbox"/>
    									</label>
  									</div>
							</form>
						</div>
						
						<div class="well" style="background-color: white;">
            				<form>
            					<p style="font-size: 11pt;"><fmt:message key="home.input.signin.label1" var="buttonValue" /> <span style="color: gray;"><fmt:message key="home.input.signin.label2"/></span></p>
            					<hr style="padding: 0px;">
  								<div class="form-group">
    								<input type="email" class="form-control" id="exampleInputEmail1" placeholder="<fmt:message key="home.input.signin.name"/>">
  								</div>
  								<div class="form-group">
    								<input type="email" class="form-control" id="exampleInputEmail1" placeholder="<fmt:message key="home.input.signin.email"/>">
  								</div>
  								<div class="form-group">
    								<input type="password" class="form-control" id="exampleInputPassword1" placeholder="<fmt:message key="home.input.signin.password"/>">
  								</div>  
  								<div style="padding-bottom: 30px;">							
  								<button type="submit" class="btn btn-default pull-right"><fmt:message key="home.input.signin.button"/></button>	</div>
							</form>
						</div>
            		</div>
            	</div>
            	
            	<p style="padding-left: 20px;">&copy; WebChat 2016</p>

            </div>
        </div>
    </div>
</body>

</html>