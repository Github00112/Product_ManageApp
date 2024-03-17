<%--
  Created by IntelliJ IDEA.
  User: imhwan
  Date: 3/13/24
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>register</title>
</head>
<body>

<div class="container">

    <div class="row content">
        <div class="col">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <span>등록 화면</span>
                    <a href="/prod/list" class="btn btn-link">메인 화면</a>
                </div>

                <div class="card-body">
                    <form id="registrationForm" action="/prod/add" method="post">
                        <div class="input-group mb-3">
                            <span class="input-group-text">상품명</span>
                            <input id="productName" type="text" name="Product_name" class="form-control" placeholder="상품명" maxlength="100">
                        </div>

                        <div class="input-group mb-3">
                            <span class="input-group-text">가격</span>
                            <input id="price" type="number" name="price" class="form-control" placeholder="가격" min="0" max="1000000">
                        </div>

                        <div class="input-group mb-3">
                            <span class="input-group-text">수량</span>
                            <input id="stockQuantity" type="number" name="stock_quantity" class="form-control" placeholder="수량" min="0" max="9999">
                        </div>

                        <div id="warningMessage" class="alert alert-warning" style="display:none;"></div>

                        <div class="my-4">
                            <div class="float-end">
                                <button id="submitButton" type="submit" class="btn btn-primary" disabled>Submit</button>
                                <button type="reset" class="btn btn-secondary">Reset</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="row footer">
        <div class="row fixed-bottom" style="z-index: -100">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
    // 필드 입력 체크
    function checkFields() {
        var productName = document.getElementById("productName").value.trim();
        var price = document.getElementById("price").value;
        var stockQuantity = document.getElementById("stockQuantity").value;

        if (productName.length > 0 && productName.length <= 100 &&
            !isNaN(price) && price >= 0 && price <= 1000000 &&
            !isNaN(stockQuantity) && stockQuantity >= 0 && stockQuantity <= 9999) {
            document.getElementById("submitButton").disabled = false;
            document.getElementById("warningMessage").style.display = "none"; // 유효성 검사에 성공하면 경고 메시지를 숨깁니다.
        } else {
            document.getElementById("submitButton").disabled = true;
            document.getElementById("warningMessage").innerText = "상품명은 1글자 이상 100글자 이하로, 가격은 0원 이상 1,000,000원 이하로, 재고 수량은 0개 이상 9,999개 이하로 입력하세요.";
            document.getElementById("warningMessage").style.display = "block"; // 유효성 검사에 실패하면 경고 메시지를 보여줍니다.
        }
    }

    // 필드가 변경될 때마다 체크
    document.getElementById("productName").addEventListener("input", checkFields);
    document.getElementById("price").addEventListener("input", checkFields);
    document.getElementById("stockQuantity").addEventListener("input", checkFields);
</script>

</body>
</html>

