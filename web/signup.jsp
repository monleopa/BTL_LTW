<%-- 
    Document   : signup
    Created on : Oct 17, 2018, 3:30:45 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/signup.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#email").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                    });

                function check_username_ajax(username) {
                    $("#user-result").html('<img src="img/ajaxloader.gif" />');
                    $.post('CheckEmailServlet', {'username': username}, function (data) {
                        $("#user-result").html(data);
                     });
                }
            });
        </script>
        
        <div class="signup-area">
            <div class="signup-infor"></div>
            <div class="signup-form">
                <center>
                    <br>
                    <h1>Sign Up!</h1>
                    <p>If you do not have an account yet, register now</p>
                    <br>
                    <span id = "noti" style="display: none; color: red;">Please fill the form fully</span>
                    <form method="POST" action="UserServlet">
                        <input type="text" placeholder="  Email" name="email" id="email" class="custom-size" onclick="checkFull()">
                        <br><br>
                        <span id="user-result"></span>
                        <input type="text" placeholder="  Username" name="uname" id="uname" class="custom-size">
                        <br><br>
                        <input type="password" placeholder="  Password" name="pass" id="pass" class="custom-size">
                        <br><br>
<!--                        <input type="password" placeholder="Confirm Password" name="copass" id="pass" class="custom-size">-->
                        <br><br>
                        <input type="hidden" value="insert" name="command">
                        <input type="submit" value="Register" class="custom-inp">
                    </form>
                </center>
            </div>
        </div>
         
    </body>
</html>