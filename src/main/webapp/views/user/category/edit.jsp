<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa danh mục - User</title>
    <style>body{font-family:Arial;margin:20px} label{display:block;margin-top:8px}</style>
</head>
<body>
<h2>Sửa danh mục của tôi</h2>
<p><a href="${pageContext.request.contextPath}/user/home">Back</a> | <a href="${pageContext.request.contextPath}/logout">Logout</a></p>
<form action="${pageContext.request.contextPath}/user/category/edit" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${category.id}" />
    <label>Tên danh mục</label>
    <input type="text" name="categoryname" value="${category.categoryname}" required />

    <label>Hình ảnh</label>
    <input type="file" name="images" accept="image/*" />
    <p>Hiện tại: <c:out value="${category.images}"/></p>

    <button type="submit">Cập nhật</button>
    <a href="${pageContext.request.contextPath}/user/home">Hủy</a>
</form>
</body>
</html>
