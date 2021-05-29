package edu.hutech.Icase.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.PhoneModel;

public class PhoneRowMapper implements RowMapper<PhoneModel> {

    @Override
    public PhoneModel mapRow(ResultSet rs, int rowNum) throws SQLException {

        PhoneModel phone = new PhoneModel();
        phone.setIdphone(rs.getInt("idphone"));
        phone.setNamephone(rs.getString("namephone"));
        return phone;
    }

}
