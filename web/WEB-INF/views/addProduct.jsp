
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
      <h1>New Product</h1>

      <p class="lead">Add new product</p>
      </div>


      <form:form action="${pageContext.request.contextPath}/admin/productInventory/addProduct" method="post"
                 commandName="product">
          <div class="form-group row">
              <label for="name" class="col-sm-2 form-control-label">Product Name</label><form:errors path="productName" cssStyle="color: red"/>
              <div class="col-sm-10">
                  <form:input path="productName" class="form-control" id="name"/>
              </div>
          </div>
          <div class="form-group row">
              <label for="catg" class="col-sm-2 form-control-label">Category</label>
              <div class="col-sm-10">
                  <label class="checkbox-inline"><form:radiobutton path="productCategory" id="catg" value="Instrument"/>Instrument</label>
                  <label class="checkbox-inline"><form:radiobutton path="productCategory" id="catg" value="Record"/>Record</label>
                  <label class="checkbox-inline"><form:radiobutton path="productCategory" id="catg" value="Accessory"/>Accessory</label>
              </div>
          </div>
      <div class="form-group row">
          <label for="cond" class="col-sm-2 form-control-label">Condition</label>
          <div class="col-sm-10">
              <label class="checkbox-inline"><form:radiobutton path="productCondition" id="cond" value="New"/>New</label>
              <label class="checkbox-inline"><form:radiobutton path="productCondition" id="cond" value="Used"/>Used</label>
              <label class="checkbox-inline"><form:radiobutton path="productCondition" id="cond" value="Damaged"/>Damaged</label>
          </div>
      </div>
      <div class="form-group row">
          <label for="desc" class="col-sm-2 form-control-label">Description</label>
          <div class="col-sm-10">
              <form:textarea path="productDescription" type="text" class="form-control" id="desc" />
          </div>
      </div>
      <div class="form-group row">
          <label for="manf" class="col-sm-2 form-control-label">Manufacture</label>
          <div class="col-sm-10">
              <form:input path="productManufacturer" type="text" class="form-control" id="manf"/>
          </div>
      </div>
      <div class="form-group row">
          <label for="productStatus" class="col-sm-2 form-control-label">Product Status</label>
          <div class="col-sm-10">
              <form:input path="productStatus" type="text" class="form-control" id="productStatus"/>
          </div>
      </div>
          <div class="form-group row">
              <label for="price" class="col-sm-2 form-control-label">Price</label>
              <div class="col-sm-10">
                  <form:input path="productPrice" type="number" class="form-control" id="price"/>
              </div>
          </div>
      <div class="form-group row">
          <label for="unitInStock" class="col-sm-2 form-control-label">Unit In Stock</label>
          <div class="col-sm-10">
              <form:input path="unitInStock" type="number" class="form-control" id="unitInStock"/>
          </div>
      </div>
      <%--<div class="form-group">--%>
          <%--<label for="productImage" class="col-sm-2 form-control-label">Upload</label>--%>
          <%--<div class="col-sm-10">--%>
              <%--<form:input path="productImage" type="file" class="form:input-large" id="productImage"/>--%>
          <%--</div>--%>
          <div class="form-group row">
              <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-secondary">Submit</button>
                  <a href="<spring:url value="/admin/productInventory/"/>" class="btn btn-primary" >Cancel</a>
              </div>
              </div>
      </form:form>


<%@include file="templates/footer.jsp"%>