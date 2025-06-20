package lk.gdse.cms.dao;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;

public class DBConnection {
    private static final BasicDataSource bds = new BasicDataSource();

    static {
        bds.setUrl("jdbc:mysql://localhost:3306/complaint_db");
        bds.setUsername("root");
        bds.setPassword("Ijse@1234");
        bds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        bds.setMinIdle(5);
        bds.setMaxIdle(10);
        bds.setMaxOpenPreparedStatements(100);
    }

    public static DataSource getDataSource() {
        return bds;
    }

    private DBConnection() {
    }
}
