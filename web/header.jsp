<%@page import="model.User"%>
<div class="header">			
    <div class="header-logo">
        <center><a href="index.jsp"><img src="img/logo.png" style="border-radius: 8px;"></a></center>
    </div>

    <% 
    User user = new User();
    if(session.getAttribute("user") != null)
    {
        user = (User) session.getAttribute("user");
    %>    
        <div class="header-content">
            <div class="header-search">
                <form action="action">
                    <input type="text" name="searchname" class="txtsearch">
                    <button type="submit" class="btnsearch"><img src="img/search.png" with="25px" height="25px"></button>
                </form>
            </div>

            <div class="header-menu">
                <ul class="">
                    <li><a href="home.jsp" style="text-transform: uppercase;"><b><%= user.getUsername() %></b></a></li>
                    <li><a href="FoodPost.jsp" value="1" name="food"><b>FOOD</b></a></li>
                    <li><a href="TravellingPost.jsp" value="2" name="travelling"><b>TRAVELLING</b> </a></li>
                    <li>
                        <form action="UserServlet" method="post">
                            <input type="hidden" value="logout" name="command">
                            <button type="submit" value="logout" class="btn-logout"><b>LOG OUT</b></button>
                        </form>
                    </li>	
                </ul>
            </div>
        </div>      
    <% } else { %>        
    <jsp:include page="login.jsp"></jsp:include>
    <% } %>

</div>
