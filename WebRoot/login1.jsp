<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Login</title>
		<link type="text/css" href="css/smoothness/jquery-ui-1.8.12.custom.css" rel="stylesheet" />	
        <link href="main.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.12.custom.min.js"></script>
		<script type="text/javascript">
			$(function(){
				//Autocomplete
				$("#login_un").autocomplete({
					source: ["yuanxin", "andrew", "sam"]
				});

				// Button
				$("#button").button();
				$("#login_but_set").buttonset();
	

				// Login Dialog			
				$('#log_dia').dialog({
					autoOpen: false,
					width: 600,
					buttons: {
						"Ok": function() { 
							$(this).dialog("close"); 
						}
					}
				});
				// Registe Dialog			
				$('#reg_dia').dialog({
					autoOpen: false,
					width: 600,
					buttons: {
						"Ok": function() { 
							$(this).dialog("close"); 
						}, 
						"Cancel": function() { 
							$(this).dialog("close"); 
						} 
					}
				});
				
				// Dialog Link
				$('#reg_link').click(function(){
					$('#reg_dia').dialog('open');
					return false;
				});
				$('#log_link').click(function(){
					$('#log_dia').dialog('open');
					return false;
				});
				
				//hover states on the static widgets
				$('#log_link').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
			});
		</script>
		<style type="text/css">
			/*demo page css*/
			/*body{ margin:0 auto;}*/
			.login_link {padding: 0em 1em 0em 20px;text-decoration: none;position: relative;}
			.login_link span.ui-icon {margin: 0 5px 0 0;position: absolute;left: .2em;top: 50%;margin-top: -8px;}
		</style>	
	</head>
	<body>
		

		<!-- Login -->
		<div>
        	<table>
			<tr><td>ID </td><td><input id="login_un" style="z-index: 10; position: relative" title="type &quot;a&quot;" /></td></tr>
			<tr><td>Password </td><td><input id="login_pw" type="password" style="z-index: 10; position: relative" title="type &quot;a&quot;" /></td></tr>
            <tr><td colspan="2">
            	<!-- Button -->
				<form style="margin-top: 1em; word-break:keep-all;">
				<div id="login_but_set" style="white-space: nowrap;">
                        <a href="#" id="reg_link" class="ui-state-default ui-corner-all login_link">
                        <span class="ui-icon ui-icon-newwin"></span>
                        入住Hyacinth
                        </a>
                    	<a href="#" id="log_link" class="ui-state-default ui-corner-all login_link">
                        <span class="ui-icon ui-icon-check"></span>
                        登陆
                        </a>
                </div>
                </form>
            </td></tr>
            
            </table>
		</div>
		

		
		
	
		<!-- Login dialog -->
		<div id="log_dia" title="Welcome back!">
			hi
		</div>
		<!-- Register dialog -->
		<div id="reg_dia" title="Register">
			hi
		</div>
        
	</body>
</html>


