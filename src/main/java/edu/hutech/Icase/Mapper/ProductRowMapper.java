package edu.hutech.Icase.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.AdminProductModel;

public class ProductRowMapper implements RowMapper<AdminProductModel> {

    @Override
    public AdminProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {

        AdminProductModel product = new AdminProductModel();
        product.setIdProduct(rs.getInt("idproduct"));
        product.setNameProduct(rs.getString("name"));
        product.setIdBrandPhone(rs.getInt("idphonebrand"));
        product.setPrice(rs.getLong("price"));
        product.setDescription(rs.getString("desciption"));
        product.setAmount(rs.getInt("amount"));
        product.setCaseBrand(rs.getString("casebrand"));
        product.setSold(rs.getInt("sold"));
        product.setDateAdded(rs.getString("dateadded"));

        return product;
    }

}
