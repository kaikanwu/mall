package com.mall.controller;

import com.mall.pojo.Product;
import com.mall.pojo.ProductImage;
import com.mall.service.IProductImageService;
import com.mall.service.IProductService;
import com.mall.util.ImageUtil;
import com.mall.util.UploadImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("")
public class ProductImageController {
    @Autowired
    IProductService iProductService;

    @Autowired
    IProductImageService iProductImageService;


    @RequestMapping("addProductImage")
    public String addProductImage(HttpSession session, ProductImage productImage, UploadImage uploadImage){
        //add this image record to database!
        iProductImageService.add(productImage);
        String fileName = productImage.getId()+".jpg";

        //create the place of storing images
        String imageFolder;
        String smallImageFolder = null;
        String middleImageFolder = null;

        //create folder for different size
        if (IProductImageService.firstImage.equals(productImage.getType())) {
            imageFolder = session.getServletContext().getRealPath("img/firstImage");
            smallImageFolder = session.getServletContext().getRealPath("img/smallImage");
            middleImageFolder = session.getServletContext().getRealPath("img/middleImage");

        }else {
            imageFolder = session.getServletContext().getRealPath("img/detailImage");
        }

        //get the image file here
        File file = new File(imageFolder, fileName);
        file.getParentFile().mkdirs();
        try {
            uploadImage.getImage().transferTo(file);
            BufferedImage bufferedImage = ImageUtil.change2jpg(file);
            ImageIO.write(bufferedImage, "jpg", file);

            if (IProductImageService.firstImage.equals(productImage.getType())) {
                File small = new File(smallImageFolder, fileName);
                File middle = new File(middleImageFolder, fileName);

                ImageUtil.resizeImage(file, 50, 50, small);
                ImageUtil.resizeImage(file, 200, 200, middle);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:productImageList?pid=" + productImage.getPid();
    }


    @RequestMapping("deleteProductImage")
    public String deleteProductImage(HttpSession session, int id) {

        ProductImage productImage = iProductImageService.get(id);
        String fileName = productImage.getId()+".jpg";

        //create the place of storing images
        String imageFolder;
        String smallImageFolder = null;
        String middleImageFolder = null;

        if (IProductImageService.firstImage.equals(productImage.getType())) {
            //get teh folder
            imageFolder = session.getServletContext().getRealPath("img/firstImage");
            smallImageFolder = session.getServletContext().getRealPath("img/smallImage");
            middleImageFolder = session.getServletContext().getRealPath("img/middleImage");
            //Due to the addProductImage method, we need to delete three images here
            File image = new File(imageFolder, fileName);
            File smallImage = new File(smallImageFolder, fileName);
            File middleImage = new File(middleImageFolder, fileName);
            // delete all the image
            image.delete();
            smallImage.delete();
            middleImage.delete();

        }else {
            imageFolder = session.getServletContext().getRealPath("img/detailImage");

            // just need to delete one file here
            File image = new File(imageFolder, fileName);
            image.delete();
        }

        //also we need to delete the record in database
        iProductImageService.delete(id);


        return "redirect:productImageList?pid=" + productImage.getPid();

    }



    @RequestMapping("productImageList")
    public String list(int pid, Model model) {
        Product product = iProductService.getProduct(pid);

        //two list object for two kind of image: first, detail
        //first image for display on homepage, detail for display on detail page
        List<ProductImage> firstImageList = iProductImageService.list(pid, "firstImage");
        List<ProductImage> detailImageList = iProductImageService.list(pid, "detailImage");


        //for any data need to display on web, need to add to model
        model.addAttribute("product", product);
        model.addAttribute("firstImageList", firstImageList);
        model.addAttribute("detailImageList", detailImageList);

        return "manage/productImageList";




    }



}
