<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Chỉnh sửa danh mục</title>
    <!-- Thêm Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container my-4">

    <!-- Nút quay lại -->
    <div class="mb-3">
        <a href="${pageContext.request.contextPath}/admin/category" class="text-decoration-none">
            ← Quay lại danh sách
        </a>
    </div>

    <!-- Card form -->
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Chỉnh sửa danh mục</h5>
        </div>
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/admin/category/edit" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${category.id}"/>

                <div class="mb-3">
                    <label class="form-label">Tên danh mục</label>
                    <input type="text" class="form-control" name="categoryname"
                           value="${category.categoryname}" required/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Hình ảnh (tên file)</label>
                    <input type="text" class="form-control mb-2" name="images" value="${category.images}"/>
                    <input type="file" class="form-control" name="imageFile" accept="image/*"/>
                </div>

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-success">Cập nhật</button>
                    <a href="${pageContext.request.contextPath}/admin/category" class="btn btn-secondary">Hủy</a>
                </div>
            </form>
        </div>
    </div>

</div>

<!-- JS Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>