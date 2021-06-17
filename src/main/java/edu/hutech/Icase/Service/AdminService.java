package edu.hutech.Icase.Service;

import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import static java.time.DayOfWeek.MONDAY;
import static java.time.temporal.TemporalAdjusters.previousOrSame;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.hutech.Icase.Mapper.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import edu.hutech.Icase.Model.AdminProductModel;
import edu.hutech.Icase.Model.ColorModel;
import edu.hutech.Icase.Model.InfoOrderModel;
import edu.hutech.Icase.Model.OrderHistoryModel;
import edu.hutech.Icase.Model.PhoneBrandModel;
import edu.hutech.Icase.Model.PhoneModel;
import edu.hutech.Icase.Model.ProductValueModel;

@Service
public class AdminService {

    @Autowired
    public JdbcTemplate jdbcTemplate;

    public boolean islogedIn(HttpSession session) {

        if (session.getAttribute("username") == null) {
            return false;
        }
        return true;
    }

    public int countOrder(int[] input) {

        int result = 0;

        for (int i = 0; i < input.length; i++) {
            result = result + input[i];
        }

        return result;
    }

    public final long MILLIS_IN_A_DAY = 1000 * 60 * 60 * 24;

    public Date findNextDay(Date date) {
        return new Date(date.getTime() + MILLIS_IN_A_DAY);
    }

    public Date findPreviousDay(Date date) {
        return new Date(date.getTime() - MILLIS_IN_A_DAY);
    }

    public List<String> convertArrayToList(String[] arr) {
        ArrayList<String> list = new ArrayList<String>();
        for (int i = 0; i < arr.length; i++) {
            if (!arr[i].isEmpty()) {
                list.add(arr[i]);
            }

        }
        return list;
    }

    public int getIdBrandByNameBrand(String name) {

        List<PhoneBrandModel> listPhoneBrand = getAllPhoneBrand();

        for (PhoneBrandModel phoneBrandModel : listPhoneBrand) {
            if (phoneBrandModel.name.equals(name)) {
                return phoneBrandModel.idPhoneBrand;
            }
        }
        return -1;
    }

    public List<AdminProductModel> getAllProduct() {

        String sql = "select * from product";

        List<AdminProductModel> list = jdbcTemplate.query(sql, new ProductRowMapper());

        return list;
    }

    public AdminProductModel findProduct(int id) {

        String sql = "select * from product where idproduct=?";

        List<AdminProductModel> list = jdbcTemplate.query(sql, new ProductRowMapper(), new Object[] { id });

        return list.get(0);
    }

    public List<ColorModel> getAllColor() {
        String sql = "select distinct color from color";

        return jdbcTemplate.query(sql, new ColorRowMapper());

    }

    public List<ColorModel> findColorByIdProduct(int id) {
        String sql = "select * from color where idproduct = ?";
        return jdbcTemplate.query(sql, new ColorRowMapper(), Integer.toString(id));
    }

    public List<PhoneBrandModel> getAllPhoneBrand() {
        String sql = "select * from phonebrand";
        return jdbcTemplate.query(sql, new PhoneBrandRowMapper());
    }

    public PhoneBrandModel findPhoneBrandById(int id) {
        String sql = "select * from phonebrand where idphonebrand = ?";
        List<PhoneBrandModel> list = jdbcTemplate.query(sql, new PhoneBrandRowMapper(), Integer.toString(id));
        return list.get(0);
    }

    public PhoneBrandModel findIdPhoneBrandByName(String name) {
        String sql = "select * from phonebrand where name = ?";
        List<PhoneBrandModel> list = jdbcTemplate.query(sql, new PhoneBrandRowMapper(), name);
        return list.get(0);
    }

    public List<PhoneModel> findPhoneByIdProduct(int id) {
        String sql = "select a.idphone, namephone from device a, Phone b where a.idphone = b.IdPhone and idproduct = ?";
        return jdbcTemplate.query(sql, new PhoneRowMapper(), Integer.toString(id));
    }

