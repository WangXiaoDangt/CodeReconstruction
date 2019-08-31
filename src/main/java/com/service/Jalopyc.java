package com.service;

import com.util.FileUtils;
import de.hunsicker.jalopy.Jalopy;

/**
 * @author ：
 * @date ：Created in 2019/4/26/026 13:41
 * @description： QQ479287006
 * @modified By：
 * @version: 1.0.1
 */
public class Jalopyc{

    public static String jaloyc(String  str,String leiming) {
        StringBuffer output = new StringBuffer();
        Jalopy j = new Jalopy();
        j.setEncoding("UTF-8");
        j.setInput(str,leiming); // 第二个参数随便填个java类名
        j.setOutput(output);
        j.format();
        FileUtils.fileLinesWrite("C:\\Users\\wxd\\Desktop\\测试文件生产.java",output.toString(),false);
        System.out.println(output);
        return output.toString();
    }
}
