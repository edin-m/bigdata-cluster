package io.leres.bigdata5.hbase;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.HBaseAdmin;

import java.io.IOException;

public class HBaseTestApp {

    public static final String HBASE_CONFIGURATION_ZOOKEEPER_QUORUM = "hbase.zookeeper.quorum";
    public static final String HBASE_CONFIGURATION_ZOOKEEPER_CLIENTPORT = "hbase.zookeeper.property.clientPort";

    public static void main(String[] args) {
        System.out.println("hello world");

        Configuration hConf = HBaseConfiguration.create();
        hConf.set(HBASE_CONFIGURATION_ZOOKEEPER_QUORUM, "localhost");
        hConf.set(HBASE_CONFIGURATION_ZOOKEEPER_CLIENTPORT, "2181");

        try {
            HBaseAdmin.available(hConf);

            System.out.println("hbase is available");
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        TableName table1 = TableName.valueOf("Table1");
        String family1 = "Family1";
        String family2 = "Family2";

        Admin admin;

        try {
            Connection connection = ConnectionFactory.createConnection();
            admin = connection.getAdmin();

            System.out.println("hbase is connect");
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        HTableDescriptor desc = new HTableDescriptor(table1);
        desc.addFamily(new HColumnDescriptor(family1));
        desc.addFamily(new HColumnDescriptor(family2));
        try {
            if (!admin.tableExists(table1)) {
                admin.createTable(desc);
            } else {
                System.out.println("Table already exists");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
