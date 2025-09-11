<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>

<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Quản lý danh mục</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 24px; }
        .container { display: grid; grid-template-columns: 2fr 1fr; gap: 24px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background: #eaf3ff; }
        .actions a { margin-right: 8px; }
        .panel { border: 1px solid #c6d5e3; border-radius: 6px; }
        .panel h3 { margin: 0; padding: 10px 12px; background: #d7ebf7; }
        .panel .body { padding: 12px; }
        input[type=text] { width: 100%; padding: 8px; margin: 6px 0 12px; box-sizing: border-box; }
        button { padding: 8px 14px; }
    </style>
</head>
<body>
<div class="role-info" style="background: #ffe0b2; color: #e65100; padding: 8px 16px; border-radius: 6px; display: inline-block; margin-bottom: 16px; font-weight: bold;">
    Vai trò đăng nhập: 
    <c:choose>
        <c:when test="${sessionScope.role eq 1}">User</c:when>
        <c:when test="${sessionScope.role eq 2}">Manager</c:when>
        <c:when test="${sessionScope.role eq 3}">Admin</c:when>
        <c:otherwise>Không xác định</c:otherwise>
    </c:choose>
</div>
<h2>Quản lý danh mục</h2>
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
                                        <img src="${pageContext.request.contextPath}/image?fname=${cate.images}" alt="image" style="height:20px"/>
                                    </c:when>
                                    <c:otherwise>-</c:otherwise>
                                </c:choose>
                            </td>
                            <td class="actions">
                                <c:if test="${cate.user.id == sessionScope.user.id}">
                                    <a href="<c:url value='/admin/category/edit?id=${cate.id}'/>">Cập nhật</a>
                                    <a href="<c:url value='/admin/category/delete?id=${cate.id}'/>"
                                       onclick="return confirm('Xóa danh mục này?')">Xóa</a>
                                </c:if>
                                <c:if test="${cate.user.id != sessionScope.user.id}">
                                    <span style="color:gray;">Không thể sửa/xóa</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div>
        <div class="panel">
            <h3><c:if test="${empty category}">Thêm danh mục</c:if><c:if test="${not empty category}">Cập nhật danh mục</c:if></h3>
            <div class="body">
                <c:set var="isEdit" value="${not empty category}"/>
                <form method="post"
                      action="${pageContext.request.contextPath}<c:out value='${isEdit ? "/admin/category/update" : "/admin/category/add"}'/>">
                    <c:if test="${isEdit}">
                        <input type="hidden" name="id" value="${category.id}"/>
                    </c:if>
                    <label>Tên danh mục</label>
                    <input type="text" name="categoryname" value="<c:out value='${isEdit ? category.categoryname : ""}'/>" required/>

                    <label>Hình ảnh (tên file)</label>
                    <input type="text" name="images" value="<c:out value='${isEdit ? category.images : ""}'/>"/>

                    <button type="submit">Submit</button>
                    <c:if test="${isEdit}">
                        <a href="${pageContext.request.contextPath}/admin/category" style="margin-left:8px;">Hủy</a>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>