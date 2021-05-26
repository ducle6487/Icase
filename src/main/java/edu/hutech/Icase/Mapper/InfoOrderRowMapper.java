package edu.hutech.Icase.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.InfoOrderModel;

public class InfoOrderRowMapper implements RowMapper<InfoOrderModel> {

    @Override
    public InfoOrderModel mapRow(ResultSet rs, int numRow) throws SQLException {
        InfoOrderModel inf = new InfoOrderModel();
        inf.setIdproduct(rs.getInt("idproduct"));
        inf.setAmount(rs.getInt("amount"));
        inf.setTotal(rs.getLong("total"));
        inf.setPhone(rs.getString("phone"));
        inf.setColor(rs.getString("color"));

        return inf;
    }

}
