<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Quản lý danh mục - User</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 24px; }
        .role-info { background: #e3f2fd; color: #1565c0; padding: 8px 16px; border-radius: 6px; display: inline-block; margin-bottom: 16px; font-weight: bold; }
        .container { display: grid; grid-template-columns: 2fr 1fr; gap: 24px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background: #f4f7fb; }
        .actions a { margin-right: 8px; }
        .panel { border: 1px solid #c6d5e3; border-radius: 6px; }
        .panel h3 { margin: 0; padding: 10px 12px; background: #eef6ff; }
        .panel .body { padding: 12px; }
        input[type=text], input[type=file] { width: 100%; padding: 8px; margin: 6px 0 12px; box-sizing: border-box; }
        button { padding: 8px 14px; }
    </style>
</head>
<body>
<div class="role-info">
    Vai trò đăng nhập: 
    <c:choose>
        <c:when test="${sessionScope.role eq 1}">User</c:when>
        <c:when test="${sessionScope.role eq 2}">Manager</c:when>
        <c:when test="${sessionScope.role eq 3}">Admin</c:when>
        <c:otherwise>Không xác định</c:otherwise>
    </c:choose>
</div>
<h2>User - Danh sách danh mục của tôi</h2>
<p><a href="${pageContext.request.contextPath}/logout">Logout</a></p>
<div class="container">
    <div>
        <div class="panel">
            <h3>Danh sách danh mục</h3>
            <div class="body">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên danh mục</th>
                        <th>Hình ảnh</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cate" items="${categories}">
                        <tr>
                            <td>${cate.id}</td>
                            <td>${cate.categoryname}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty cate.images}">
                                        <img src="${pageContext.request.contextPath}/image?fname=${cate.images}" alt="image" style="height:24px"/>
                                    </c:when>
                                    <c:otherwise>Không có</c:otherwise>
                                </c:choose>
                            </td>
                            <td class="actions">
                                <c:if test="${cate.user.id == sessionScope.user.id}">
                                    <a href="${pageContext.request.contextPath}/user/category/edit?id=${cate.id}">Sửa</a>
                                    <a href="${pageContext.request.contextPath}/user/category/delete?id=${cate.id}" onclick="return confirm('Xóa danh mục này?')">Xóa</a>
                                </c:if>
                                <c:if test="${cate.user.id != sessionScope.user.id}">
                                    <span style="color:gray;">Không thể sửa/xóa</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <br/>
                <a href="${pageContext.request.contextPath}/user/category/add">Thêm danh mục</a>
            </div>
        </div>
    </div>
    <div>
        <div class="panel">
            <h3>Thêm danh mục mới</h3>
            <div class="body">
                <form action="${pageContext.request.contextPath}/user/category/add" method="post" enctype="multipart/form-data">
                    <label>Tên danh mục</label>
                    <input type="text" name="categoryname" required/>

                    <label>Hình ảnh</label>
                    <input type="file" name="images" accept="image/*"/>

                    <button type="submit">Thêm</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>