package scWeb.data;

import java.sql.*;

import javax.sql.DataSource;
import javax.naming.InitialContext;
import scDomain.data.database.ConnectionProvider;

//rewrite as enum to enforce singleton pattern per EfffectiveJava
public class ConnectionPool implements ConnectionProvider {
    private static ConnectionPool pool = null;
    private static DataSource dataSource = null;
    
    private ConnectionPool() {
        try
        {
            InitialContext ic = new InitialContext();
            dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/scweb");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static ConnectionPool getInstance() {
        if (pool == null) {
            pool = new ConnectionPool();
        }
        return pool;
    }
    @Override
    public Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    //Do you free pooled connections by closing?
    @Override
    public void closeConnection(Connection c) {
        try {
            c.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void commit(Connection c) {
        try {
            c.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void rollback(Connection c) {
        try {
            c.rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}