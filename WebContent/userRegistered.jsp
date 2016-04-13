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

    <title>${user.name}(@${user.uniqueName}) | WebChat</title>

    <link href="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">     
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/jquery-1.12.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/webchat.css" rel="stylesheet">
    
    <!-- background: "linear-gradient(white 90%, #3366BB 10%)" 
    
    
			$('.navTab').mouseleave(function(){
				$("#anime").animate({ height: "0px" });
				$(this).css('color', '#777');
			});
			
			
			$("#anime").filter(':not(:animated)').animate({ height: "10px" });
			
			$("#anime").animate({ height: "0px" });
			-->
    <script type="text/javascript">
		$(document).ready(function(){
			var letterMaxValue = 140;
			
			$('.navTab').hover(function(){						
				if (!$(this).siblings(".anime").hasClass('animated')) {
					$(this).siblings(".anime").dequeue().stop().animate({ height: "5px" }, 150, 'linear');
				}
				
				$(this).css('color', '#3366BB');
			}, function(){				
				
				$(this).siblings(".anime").animate({ height: "0px" }, 150, 'linear');
				$(this).css('color', '#777');
			});
			
			
    		$('#addMessageInput').focus(function(){     			  			
    			$(this).css('padding-bottom','0px');
    			$('#addMessageIcon').remove();
    			$('#addMessageIconsDiv').attr({
    				hidden: false	
    			});
    		});
    		
    		$('#addMessageInput').blur(function(){
    			$(this).css('padding-bottom','6px');
    			if($(this).val().length == 0){
    				$(this).css('height','40px');
    				$('#addMessageDiv').append('<i id="addMessageIcon" class="addMessageIcon glyphicon glyphicon-camera" style="position: absolute; padding: 10px 8px 6px 8px; right: 0px; cursor: pointer; font-size: 13pt; color:#3366BB;"></i>');
    				$('#addMessageIconsDiv').attr({
        				hidden: true	
        			});
    			}    	    			
    		});
    		
    		$('.addMessageInput').on("input", function () {
    			
    			$(this).height('auto');
				$(this).height(this.scrollHeight);
    			
    			$('.letterCounter').empty();
    			$('.letterCounter').html(letterMaxValue - ($(this).val().length));
    			
    			if(($(this).val().length != 0) && ($('#messageButton').attr('disabled') == 'disabled')){
    				console.log("remove");
    				$('.messageButton').removeAttr('disabled');
    			}
    			
				if(($(this).val().length == 0) && ($(this).attr('disabled') != 'disabled')){
					$('.messageButton').prop("disabled", true);
					console.log("prop");
    			}
    		});

		});
	</script>	
</head>

