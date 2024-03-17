package com.ssg.product_manage.mapper;

import com.ssg.product_manage.domain.ProductVO;
import com.ssg.product_manage.dto.PageRequestDTO;

import java.util.List;

public interface ProductMapper {
    void insert(ProductVO productVO);

    void update(ProductVO productVO);

    void delete(Long id);

    ProductVO select(Long id);

    List<ProductVO> ProductList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);

    String existProductName(String product_name);
}
