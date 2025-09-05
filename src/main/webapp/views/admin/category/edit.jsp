<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>

<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Chỉnh sửa danh mục</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 24px; }
        .container { max-width: 600px; margin: 0 auto; }
        .panel { border: 1px solid #c6d5e3; border-radius: 6px; margin-bottom: 20px; }
        .panel h3 { margin: 0; padding: 10px 12px; background: #d7ebf7; }
        .panel .body { padding: 12px; }
        input[type=text] { width: 100%; padding: 8px; margin: 6px 0 12px; box-sizing: border-box; }
        button { padding: 8px 14px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background: #0056b3; }
        .actions { margin-top: 12px; }
        .actions a { margin-left: 8px; text-decoration: none; color: #6c757d; }
        .actions a:hover { color: #007bff; }
        .back-link { margin-bottom: 20px; }
        .back-link a { text-decoration: none; color: #007bff; }
        .back-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>
<div class="back-link">
    <a href="${pageContext.request.contextPath}/admin/category">← Quay lại danh sách</a>
</div>

<h2>Chỉnh sửa danh mục</h2>

<div class="container">
    <div class="panel">
        <h3>Thông tin danh mục</h3>
        <div class="body">
            <form method="post" action="${pageContext.request.contextPath}/admin/category/edit">
                <input type="hidden" name="id" value="${category.id}"/>
                
                <label>Tên danh mục</label>
                <input type="text" name="categoryname" value="${category.categoryname}" required/>

                <label>Hình ảnh (tên file)</label>
                <input type="text" name="images" value="${category.images}"/>

                <div class="actions">
                    <button type="submit">Cập nhật</button>
                    <a href="${pageContext.request.contextPath}/admin/category">Hủy</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>