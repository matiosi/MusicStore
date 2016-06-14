package emusicstore.model.dao;

import emusicstore.model.Product;

import java.util.List;

/**
 * Created by mateusz.osiak on 2016-06-07.
 */


public interface ProductDAO {

    void addProduct(Product product);

    Product getProductByID(int id);

    List<Product> getAllProducts();

    void deleteProduct(Product product);


    void editProduct(Product product);
}
