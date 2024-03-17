package com.ssg.product_manage.domain;


import lombok.*;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductVO {
    private Long product_id;

    private String product_name;

    private int price;

    private int stock_quantity;
}
