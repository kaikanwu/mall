package com.mall.controller;

import com.mall.pojo.Category;
import com.mall.service.ICategoryService;
import com.mall.util.ImageUtil;
import com.mall.util.UploadImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("")
public class CategoryController {
    @Autowired
    private ICategoryService iCategoryService;

    @RequestMapping("list")
    public String list(Model model) {
        List<Category> categoryList = iCategoryService.list();
        model.addAttribute("categoryList", categoryList);
        return "manage/categoryList";
    }


    @RequestMapping("addCategory")
    public String add(Category category, HttpSession session, UploadImage uploadImage) throws IOException {
        iCategoryService.addCategory(category);

        //
        File imageFolder= new File(session.getServletContext().getRealPath("img/category"));
        File file = new File(imageFolder,category.getId()+".jpg");
        if(!file.getParentFile().exists())
            file.getParentFile().mkdirs();
        uploadImage.getImage().transferTo(file);
        BufferedImage image = ImageUtil.change2jpg(file);
        ImageIO.write(image, "jpg", file);
        return "redirect:/list";


    }


    @RequestMapping("deleteCategory")
    public String delete(int id){
        iCategoryService.deleteCategory(id);
        return "redirect:/list";
    }


    @RequestMapping("editCategory")
    public String edit(int id, Model model) throws  IOException {

        Category category =  iCategoryService.editCategory(id);
        model.addAttribute("category", category);
        return "manage/editCategory";
    }


    @RequestMapping("updateCategory")
    public String updateCategory(Category category, HttpSession session, UploadImage uploadImage)throws  IOException{
        iCategoryService.updateCategory(category);
        MultipartFile image = uploadImage.getImage();
        if(null!=image &&!image.isEmpty()){
            File  imageFolder= new File(session.getServletContext().getRealPath("img/category"));
            File file = new File(imageFolder,category.getId()+".jpg");
            image.transferTo(file);
            BufferedImage img = ImageUtil.change2jpg(file);
            ImageIO.write(img, "jpg", file);
        }
        return "redirect:/list";
    }

}
