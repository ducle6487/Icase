package edu.hutech.Icase.Mapper;

import java.sql.SQLException;
import java.sql.ResultSet;
import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.PhoneModel;
import edu.hutech.Icase.Model.ProductModel;

public class PhoneMapper implements RowMapper<PhoneModel>{
	@Override
    public PhoneModel mapRow(ResultSet rs, int rowNum) throws SQLException {

        PhoneModel phone = new PhoneModel();
        phone.setIdphone(rs.getInt("idphone"));
        phone.setNamephone(rs.getString("namephone"));
        return phone;
    }
}
