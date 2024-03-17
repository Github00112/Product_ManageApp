package com.ssg.product_manage.service;

import com.ssg.product_manage.dto.PageRequestDTO;
import com.ssg.product_manage.dto.PageResponseDTO;
import com.ssg.product_manage.dto.ProductDTO;

public interface ProductService {
    void modify(ProductDTO productDTO);

    void delete(Long product_id);

    void register(ProductDTO productDTO);

    ProductDTO getOne(Long product_id);

    PageResponseDTO<ProductDTO> getList(PageRequestDTO pageRequestDTO);




}
