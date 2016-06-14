
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
      <h1>Product Inventory</h1>

      <p class="lead">All available products</p>
    </div>

  <table class="table table-striped table-hover">
    <thead>
    <tr class="bg-success"/>
    <th>Photo thumb</th>
    <th>Product Name</th>
    <th>Category</th>
    <th>Condition</th>
    <th>Price</th>
    <th></th>
    </tr>
    </thead>
    <c:forEach items="${products}" var="product">
      <tr>
        <td><img src="#" alt="image"/></td>
        <td>${product.productName}</td>
        <td>${product.productCategory}</td>
        <td>${product.productCondition}</td>
        <td>${product.productPrice} USD</td>
        <td><a href="<spring:url value="/ProductList/ViewProduct/${product.prodID}"/>"><span class="glyphicon glyphicon-info-sign"></span></a></td>
        <td><a href="<spring:url value="/admin/productInventory/deleteProduct/${product.prodID}"/>"><span class="glyphicon glyphicon-remove"></span></a></td>
        <td><a href="<spring:url value="/admin/productInventory/editProduct/${product.prodID}"/>"><span class="glyphicon glyphicon-edit"></span></a></td>
      </tr>
    </c:forEach>
  </table>
    <a href="<spring:url value="/admin/productInventory/addProduct"/>" class="btn btn-primary" >Add product</a>


<%@include file="templates/footer.jsp"%>