<body style="background-color: #f6f6f6;">
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin: 0px; border: none;background-color: white;border-bottom:1px double lightgray;">
        <div class="container" style="padding-left: 0px;">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li style="height:60px;">
                        <a href="${pageContext.request.contextPath}/home" class="navTab" style="padding-right:0px;padding-left:0px;padding-bottom:7px;margin-right:15px;margin-left:15px;"><span style="font-size: 14pt;height:80px;"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> <fmt:message key="nav.home"/></span></a>
                        <span class="anime" style="background-color:blue;width:100%;height:0px;"></span>
                    </li>
                    <li style="height:60px;">
                        <a href="#" class="navTab" style="padding-right:0px;padding-left:0px;padding-bottom:7px;margin-right:15px;margin-left:15px;"><span style="font-size: 14pt;"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span> Notifications</span></a>
                    	<span class="anime" style="background-color:blue;width:100%;height:0px;"></span>
                    </li>
                    <li style="height:60px;">
                        <a href="#" class="navTab" style="padding-right:0px;padding-left:0px;padding-bottom:7px;margin-right:15px;margin-left:15px;"><span style="font-size: 14pt;"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Messages</span></a>
                    	<span class="anime" style="background-color:blue;width:100%;height:0px;"></span>
                    </li>
                </ul>
                
     			<form class="navbar-form navbar-right">
        			<button type="button" class="nav navbar-nav navbar-right btn btn-primary" aria-label="Left Align" style="color:#3366BB;" data-toggle="modal" data-target="#messageModal">
        				<span style="color: white;"><span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white; padding-left:5px;"></span> Write message</span>
					</button>
				</form>
    			
    			<form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post">
    			<ul class="nav navbar-nav navbar-right" role="navigation">       				 
        			<li class="dropdown">
          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="padding:0px;margin-top:8px;margin-bottom:10px;"><img alt="Brand" src="${pageContext.request.contextPath}${user.logoURL}" class="img-rounded" style="width: 35px;height:35px;"></a>
          				
          				
          				<ul class="dropdown-menu" >
            				<li><a href="#">${user.name}<br><span style="color:gray; font-size:10pt;">View profile</span></a></li>
            				<li role="separator" class="divider"></li>
            				<li><a href="#"><span style="color:gray; font-size:10pt;">Settings</span></a></li>
            				<li><a href="javascript:$('#logoutForm').submit()"><span style="color:gray; font-size:10pt;">Logout</span></a></li>
          				</ul>
          				
        			</li>
      			</ul>	
      			</form>			
                
                <form class="navbar-form navbar-right" role="search">
  					<div class="form-group" style="position: relative;">
  						<i class="glyphicon glyphicon-search" style="position: absolute; padding: 8px; right: 0px; cursor: pointer; font-size: 13pt;"></i>
    					<input type="text" class="form-control" placeholder="Search" style="border-radius:20px;">
 					</div>
				</form>
            </div>      
        </div>
    </nav>
    
    <div class="modal fade" tabindex="-1" role="dialog" id="messageModal">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        			<h4 class="modal-title" style="text-align:center;">Compose new message</h4>
      			</div>
      			<div class="modal-body" style="padding-bottom:60px;background-color:#e9f5fd;">
        			<form id="messageForm2" action="${pageContext.request.contextPath}/user/addMessage" method="post">
            			<input value="${user.id}" name="userId" hidden="true"/>
            			<input value="${user.uniqueName}" name="userUniqueName" hidden="true"/>
            			
						<div style="position: relative;" id="addMessageDiv2" class="addMessageDiv">
    						<textarea name="addMessageInput" class="addMessageInput form-control" style="padding-right: 30px; overflow: hidden; resize:none; padding-top: 10px; height: 40px;" placeholder="What's happening?" maxlength="140"></textarea>
						</div>
						
						<div class="addMessageIconsDiv" style="padding-right: 15px;">
							<p style="color:#3366BB; font-size: 15pt;"><a href="#"><span class = "col-md-1 glyphicon glyphicon-camera" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a>
        					<a href="#"><span class = "col-md-1 glyphicon glyphicon-map-marker" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a>
        					<a href="#"><span class = "col-md-1 glyphicon glyphicon-film" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a>        					
        					<a href="#"><span class = "col-md-1 glyphicon glyphicon-list-alt" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a></p>
        					
        					<span class = "letterCounter col-md-1 col-md-offset-4" style="display: block;" aria-hidden = "true" id="letterCounter"></span>
        						        					
        					<button type="button" class="messageButton nav navbar-nav navbar-right btn btn-primary" aria-label="Left Align" style="color:#3366BB;" onclick="$('#messageForm2').submit()" disabled>
        						<span style="color: white;"><span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white; padding-left:5px;"></span> Write message</span>
							</button>							
						</div>
					</form>
      			</div>
    		</div><!-- /.modal-content -->
  		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->


    <div class="container">    	   
        <div class="row">
            <div class="col-lg-3" style="padding: 10px 0px 0px 0px; ">                   
            
            	<div style="border-radius: 6px; background-color: white;margin-bottom: 10px;">         
            		
                    <img src="${pageContext.request.contextPath}${user.headerURL}" alt="" style="width:100%; height: 100px;border-radius: 6px 6px 0px 0px;">                	
            
        			<div style="top: 80px; left: 15px; position: absolute; z-index: 1;">
            			<img class="img-thumbnail" style="width:85px; height: 85px;" src="${pageContext.request.contextPath}${user.logoURL}" alt="">
            		</div>	
            	
            		<div style="padding: 10px 0px 0px 110px;">
            			<span style="font-size: 13pt;"><strong><a style="color: black;" href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.name}</a></strong></span>
                    	<span style="color: gray; font-size: 10pt;">@<a style="color: gray;" href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.uniqueName}</a></span>
                    </div>
                    
                    <div class="row">
                    <a href="${pageContext.request.contextPath}/user/${user.uniqueName}">
                    	<span class="col-md-2" style="color:#3366BB; display:block;padding: 10px 0px 10px 30px;">Messages<br>${user.messagesAmount}</span>
                    </a>
                    
                    </div>
                           		            			
            	</div>
            	
            	<div class="well" style="background-color:white;">
                    <h4>Актуальные темы</h4>
                    <a href="#">#sampleTag</a><br>
                    <a href="#">sampleLink</a><br>
                    <a href="#">#sampleTag</a><br>
                    <a href="#">sampleLink</a><br>
                    <a href="#">#sampleTag</a><br>
                    <a href="#">sampleLink</a><br>
                </div>
            </div>
            
            <div class="col-lg-6" style="padding: 0px 10px 0px 10px;">
            	<div class="row" style="border: 1px double lightgray; padding: 10px 5px 10px 5px; margin: 10px 0px 0px 0px; border-radius: 5px 5px 0px 0px; background-color:#e9f5fd;">            	
            		<div class="col-md-2">
            			<img alt="Brand" src="${pageContext.request.contextPath}${user.logoURL}" class="img-responsive img-rounded pull-right" style="width: 35px;height:35px;margin-left:10px;">
            		</div>
            		<div class="col-md-10">
            			<form id="messageForm" action="${pageContext.request.contextPath}/user/addMessage" method="post">
            				<input value="${user.id}" name="userId" hidden="true"/>
            				<input value="${user.uniqueName}" name="userUniqueName" hidden="true"/>
            			
							<div style="position: relative;" id="addMessageDiv" class="addMessageDiv">
    							<i id="addMessageIcon" class="addMessageIcon glyphicon glyphicon-camera" style="position: absolute; padding: 10px 8px 6px 8px; right: 0px; cursor: pointer; font-size: 13pt; color:#3366BB;" onclick="alert('clicked')" ></i>
    							<!-- <input type="text" id="addMessageInput" class="form-control" style="padding-right: 30px;" placeholder="What's happening?" maxlength="140"/> -->
    							<textarea id="addMessageInput" name="addMessageInput" class="addMessageInput form-control" style="padding-right: 30px; overflow: hidden; resize:none; padding-top: 10px; height: 40px;" placeholder="What's happening?" maxlength="140"></textarea>
							</div>
						
							<div id="addMessageIconsDiv" class="addMessageIconsDiv" hidden="true" style="padding-right: 15px;">
								<p style="color:#3366BB; font-size: 15pt;"><a href="#"><span class = "col-md-1 glyphicon glyphicon-camera" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a>
        						<a href="#"><span class = "col-md-1 glyphicon glyphicon-map-marker" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a>
        						<a href="#"><span class = "col-md-1 glyphicon glyphicon-film" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a>        					
        						<a href="#"><span class = "col-md-1 glyphicon glyphicon-list-alt" aria-hidden = "true" style="display: block; padding-right: 30px;"></span></a></p>
        					
        						<span class = "letterCounter col-md-1 col-md-offset-2" style="display: block;" aria-hidden = "true" id="letterCounter"></span>
        						        					
        						<button id="messageButton" type="button" class="messageButton nav navbar-nav navbar-right btn btn-primary" aria-label="Left Align" style="color:#3366BB;" onclick="$('#messageForm').submit()" disabled>
        							<span style="color: white;"><span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white; padding-left:5px;"></span> Write message</span>
								</button>							
							</div>
						</form>
            		</div>            		         		
            	</div>          	
            	            	
            	<c:forEach items="${user.messages}" var="message">
    				<div class="message" style="border: 1px double lightgray; padding: 20px; border-top:none; background-color: white;">
            			<div class="row">
            				<div class="col-md-2">
            					<img class="img-responsive img-rounded" src="${pageContext.request.contextPath}${user.logoURL}" alt="">
            				</div>
            				<div class="col-md-10">
            					<p class="messageLink" style="color: gray;"><strong><a href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.name}</a></strong> @${user.uniqueName} - ${message.createDate}</p>
            					<p>${message.text}</p>
            					
            					<c:choose>
    								<c:when test="${fn:length(message.mediaLinks) == 1}">
      									 <c:forEach items="${message.mediaLinks}" var="media">
            								<img class="img-responsive img-rounded" src="${pageContext.request.contextPath}${media.link}" alt=""><br>
            							</c:forEach>
    								</c:when>    
    								<c:when test="${fn:length(message.mediaLinks) == 2}">
    									<div class="row" style="padding-right: 15px; padding-left: 15px;">
            							 	<div class="col-md-6" style="padding: 0px;">
            							 		<img class="img-responsive img-rounded" style="height: 200px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; padding-right:1px;" src="${pageContext.request.contextPath}${message.mediaLinks[0].link}" alt=""><br>
            							 	</div>
            								<div class="col-md-6" style="padding: 0px;">
            									<img class="img-responsive img-rounded" style="height: 200px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px;" src="${pageContext.request.contextPath}${message.mediaLinks[1].link}" alt=""><br>
            								</div>
            							</div>
    								</c:when>    
    								<c:when test="${fn:length(message.mediaLinks) == 3}">
      									 <div class="row" style="padding-right: 15px; padding-left: 15px;">
            							 	<div class="col-md-7" style="padding: 0px;">
            							 		<img class="img-responsive img-rounded" style="height: 300px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; padding-right:1px;" src="${pageContext.request.contextPath}${message.mediaLinks[0].link}" alt=""><br>
            							 	</div>
            								<div class="col-md-5" style="padding: 0px;">
            									<img class="img-responsive img-rounded" style="height: 150px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-bottom-right-radius: 0px; padding-bottom:1px; width:100%;" src="${pageContext.request.contextPath}${message.mediaLinks[1].link}" alt="">
            									<img class="img-responsive img-rounded" style="height: 150px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-top-right-radius: 0px; padding-top:1px; width:100%;" src="${pageContext.request.contextPath}${message.mediaLinks[2].link}" alt=""><br>
            								</div>
            							</div>
    								</c:when>    
    								<c:when test="${fn:length(message.mediaLinks) > 3}">
      									 <div class="row" style="padding-right: 15px; padding-left: 15px;">
            							 	<div class="col-md-8" style="padding: 0px;">
            							 		<img class="img-responsive img-rounded" style="height: 300px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; padding-right:1px;" src="${pageContext.request.contextPath}${message.mediaLinks[0].link}" alt=""><br>
            							 	</div>
            								<div class="col-md-4" style="padding: 0px;">
            									<img class="img-responsive img-rounded" style="height: 100px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-bottom-right-radius: 0px; padding-bottom:1px; width:100%;" src="${pageContext.request.contextPath}${message.mediaLinks[1].link}" alt="">
            									<img class="img-responsive" style="height: 100px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-top-right-radius: 0px; padding-top:1px; padding-bottom:1px; width:100%;" src="${pageContext.request.contextPath}${message.mediaLinks[2].link}" alt="">
            									<img class="img-responsive img-rounded" style="height: 100px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;padding-left:1px; border-top-right-radius: 0px; padding-top:1px; width:100%;" src="${pageContext.request.contextPath}${message.mediaLinks[2].link}" alt="">
            								</div>
            							</div>
    								</c:when>    
								</c:choose>
            					
            					
            					<div class="row">
            						<div class="col-md-2 messageIcons"><a href="#"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span></a></div>            						
            						<div class="col-md-2 messageIcons retweet"><a href="#"><span class="glyphicon glyphicon-retweet" aria-hidden="true"> <strong>${message.retweets}</strong></span></a></div>
            						<div class="col-md-2 messageIcons like"><a href="#"><span class="glyphicon glyphicon-heart" aria-hidden="true"> <strong>${message.likes}</strong></span></a></div>
            						<div class="col-md-6">
            							
            							<button class="btn dropdown-toggle" type="button" id="menu1" data-toggle="dropdown" style="background-color:white; padding:0px;">
            								<span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="color: gray;"></span>
            							</button>
    									<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
      										<li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/user/deleteMessage?messageId=${message.id}&user=${user.uniqueName}">Delete</a></li>      										
    									</ul>
    									
    								</div>
            				    </div>
            				</div>
            			</div>    
            		</div>
            	</c:forEach>               	
            </div>

            <div class="col-lg-3" style="margin: 10px 0px 0px 0px;padding: 0px;">

                <div class="well" style="background-color:white;margin-bottom:10px;">
                    <h4>Вам также может понравиться</h4>
                    <a href="#">Обновить</a>
                    
                    <c:forEach items="${followingUsers}" var="following" begin="0" end="5">
                    	
                    	<p class="messageLink"><a href="${pageContext.request.contextPath}/user/${following.uniqueName}">
                    		<span class="row" style="cursor: pointer; display: block;" onclick="window.location='#';">
            					<span class="col-md-3">
            						<img style="height:50px; width:50px;" class="img-rounded" src="${pageContext.request.contextPath}${following.logoURL}" alt="">
            					</span>
            					<span class="col-md-9" style="padding-left:5px;">            				
            						<Strong>${following.name}</Strong><br>@${following.uniqueName}
            					</span>
                    		</span><br>
                    	</a></p>

            		</c:forEach>                 
                    
                </div>

				<div class="well" style="background-color:white;">
					<p>Copyright &copy; WebChat 2016</p>
				</div>                              
            </div>
        </div>
    </div>
</body>

</html>