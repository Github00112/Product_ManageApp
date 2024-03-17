package com.ssg.product_manage.dto;


import lombok.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Getter
@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
    private Long product_id;

    private boolean finished;

    @NotEmpty
    private String product_name;

    @NotNull
    @Min(0)
    @Max(1000000)
    private int price;

    @NotNull
    @Min(0)
    @Max(99999)
    private int stock_quantity;
}
