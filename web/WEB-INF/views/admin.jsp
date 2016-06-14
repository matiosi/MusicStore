<%--
  Created by IntelliJ IDEA.
  User: mateusz.osiak
  Date: 2016-06-03
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="templates/header.jsp"%>

<div class="container-wrapper">
  <div class="container">
    <div class="page-header">
      <h1>Admin Page</h1>

      <p class="lead">This is the admin page</p>
    </div>
    <h3>
      <a href="<spring:url value="/admin/productInventory"/>">Inventory</a>
    </h3>

    <p>All information about products</p>


  </div>
</div>

<%@include file="templates/footer.jsp"%>