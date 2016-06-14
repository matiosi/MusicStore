<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="templates/header.jsp"%>

<div class="container-wrapper">
  <div class="container">
    <div class="page-header">
      <h1>Product Detail</h1>

      <p class="lead">Here is the detail about product</p>
    </div>

    <div class="container">
      <div class="row">
          <div class="col-md-5">
            <img src="#" alt="image" style="width:100%; height:300px"/>
            </div>
          <div class="col-md-5">
            <h2><strong>Product Name:</strong>${product.productName}</h2>
            <p><strong>Description :</strong>  ${product.productDescription}</p>
              <p> <strong>Manufacture:</strong> ${product.productManufacturer}</p>
            <p><strong>Category</strong> : ${product.productCategory}</p>
            <p><strong>Condition</strong> : ${product.productCondition}</p>
            <p><strong>Price</strong>: ${product.productPrice}</p>
          </div>
      </div>
  </div>

<%@include file="templates/footer.jsp"%>