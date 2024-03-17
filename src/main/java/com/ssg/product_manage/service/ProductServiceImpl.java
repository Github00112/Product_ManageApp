package com.ssg.product_manage.service;

import com.ssg.product_manage.domain.ProductVO;
import com.ssg.product_manage.dto.PageRequestDTO;
import com.ssg.product_manage.dto.PageResponseDTO;
import com.ssg.product_manage.dto.ProductDTO;
import com.ssg.product_manage.mapper.ProductMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
@Log4j2
public class ProductServiceImpl implements ProductService {

    private final ModelMapper modelMapper;
    private final ProductMapper productMapper;

    @Override
    public void modify(ProductDTO productDTO) {
        ProductVO productVO = modelMapper.map(productDTO, ProductVO.class);
        productMapper.update(productVO);
    }

    @Override
    public void delete(Long product_id) {
        productMapper.delete(product_id);
    }

    @Override
    public void register(ProductDTO productDTO) {
        ProductVO productVO = modelMapper.map(productDTO, ProductVO.class);
        productMapper.insert(productVO);
    }

    @Override
    public ProductDTO getOne(Long tno) {
        ProductVO productVOV = productMapper.select(tno);
        return modelMapper.map(productVOV, ProductDTO.class);
    }


    @Override
    public PageResponseDTO<ProductDTO> getList(PageRequestDTO pageRequestDTO) {
        List<ProductVO> productVOS = productMapper.ProductList(pageRequestDTO);
        List<ProductDTO> collect = productVOS.stream().map(vo -> modelMapper.map(vo, ProductDTO.class)).collect(Collectors.toList());
        int count = productMapper.getCount(pageRequestDTO);

        PageResponseDTO<ProductDTO> pageResponseDTO = PageResponseDTO.<ProductDTO>withAll()
                .dtoList(collect)
                .total(count)
                .pageRequestDTO(pageRequestDTO).build();

        return pageResponseDTO;
    }
}
