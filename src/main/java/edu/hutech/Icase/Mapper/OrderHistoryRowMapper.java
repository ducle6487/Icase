package edu.hutech.Icase.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.OrderHistoryModel;

public class OrderHistoryRowMapper implements RowMapper<OrderHistoryModel> {

    @Override
    public OrderHistoryModel mapRow(ResultSet rs, int rowNum) throws SQLException {

        OrderHistoryModel ord = new OrderHistoryModel();
        ord.setIdorder(rs.getInt("idorder"));
        ord.setNamecustomer(rs.getString("namecustomer"));
        ord.setPhone(rs.getString("phone"));
        ord.setAddress(rs.getString("address"));
        ord.setDateorder(rs.getString("dateorder"));
        ord.setMessage(rs.getString("message"));
        ord.setMethodpayment(rs.getString("methodpayment"));
        ord.setPaymentstatus(rs.getString("paymentstatus"));
        ord.setDeliverystatus(rs.getString("deliverystatus"));
        return ord;
    }

}
