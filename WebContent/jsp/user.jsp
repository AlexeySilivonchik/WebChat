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
    <link href="${pageContext.request.contextPath}/css/webchat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/jquery-1.12.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/webchat.js"></script>
</head>

<body class="user-body">

	<!-- Navigation bar for user with role 'USER'-->
    <c:if test="${sessionScope.userType == 'USER'}">
    	<nav class="navbar navbar-default navbar-static-top navbar-user" role="navigation">
        	<div class="container">            
            	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">            	
                	<ul class="nav navbar-nav nav-animation">
                    	<li>
                        	<a href="${pageContext.request.contextPath}/" class="navTab">
                        		<span><span class="glyphicon glyphicon-home" aria-hidden="true"></span> <fmt:message key="nav.home"/></span>
                        	</a>
                        	<span class="anime"></span>
                    	</li>
                    	<li>
                        	<a href="#" class="navTab">
                        		<span><span class="glyphicon glyphicon-bell" aria-hidden="true"></span> Notifications</span>
                        	</a>
                    		<span class="anime"></span>
                    	</li>
                    	<li>
                        	<a href="#" class="navTab">
                        		<span><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Messages</span>
                        	</a>
                    		<span class="anime"></span>
                    	</li>
                	</ul>
                
     				<form class="navbar-form navbar-right">
        				<button type="button" class="nav navbar-nav navbar-right btn userBackgroundColorScheme" aria-label="Left Align" data-toggle="modal" data-target="#messageModal">
        					<span class="write-message"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Write message</span>
						</button>
					</form>
    			
    				<form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post">
    					<ul class="nav navbar-nav navbar-right" role="navigation">       				 
        					<li class="dropdown user-dropdown">
          						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          							<img alt="Brand" src="${pageContext.request.contextPath}${user.logoURL}" class="img-rounded">
          						</a>
          				         				
          						<ul class="dropdown-menu">
            						<li><a href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.name}<br><span>View profile</span></a></li>
            						<li role="separator" class="divider"></li>
            						<li><a href="#"><span>Settings</span></a></li>
            						<li><a href="javascript:$('#logoutForm').submit()"><span>Logout</span></a></li>
          						</ul>          				
        					</li>
      					</ul>	
      				</form>			
                
                	<form class="navbar-form navbar-right" role="search">
  						<div class="form-group user-search">
  							<i class="glyphicon glyphicon-search"></i>
    						<input type="text" class="form-control" placeholder="Search">
 						</div>
					</form>
            	</div>               	
            </div>
    	</nav>
            	
        <div class="modal fade" tabindex="-1" role="dialog" id="messageModal">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header user-modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        				<h4 class="modal-title">Compose new message</h4>
      				</div>
      				<div class="modal-body user-modal-body">
        				<form id="messageForm2" action="${pageContext.request.contextPath}/user/addMessage" method="post" enctype="multipart/form-data">
            				<input value="${user.id}" name="userId" hidden="true"/>
            				<input value="${user.uniqueName}" name="userUniqueName" hidden="true"/>
            			
							<div id="addMessageDiv2" class="addMessageDiv user-modal-textarea">
    							<textarea name="addMessageInput" class="addMessageInput form-control" placeholder="What's happening?" maxlength="140"></textarea>
							</div>						
						
							<div class="addMessageIconsDiv modal-icons">
								<div id="previewDiv" class="modal-icons-preview" hidden="true">
									<img id="preview" class="img-rounded" src="#" alt="your image"/>
								</div>
						
								<div class="col-md-1 modal-icons-camera">							
									<span class = "glyphicon glyphicon-camera" aria-hidden = "true"></span>
									<input type="file" onchange="previewImage(this);" name="file" id="file" size="1">
								</div>							
							
								<p><!-- <a href="#"><span class = "col-md-1 glyphicon glyphicon-camera" aria-hidden = "true"></span></a> -->
        						<a href="#"><span class = "col-md-1 glyphicon glyphicon-map-marker" aria-hidden = "true"></span></a>
        						<a href="#"><span class = "col-md-1 glyphicon glyphicon-film" aria-hidden = "true"></span></a>        					
        						<a href="#"><span class = "col-md-1 glyphicon glyphicon-list-alt" aria-hidden = "true"></span></a></p>
        					
        						<span class = "letterCounter col-md-1 col-md-offset-4" aria-hidden = "true" id="letterCounter"></span>
        						        					
        						<button type="button" class="messageButton nav navbar-nav navbar-right btn btn-primary" aria-label="Left Align" onclick="$('#messageForm2').submit()" disabled>
        							<span><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Write message</span>
								</button>							
							</div>
						</form>
      				</div>
    			</div>
  			</div>
		</div>
 	</c:if>
            
    <!-- Navigation bar for user with role 'USER'-->
	<c:if test="${sessionScope.userType == 'GUEST'}">
    	<nav class="navbar navbar-default navbar-static-top navbar-guest" role="navigation">
        	<div class="container">        		
            	<div class="navbar-header">
                	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    	<span class="sr-only">Toggle navigation</span>
                    	<span class="icon-bar"></span>
                    	<span class="icon-bar"></span>
                    	<span class="icon-bar"></span>
                	</button>
                	<a class="navbar-brand" href="#">WebChat</a>
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
                               
                	<form class="navbar-form navbar-right" role="search">
  						<div class="form-group user-search">
  							<i class="glyphicon glyphicon-search"></i>
    						<input type="text" class="form-control" placeholder="Search">
 						</div>
					</form>
            	</div>   
            </div>
    	</nav>
	</c:if>            
               
	<header class="user-header">
    	<div class="row">
        	<div class="col-md-12 user-header-image">
            	<img src="${pageContext.request.contextPath}${user.headerURL}" alt="User's header image.">
            </div>
        </div><br>                   
            
    	<div class="container">    	   
        	<div class="row">
        		<div class="col-md-3">
        			<div class="user-header-logo">
            			<img class="img-thumbnail" src="${pageContext.request.contextPath}${user.logoURL}" alt="User's logo image.">
            		</div>		
        		</div>
        			
        		<div class="col-md-6">
        			<div class="row">
        				<p class="user-header-amount"><a href="#"><span class="col-md-2 notEditable">Сообщения<br>${user.messagesAmount}</span></a>
        				<a href="#"><span class="col-md-2 notEditable">Читаемые<br>${user.followingAmount}</span></a>
        				<a href="#"><span class="col-md-2 notEditable">Читатели<br>${user.followersAmount}</span></a>
        				<a href="#"><span class="col-md-2 notEditable">Нравится<br>${user.likesAmount}</span></a>
        				<a href="#"><span class="col-md-2 notEditable">Списки<br></span></a></p>
        			</div>     							  
        		</div>   
        			   			
        		<c:choose>
    				<c:when test="${sessionScope.user == user.uniqueName.toLowerCase()}">
    					<div class="col-md-3 user-profile-buttons">
        					<button id="editProfile" type="button" class="btn btn-default pull-right" aria-label="Left Align">Edit profile</button>        						
        					<button id="editProfileSave" type="button" class="btn btn-primary pull-right" aria-label="Left Align">Save changes</button>
        					<button id="editProfileCancel" type="button" class="btn btn-default pull-right" aria-label="Left Align">Cancel</button>        						
        				</div> 
    				</c:when>    
    				<c:otherwise>
    					<div class="col-md-3 user-profile-buttons">
        					<button id="followButton" type="button" class="btn btn-default pull-right" aria-label="Left Align">
  								<span class="glyphicon glyphicon glyphicon-user" aria-hidden="true"></span>+ Читать
							</button>
        				</div> 
    				</c:otherwise>
				</c:choose>        			   					
       		</div>
    	</div>
    </header>

    <div class="container">    	   
        <div class="row">
            <div id="userInfo" class="col-md-3">
				<h3>
					<a href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.name}</a>
				</h3>
				<h4>@
					<a href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.uniqueName}</a>
				</h4>
				<p>${user.description}</p>
				<h5>
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					${user.address}
				</h5>
				<h5>
					<span class="glyphicon glyphicon-link" aria-hidden="true"></span>
					<a href="${user.site}">${user.site}</a>
				</h5>
				<h5>
					<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
					Registration Date
				</h5>
				<h5>
					<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
					<a href="#">${user.mediaFilesAmount} фото и видео</a>
				</h5>
				<div class="row">
					<c:forEach items="${mediaList}" var="mList">
						<div class="col-md-4">
							<img class="img-responsive img-rounded" src="${pageContext.request.contextPath}/image/${mList.link}" alt="">
						</div>
					</c:forEach>
				</div>
			</div>
            
            <!-- Edit profile form for user with role 'USER'-->
            <c:if test="${sessionScope.user == user.uniqueName.toLowerCase()}">
            	<div id="userEditInfo" class="col-md-3 well">
            		<form id="userEditForm" action="${pageContext.request.contextPath}/editUser" method="POST">
            			<input value="${user.id}" name="userId" hidden="true"/>
            			<input value="${user.uniqueName}" name="userUniqueName" hidden="true"/>
            			<div class="form-group">
    						<input type="text" class="form-control" id="userEditName" name="userEditName" placeholder="Name" value="${user.name}">
  						</div>
  						<p>@${user.uniqueName}</p>
  						<div class="form-group">
    						<input type="text" class="form-control" id="userEditDescription" name="userEditDescription" placeholder="Description" value="${user.description}">
  						</div>
  						<div class="form-group">
    						<input type="text" class="form-control" id="userEditAddress" name="userEditAddress" placeholder="Address" value="${user.address}">
  						</div>
  						<div class="form-group">
    						<input type="text" class="form-control" id="userEditSite" name="userEditSite" placeholder="Site" value="${user.site}">
  						</div>  						
            		</form>
  					
            		<ul class="nav" role="navigation">       				 
        				<li class="dropdown palette-dropdown">
          					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn btn-primary">Theme color</button></a>
          				         				
          					<ul class="dropdown-menu">            				
          						<li>
            						<span id="paletteColor1" class="user-palette"></span>
            						<span id="paletteColor2" class="user-palette"></span>
            						<span id="paletteColor3" class="user-palette"></span>
            						<span id="paletteColor4" class="user-palette"></span>
            						<span id="paletteColor5" class="user-palette"></span>
            						<span id="paletteColor6" class="user-palette"></span>
            						<span id="paletteColor7" class="user-palette"></span>
            					</li>
            					<li>
            						<span id="paletteColor8" class="user-palette"></span>
            						<span id="paletteColor9" class="user-palette"></span>
            						<span id="paletteColor10" class="user-palette"></span>
            					</li>
          					</ul>          				
        				</li>
        			</ul>	
            	</div>            	
            </c:if>
             
            <div class="col-md-6 notEditable">
            	<div class="row message-tab">
            		<div class="col-md-3"><a href="#">Сообщения</a></div>
            		<div class="col-md-4"><a href="#">Сообщения и ответы</a></div>
            		<div class="col-md-4"><a href="#">Фото и видео</a></div>
            	</div>          	
            	            	
            	<c:forEach items="${user.messages}" var="message">
    				<div class="message">
            			<div class="row">
            				<div class="col-md-2">
            					<img class="img-responsive img-rounded" src="${pageContext.request.contextPath}${user.logoURL}" alt="User's message logo.">
            				</div>
            				<div class="col-md-10">
            					<p class="user-link message-link">
            						<strong><a href="${pageContext.request.contextPath}/user/${user.uniqueName}">${user.name}</a></strong> @${user.uniqueName} - ${message.createDate}
            					</p>
            					<p>${message.text}</p>
            					
            					<c:choose>
    								<c:when test="${fn:length(message.mediaLinks) == 1}">
      									 <c:forEach items="${message.mediaLinks}" var="media">
            								<img class="img-responsive img-rounded" src="${pageContext.request.contextPath}/image/${media.link}" alt="User's message image."><br>
            							</c:forEach>
    								</c:when>    
    								<c:when test="${fn:length(message.mediaLinks) == 2}">
    									<div class="row image-row">
            							 	<div class="col-md-6">
            							 		<img class="img-responsive img-rounded img-half-1" src="${pageContext.request.contextPath}/image/${message.mediaLinks[0].link}" alt="User's message image."><br>
            							 	</div>
            								<div class="col-md-6">
            									<img class="img-responsive img-rounded img-half-2" src="${pageContext.request.contextPath}/image/${message.mediaLinks[1].link}" alt="User's message image."><br>
            								</div>
            							</div>
    								</c:when>    
    								<c:when test="${fn:length(message.mediaLinks) == 3}">
      									 <div class="row image-row">
            							 	<div class="col-md-7">
            							 		<img class="img-responsive img-rounded img-third-1" src="${pageContext.request.contextPath}/image/${message.mediaLinks[0].link}" alt="User's message image."><br>
            							 	</div>
            								<div class="col-md-5">
            									<img class="img-responsive img-rounded img-third-2" src="${pageContext.request.contextPath}/image/${message.mediaLinks[1].link}" alt="User's message image.">
            									<img class="img-responsive img-rounded img-third-3" src="${pageContext.request.contextPath}/image/${message.mediaLinks[2].link}" alt="User's message image."><br>
            								</div>
            							</div>
    								</c:when>    
    								<c:when test="${fn:length(message.mediaLinks) > 3}">
      									 <div class="row image-row">
            							 	<div class="col-md-8">
            							 		<img class="img-responsive img-rounded img-quarter-1" src="${pageContext.request.contextPath}/image/${message.mediaLinks[0].link}" alt="User's message image."><br>
            							 	</div>
            								<div class="col-md-4">
            									<img class="img-responsive img-rounded img-quarter-2" src="${pageContext.request.contextPath}/image/${message.mediaLinks[1].link}" alt="User's message image.">
            									<img class="img-responsive img-quarter-3" src="${pageContext.request.contextPath}/image/${message.mediaLinks[2].link}" alt="User's message image.">
            									<img class="img-responsive img-rounded img-quarter-4" src="${pageContext.request.contextPath}/image/${message.mediaLinks[2].link}" alt="User's message image.">
            								</div>
            							</div>
    								</c:when>    
								</c:choose>
            					
            					
            					<div class="row">
            						<div class="col-md-2 messageIcons"><a href="#"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span></a></div>            						
            						<div class="col-md-2 messageIcons retweet"><a href="#"><span class="glyphicon glyphicon-retweet" aria-hidden="true"> <strong>${message.retweets}</strong></span></a></div>
            						<div class="col-md-2 messageIcons like"><a href="#"><span class="glyphicon glyphicon-heart" aria-hidden="true"> <strong>${message.likes}</strong></span></a></div>
            						<div class="col-md-6 messageIcons"><a href="#"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span></a></div>
            				    </div>
            				</div>
            			</div>    
            		</div>
            	</c:forEach>               	
            </div>

            <div class="col-md-3 user-content-right">
            	<!-- Register invitation for user with role 'GUEST'-->			
				<c:if test="${sessionScope.userType == 'GUEST'}">
					<div class="well">
                    	<h4>Не пользуетесь WebChat?</h4>
                    	<p>Зарегистрируйтесь и получите свою собственную персонализированную ленту!</p>
                    	<button type="button" class="btn btn-primary" onclick="location = '${pageContext.request.contextPath}/'">Регистрация</button>
               		</div>
				</c:if>          	              

                <div class="well user-well notEditable">
                    <h4>Вам также может понравиться</h4>
                    <a href="#">Обновить</a>
                    
                    <c:forEach items="${followingUsers}" var="following" begin="0" end="5">                    	
                    	<p class="user-link"><a href="${pageContext.request.contextPath}/user/${following.uniqueName}">
                    		<span class="row user-following" onclick="window.location='#';">
            					<span class="col-md-4">
            						<img class="img-responsive img-rounded" src="${pageContext.request.contextPath}${following.logoURL}" alt="Similar user's page logo.">
            					</span>
            					<span class="col-md-8 user-following-name">            				
            						<Strong>${following.name}</Strong><br>@${following.uniqueName}
            					</span>
                    		</span><br>
                    	</a></p>
            		</c:forEach>                                    
                </div>

                <div class="well user-well notEditable">
                    <h4>Актуальные темы</h4>
                    <a href="#">#sampleTag</a><br>
                    <a href="#">sampleLink</a><br>
                    <a href="#">#sampleTag</a><br>
                    <a href="#">sampleLink</a><br>
                    <a href="#">#sampleTag</a><br>
                    <a href="#">sampleLink</a><br>
                </div>
                
                <p class="notEditable">Copyright &copy; WebChat 2016</p>
            </div>
        </div>
    </div>
</body>

</html>