    public List<OrderHistoryModel> getAllOrderHistory() {
        String sql = "select a.IdOrder as idorder, b.Name as namecustomer, Phone as phone, Address as address, DateOrder as dateorder, Message as message, c.NameMethod as methodpayment, e.name as paymentstatus, d.name as deliverystatus, b.Total as totalprice from history a, orders b, methodpayment c, DeliveryStatus d, PaymentStatus e where a.IdOrder = b.idOrder and a.IdMethod = c.IdMethod and d.idStatus = a.IdStatusDelivery and e.idStatus = a.idStatusPayment";
        return jdbcTemplate.query(sql, new OrderHistoryRowMapper());
    }

    public List<OrderHistoryModel> getRecent24hOrderHistory() {

        String sql = "select distinct a.IdOrder as idorder, b.Name as namecustomer, Phone as phone, Address as address, DateOrder as dateorder, Message as message, c.NameMethod as methodpayment, e.name as paymentstatus, d.name as deliverystatus, b.Total as totalprice from history a, orders b, methodpayment c, DeliveryStatus d, PaymentStatus e where a.IdOrder = b.idOrder and a.IdMethod = c.IdMethod and d.idStatus = a.IdStatusDelivery and e.idStatus = a.idStatusPayment and DateOrder >= DATEADD(day, -1, GETDATE()) order by dateorder";
        return jdbcTemplate.query(sql, new OrderHistoryRowMapper());

    }

    public List<OrderHistoryModel> getAllOrderHistoryByIdOrder(int idorder) {
        String sql = "select a.IdOrder as idorder, b.Name as namecustomer, Phone as phone, Address as address, DateOrder as dateorder, Message as message, c.NameMethod as methodpayment, e.name as paymentstatus, d.name as deliverystatus, b.Total as totalprice from history a, orders b, methodpayment c, DeliveryStatus d, PaymentStatus e where a.IdOrder = b.idOrder and a.IdMethod = c.IdMethod and d.idStatus = a.IdStatusDelivery and e.idStatus = a.idStatusPayment and a.IdOrder = ?";

        return jdbcTemplate.query(sql, new OrderHistoryRowMapper(), idorder);
    }

    public List<InfoOrderModel> getInfoOrderByIdOrder(int idorder) {
        String sql = "select IdProduct as idproduct, Amount as amount, a.Color as color, b.namephone as phone, a.Total as total from infoorder a, phone b where a.Phone = b.idphone and a.IdOrder = ?";
        return jdbcTemplate.query(sql, new InfoOrderRowMapper(), idorder);
    }

