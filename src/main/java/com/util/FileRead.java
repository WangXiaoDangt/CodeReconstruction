package com.util;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.FileInputStream;
public class FileRead{

//    public static void main(String[] args) {
//        // TODO Auto-generated method stub
//        List<String> leis = new ArrayList<>();
//        leis=readFileByLines("C:\\Users\\wxd\\Desktop\\ShoppingSpider.java");
//        for ( String lei : leis ) {
//
//            System.out.println( lei );
//        }
//    }
    public static List<String> readFileByLines(String fileName) {
        File file = new File(fileName);
        BufferedReader reader = null;
        List<String> hangs = new ArrayList<>();
        try {
            //System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(fileName),"UTF-8"));
            String tempString = null;
            int line = 1;            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {                // 显示行号
                //System.out.println("line " + line +": " + tempString);
                hangs.add(tempString);
                line++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {

                }
            }
        }
        return hangs;
    }

    public static String read(String fileName)
    {
        String str="";
        File file=new File(fileName);
        try {
            FileInputStream in=new FileInputStream(file);
            // size  为字串的长度 ，这里一次性读完
            int size=in.available();
            byte[] buffer=new byte[size];
            in.read(buffer);
            in.close();
            str=new String(buffer,"utf-8");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            return null;
        }
        return str;
    }

}


