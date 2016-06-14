package emusicstore.model.controller;



import emusicstore.model.dao.ProductDAO;
import emusicstore.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Controller
@RequestMapping("/")
public class HelloController {

    @Autowired
    private ProductDAO productDAO;

    @RequestMapping("/")
    public String home() {

        return "home";
    }

    @RequestMapping("/ProductList")
    public String getProducts(Model model) {
        List<Product> products = productDAO.getAllProducts();
        model.addAttribute("products", products);

        return "productList";

    }
    @RequestMapping("/ProductList/ViewProduct/{prodID}")
    public String getViewProduct(@PathVariable int prodID, Model model) throws IOException{
        Product product=productDAO.getProductByID(prodID);
        model.addAttribute(product);

        return "viewProduct";
    }

    @RequestMapping("/admin")
        public String adminPage() {
        return "admin";
    }
    @RequestMapping("/admin/productInventory")
    public String productInventory(Model model) {
        List<Product> products = productDAO.getAllProducts();
        model.addAttribute("products", products);

        return "productInventory";
    }

    @RequestMapping("/admin/productInventory/addProduct")
    public String addProduct(Model model){
        Product product = new Product();
        product.setProductCategory("instrument");
        product.setProductCondition("new");
        product.setProductStatus("active");

        model.addAttribute("product", product);

        return "addProduct";
    }
    @RequestMapping(value = "/admin/productInventory/addProduct",method = RequestMethod.POST)
    public String addProductPost(@Valid @ModelAttribute("product") Product product,BindingResult bindingResult,HttpServletRequest request){

        if(bindingResult.hasErrors()){

            return "addProduct";
        }

        productDAO.addProduct(product);


//        MultipartFile productImage = product.getProductImage();
//        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
//        Path path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + product.getProdID() + ".png");
//
//        if(productImage != null && !productImage.isEmpty()){
//            try {
//                productImage.transferTo(new File(path.toString()));
//            } catch (Exception ex){
//                ex.printStackTrace();
//                throw new RuntimeException("Product image saving failed", ex);
//            }
//        }
        return "redirect:/admin/productInventory";
    }
    @RequestMapping("/admin/productInventory/deleteProduct/{prodID}")
    public String deleteProduct (@PathVariable int prodID, Model model){
        Product product = productDAO.getProductByID(prodID);
            productDAO.deleteProduct(product);
        return "redirect:/admin/productInventory";
    }
    @RequestMapping("/admin/productInventory/editProduct/{prodID}")
        public String editProduct(@PathVariable("prodID") int prodID, Model model){
            Product product = productDAO.getProductByID(prodID);

            model.addAttribute(product);

            return "editProduct";
    }
    @RequestMapping(value = "/admin/productInventory/editProduct",method = RequestMethod.POST)
    public String editProductPost(@Valid @ModelAttribute("product") Product product,BindingResult bindingResult ,HttpServletRequest request) {

        if(bindingResult.hasErrors()){

            return "editProduct";
        }

        productDAO.editProduct(product);

        return "redirect:/admin/productInventory";
    }
}