    public List<String> getAllPhoneByBrand(int idbrand) {
        String sql = "select namephone from Phone where idphonebrand = ?";
        return jdbcTemplate.query(sql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet rs, int numRow) throws SQLException {
                return rs.getString("namephone");
            }
        }, idbrand);
    }

    public String getJsonPhoneByBrand() throws JsonProcessingException {

        List<PhoneBrandModel> listKey = getAllPhoneBrand();
        Map<String, String[]> dic = new Hashtable<String, String[]>();

        for (PhoneBrandModel k : listKey) {
            List<String> l = getAllPhoneByBrand(k.idPhoneBrand);
            String[] v = new String[l.size()];
            for (int i = 0; i < l.size(); i++) {
                v[i] = l.get(i);
            }
            dic.put(k.name, v);
        }
        return new ObjectMapper().writeValueAsString(dic);

    }

    public int[] getListOrderCountInThisWeek() {

        Date today = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
        Date monday = Date
                .from(LocalDate.now().with(previousOrSame(MONDAY)).atStartOfDay(ZoneId.systemDefault()).toInstant());

        int index = -1;

        Date nextDate = findPreviousDay(monday);

        long difference = today.getTime() - monday.getTime();
        float daysBetween = (difference / (1000 * 60 * 60 * 24));
        int[] list = new int[(int) daysBetween + 1];
        do {

            nextDate = findNextDay(nextDate);
            index++;
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String dateToString = df.format(nextDate);

            String sql = "select count(*) as counter from orders where convert(date,DateOrder,102)=?";

            List<Integer> ls = jdbcTemplate.query(sql, new RowMapper<Integer>() {

                @Override
                public Integer mapRow(ResultSet rs, int numRow) throws SQLException {
                    return Integer.valueOf(rs.getInt("counter"));

                }

            }, dateToString);

            if (!ls.isEmpty()) {
                list[index] = ls.get(0).intValue();
            }

        } while (!nextDate.equals(today));

        return list;
    }

    public int[] getListOrderCountInThisYear() {

        LocalDate today = LocalDate.now();

        String thisMonth = today.format(DateTimeFormatter.ofPattern("MM"));
        String thisYear = today.format(DateTimeFormatter.ofPattern("yyyy"));

        int[] list = new int[Integer.parseInt(thisMonth)];

        for (int i = 1; i <= Integer.parseInt(thisMonth); i++) {

            String sql = "select count(*) as counter from orders where MONTH(DateOrder)=? and YEAR(DateOrder)=?";

            List<Integer> ls = jdbcTemplate.query(sql, new RowMapper<Integer>() {

                @Override
                public Integer mapRow(ResultSet rs, int numRow) throws SQLException {
                    return Integer.valueOf(rs.getInt("counter"));

                }

            }, i, thisYear);

            if (!ls.isEmpty()) {
                list[i - 1] = ls.get(0).intValue();
            }

        }

        return list;
    }

    public Long getSumPriceThisWeek() {

        LocalDate today = LocalDate.now();
        LocalDate monday = LocalDate.now().with(previousOrSame(MONDAY));

        String mondayStr = monday.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String todayStr = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        System.out.println(mondayStr);
        System.out.println(todayStr);

        String sql = "select sum(Total) as sumtotal from orders a, history b where DateOrder >= ? and DateOrder <= GETDATE() and a.IdOrder = b.IdOrder and b.IdStatusDelivery = 3";

        List<Long> ls = jdbcTemplate.query(sql, new RowMapper<Long>() {

            @Override
            public Long mapRow(ResultSet rs, int numRow) throws SQLException {
                return rs.getLong("sumtotal");
            }

        }, mondayStr);

        if (!ls.isEmpty()) {
            return ls.get(0);
        }

        return 0l;
    }

    public Long getSumPriceThisMonth() {

        LocalDate today = LocalDate.now();
        String todayStr = today.format(DateTimeFormatter.ofPattern("MM"));

        String sql = "select sum(Total) as sumtotal from orders a, history b where MONTH(DateOrder)=? and a.IdOrder = b.IdOrder and b.IdStatusDelivery = 3";

        List<Long> ls = jdbcTemplate.query(sql, new RowMapper<Long>() {

            @Override
            public Long mapRow(ResultSet rs, int numRow) throws SQLException {
                return rs.getLong("sumtotal");
            }

        }, todayStr);

        if (!ls.isEmpty()) {
            return ls.get(0);
        }

        return 0l;
    }

    public Long getSumPriceThisYear() {

        LocalDate today = LocalDate.now();
        String todayStr = today.format(DateTimeFormatter.ofPattern("yyyy"));

        String sql = "select sum(Total) as sumtotal from orders a, history b where YEAR(DateOrder)=? and a.IdOrder = b.IdOrder and b.IdStatusDelivery = 3";

        List<Long> ls = jdbcTemplate.query(sql, new RowMapper<Long>() {

            @Override
            public Long mapRow(ResultSet rs, int numRow) throws SQLException {
                return rs.getLong("sumtotal");
            }

        }, todayStr);

        if (!ls.isEmpty()) {
            return ls.get(0);
        }

        return 0l;
    }

    public int updateDeliveryStatus(int status, int idorder, boolean isCOD) {

        String sql = "update history set IdStatusDelivery = ? where IdOrder = ?";
        if (isCOD) {
            sql = "update history set IdStatusPayment = 2, IdStatusDelivery = 3 where IdOrder = ?";
            return jdbcTemplate.update(sql, idorder);
        }

        return jdbcTemplate.update(sql, status, idorder);

    }

    public int updatePaymentStatus(int idorder) {
        String sql = "update history set IdStatusPayment = 2 where IdOrder = ?";
        return jdbcTemplate.update(sql, idorder);
    }

    public int deleteProduct(int idproduct) {
        String sql = "delete from product where idproduct = ?";
        return jdbcTemplate.update(sql, idproduct);
    }

    public int addNewPhoneBrand(String phoneBrand) {
        String sql = "insert into phonebrand(name) values(?)";
        return jdbcTemplate.update(sql, phoneBrand);
    }

    public int addNewPhone(String phone) {
        String sql = "insert into Phone(namephone) values(?)";
        return jdbcTemplate.update(sql, phone);
    }

    public int getIdPhoneByName(String name) {
        String sql = "select idphone from Phone where namephone = ?";
        List<Integer> l = jdbcTemplate.query(sql, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet rs, int numRow) throws SQLException {
                return Integer.valueOf(rs.getInt("idphone"));
            }
        }, name);
        if (!l.isEmpty()) {
            return l.get(0).intValue();
        }
        return 0;
    }

    public int addNewProduct(ProductValueModel product) {
        PhoneBrandModel idbp = findIdPhoneBrandByName(product.phonebrand);
        String sql = "insert into product(name,idphonebrand,price,desciption,amount,casebrand,sold,dateadded) output inserted.idproduct values(?,?,?,?,?,?,0,GETDATE())";
        List<Integer> l = jdbcTemplate.query(sql, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet rs, int numRow) throws SQLException {
                return Integer.valueOf(rs.getInt("idproduct"));
            }
        }, product.name, idbp.idPhoneBrand, product.price, product.description, product.amount, product.brand);
        if (!l.isEmpty()) {
            return l.get(0).intValue();
        }
        return 0;
    }

    public int updateProduct(ProductValueModel product) {
        PhoneBrandModel pb = findIdPhoneBrandByName(product.phonebrand);
        String sql = "update product set name=?,idphonebrand=?,price=?,desciption=?,amount=?,casebrand=? where idproduct=?";
        return jdbcTemplate.update(sql, product.name, pb.idPhoneBrand, product.price, product.description,
                product.amount, product.brand, product.idproduct);
    }

    public int deleteOldColor(int idproduct) {
        String sql = "delete from color where idproduct = ?";
        return jdbcTemplate.update(sql, idproduct);
    }

    public int addNewColor(int idproduct, String name) {
        String sql = "insert into color values(?,?)";
        return jdbcTemplate.update(sql, idproduct, name);
    }

    public int deleteOldDevice(int idproduct) {
        String sql = "delete from device where idproduct = ?";
        return jdbcTemplate.update(sql, idproduct);
    }

    public int addNewDevice(int idproduct, int idphone) {
        String sql = "insert into device values(?,?)";
        return jdbcTemplate.update(sql, idproduct, idphone);
    }

    public int addNewImage(String name, int idproduct) {
        String sql = "insert into image(name,idproduct) values(?,?)";
        return jdbcTemplate.update(sql, name, idproduct);
    }

    public int checkLogin(String username, String password) {
        String sql = "select count(*) as counter from Admin where binary_checksum(username) = BINARY_CHECKSUM(?) and BINARY_CHECKSUM(password) = BINARY_CHECKSUM(?)";
        List<Integer> l = jdbcTemplate.query(sql, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                return Integer.valueOf(rs.getInt("counter"));
            }
        }, username, password);
        if (!l.isEmpty()) {
            return l.get(0).intValue();
        }
        return 0;
    }
}
