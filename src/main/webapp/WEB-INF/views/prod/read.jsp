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

    <title>read</title>
</head>
<body>

        <!-- header end -->
        <!-- 기존의 <h1>Header</h1>끝 -->

        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        Featured
                    </div>
                    <div class="card-body">
                        <div class="input-group mb-3">
                            <span class="input-group-text">product_id</span>
                            <input type="text" name="product_id" class="form-control"
                                   value=<c:out value="${dto.product_id}"></c:out> readonly>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">product_name</span>
                            <input type="text" name="product_name" class="form-control"
                                   value=<c:out value="${dto.product_name}"></c:out> readonly>
                        </div>

                        <div class="input-group mb-3">
                            <span class="input-group-text">price</span>
                            <input type="text" name="price" class="form-control"
                                   value=<c:out value="${dto.price}"></c:out> readonly>

                        </div>

                        <div class="input-group mb-3">
                            <span class="input-group-text">stock_quantity</span>
                            <input type="text" name="stock_quantity" class="form-control"
                                   value=<c:out value="${dto.stock_quantity}"></c:out> readonly>

                        </div>

                        <div class="form-check">
                            <label class="form-check-label" >
                                Finished &nbsp;
                            </label>
                            <input class="form-check-input" type="checkbox" name="finished" ${dto.finished?"checked":""} disabled >
                        </div>

                        <div class="my-4">
                            <div class="float-end">
                                <button type="button" class="btn btn-primary">Modify</button>
                                <button type="button" class="btn btn-secondary">List</button>
                            </div>
                        </div>

                        <script>





                            document.querySelector(".btn-primary").addEventListener("click", function(e){

                                self.location = "/prod/modify?product_id="+${dto.product_id}

                            },false)



                            //목록 페이지로 이동하는 이벤트 처리
                            document.querySelector(".btn-secondary").addEventListener("click", function(e){

                                self.location = "/prod/list"

                            },false)

                        </script>


                    </div>
                </div>
            </div>
        </div>

    </div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>