package edu.hutech.Icase.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.ProductModel;

public class ProductMapper implements RowMapper<ProductModel>{
	@Override
    public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {

        ProductModel product = new ProductModel();
        product.setIdProduct(rs.getInt("idproduct"));
        product.setName(rs.getString("name"));
        product.setIdPhoneBrand(rs.getInt("idphonebrand"));
        product.setPrice(rs.getLong("price"));
        product.setDescription(rs.getString("desciption"));
        product.setAmount(rs.getInt("amount"));
        product.setCaseBrand(rs.getString("casebrand"));
        product.setSold(rs.getInt("sold"));
        product.setDateAdded(rs.getString("dateadded"));

        return product;
    }
}
