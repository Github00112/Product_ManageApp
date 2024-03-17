package com.ssg.product_manage.controller;


import com.ssg.product_manage.dto.PageRequestDTO;
import com.ssg.product_manage.dto.ProductDTO;
import com.ssg.product_manage.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@Log4j2
@RequestMapping("/prod")
@RequiredArgsConstructor
public class ManageController {

    @Autowired
    private final ProductService productService;

    @GetMapping("/add")
    public void add(){
        log.info("add Product");
    }

    @PostMapping("/add")
    public String addProd(@Valid ProductDTO productDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        log.info("add Product execute");
        log.info(productDTO);

        if(bindingResult.hasErrors()){
            log.error("Error during add product");
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());

            return "redirect:/prod/add";
        }
        log.info(productDTO);

        productService.register(productDTO);

        return "redirect:/prod/list";
    }

    @GetMapping({"/read", "/modify"})
    public void modify(@RequestParam("product_id") Long productId, Model model) {
        ProductDTO read = productService.getOne(productId);
        model.addAttribute("dto", read);
    }

    @PostMapping("/modify")
    public String modify(@Valid ProductDTO productDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            log.info("Error occurred");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addAttribute("tno", productDTO.getProduct_id());
            return "redirect:/prod/modify";
        }
        log.info(productDTO);
        productService.modify(productDTO);
        return "redirect:/prod/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("product_id") Long product_id, RedirectAttributes redirectAttributes) {
        log.info("id  : " + product_id);
        productService.delete(product_id);
        return "redirect:/prod/list";
    }


    @RequestMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            pageRequestDTO = PageRequestDTO.builder().build();
        }
        model.addAttribute("responseDTO", productService.getList(pageRequestDTO));
    }
}
