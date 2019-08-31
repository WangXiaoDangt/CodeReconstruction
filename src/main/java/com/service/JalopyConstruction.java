package com.service;

import com.util.FileRead;
import com.util.FileUtils;
import java.io.FileReader;
import de.hunsicker.jalopy.Jalopy;
import java.io.File;
import java.util.ArrayList;
public class JalopyConstruction {

    public static void main(String[] args) {
        StringBuffer output = new StringBuffer();
        Jalopy j = new Jalopy();
        File file;
        FileRead fd = new FileRead();
        String leis = fd.read("C:\\Users\\wxd\\Desktop\\xxx.java");
//        j.setEncoding("UTF-8");
//        j.setInput(leis, "C:\\Users\\wxd\\Desktop\\xxx.java"); // 第二个参数随便填个java类名
//        j.setOutput(output);
//        j.format();
        j.setEncoding("GBK");
       // j.setInput(new File("C:\\Users\\wxd\\Desktop\\xxx.java"));
        j.setOutput(new File("C:\\Users\\wxd\\Desktop\\xxx.java"));
        j.format();
        // FileUtils.fileLinesWrite("C:\\Users\\wxd\\Desktop\\测试文件生产.java",output.toString(),false);
        System.out.println(output);

    }
}