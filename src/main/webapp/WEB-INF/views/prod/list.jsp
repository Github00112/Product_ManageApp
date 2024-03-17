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

    <title>List</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- 기존의 <h1>Header</h1> -->
        <div class="row">
            <div class="col">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Navbar</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <div class="navbar-nav">
                                <a class="nav-link active" aria-current="page" href="/prod/list">Home(List)</a>
                                <a class="nav-link" href="/prod/add">Register</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- header end -->
        <!-- 기존의 <h1>Header</h1>끝 -->
        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Search </h5>
                        <form action="/prod/list" method="get">
                            <input type="hidden" name="size" value="${pageRequestDTO.size}">
                            <div class="mb-3">
                                <input type="checkbox" name="finished" ${pageRequestDTO.finished?"checked":""} >완료여부
                            </div>
                            <div class="mb-3">
                                <input type="checkbox" name="types" value="t" ${pageRequestDTO.checkType("t")?"checked":""}>상품명
                                <input type="checkbox" name="types" value="w"  ${pageRequestDTO.checkType("w")?"checked":""}>가격
                                <input type="text"  name="keyword" class="form-control" value ='<c:out value="${pageRequestDTO.keyword}"/>' >
                            </div>
                            <div class="input-group mb-3">
                                <div class="float-end">
                                    <button class="btn btn-primary" type="submit">Search</button>
                                    <button class="btn btn-info clearBtn" type="reset">Clear</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>

        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        상품 목록
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">전체 상품목록</h5>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Product_id</th>
                                <th scope="col">Product_name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Stock_Quantity</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${responseDTO.dtoList}" var="dto">
                                <tr>
                                    <th scope="row"><c:out value="${dto.product_id}"/></th>
                                    <td>
                                        <a href="/prod/read?product_id=${dto.product_id}" class="text-decoration-none" data-tno="${dto.product_id}" >
                                            <c:out value="${dto.product_name}"/>
                                        </a>
                                    </td>
                                    <td><c:out value="${dto.price}"/></td>
                                    <td><c:out value="${dto.stock_quantity}"/></td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>

                        </table>

                        <div class="float-end">
                            <ul class="pagination flex-wrap">
                                <c:if test="${responseDTO.prev}">
                                    <li class="page-item">
                                        <a class="page-link" data-num="${responseDTO.start -1}">Previous</a>
                                    </li>
                                </c:if>

                                <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                                    <li class="page-item ${responseDTO.page == num? "active":""} ">
                                        <a class="page-link"  data-num="${num}">${num}</a></li>
                                </c:forEach>

                                <c:if test="${responseDTO.next}">
                                    <li class="page-item">
                                        <a class="page-link"  data-num="${responseDTO.end + 1}">Next</a>
                                    </li>
                                </c:if>
                            </ul>

                        </div>

                        <script>


                            document.querySelector(".pagination").addEventListener("click", function (e) {
                                e.preventDefault()
                                e.stopPropagation()

                                const target = e.target

                                if(target.tagName !== 'A') {
                                    return
                                }
                                const num = target.getAttribute("data-num")

                                const formObj = document.querySelector("form")

                                formObj.innerHTML += `<input type='hidden' name='page' value='\${num}'>`

                                formObj.submit();

                            },false)



                            document.querySelector(".clearBtn").addEventListener("click", function (e){
                                e.preventDefault()
                                e.stopPropagation()

                                self.location ='/prod/list'

                            },false)


                        </script>

                    </div>

                </div>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>