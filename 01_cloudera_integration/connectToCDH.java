// File: connectToCDH.java
package com.mastercard.cloudera;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.net.URI;

public class connectToCDH {
    public static void main(String[] args) throws Exception {
        // Load Cloudera CDH configuration
        Configuration conf = new Configuration();
        conf.addResource(new Path("src/main/resources/cloudera-config.xml"));

        // Connect to HDFS
        URI hdfsUri = new URI("hdfs://cdh-master:8020");
        String user = System.getProperty("user.name");
        FileSystem fs = FileSystem.get(hdfsUri, conf, user);

        System.out.println("Connected to filesystem: " + fs.getUri());
        // Example operation: list root directory
        for (Path p : fs.listStatus(new Path("/"))) {
            System.out.println(p);
        }
        fs.close();
    }
}
