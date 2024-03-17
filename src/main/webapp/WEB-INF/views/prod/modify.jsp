<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Modify</title>
</head>
<body>

<div class="row content">
    <div class="col">
        <div class="card">
            <div class="card-header">
                Todo Modify
            </div>
            <div class="card-body">
                <form action="/prod/modify" method="post">

                    <div class="input-group mb-3">
                        <span class="input-group-text">product_id</span>
                        <input type="text" name="product_id" class="form-control"
                               value="<c:out value='${dto.product_id}'/>" readonly>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">product_name</span>
                        <input type="text" name="product_name" class="form-control"
                               value="<c:out value='${dto.product_name}'/>" required minlength="1" maxlength="100">
                        <div class="invalid-feedback">이미 존재하는 제품 이름입니다.</div>

                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">price</span>
                        <input type="number" name="price" class="form-control"
                               value="<c:out value='${dto.price}'/>" required min="0" max="1000000">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">stock_quantity</span>
                        <input type="number" name="stock_quantity" class="form-control"
                               value="<c:out value='${dto.stock_quantity}'/>" required min="0" max="9999">
                    </div>

                    <div class="form-check">
                        <label class="form-check-label" >
                            Finished &nbsp;
                        </label>
                        <input class="form-check-input" type="checkbox" name="finished" <c:if test="${dto.finished}">checked</c:if>>
                    </div>

                    <div class="my-4">
                        <div class="float-end">
                            <button type="button" class="btn btn-danger">Remove</button>
                            <button type="submit" class="btn btn-primary">Modify</button>
                            <button type="button" class="btn btn-secondary">List</button>
                        </div>
                    </div>
                </form>

                <script>

                    const formObj = document.querySelector("form")

                    document.querySelector(".btn-danger").addEventListener("click",function(e) {

                        e.preventDefault()
                        e.stopPropagation()

                        formObj.action ="/prod/remove"
                        formObj.method ="post"

                        formObj.submit()

                    },false);


                    document.querySelector(".btn-secondary").addEventListener("click",function(e) {

                        e.preventDefault()
                        e.stopPropagation()

                        self.location = "/prod/list";

                    },false);


                </script>

            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    // 중복된 제품 이름이 발견되었을 때 경고 창을 표시하고 이전 화면으로 돌아가는 함수
    function showDuplicateNameAlert() {
        // 경고 창 표시
        if(confirm("중복된 제품 이름이 이미 존재합니다. 다른 이름을 사용하세요.")) {
            // 확인 버튼을 누르면 이전 화면으로 돌아가기
            history.back();
        }
    }
</script>
</body>
</html>
