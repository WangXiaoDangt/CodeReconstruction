package com.util;

import java.util.Date;
import java.util.UUID;

/**
 * @author ：信1605-1 HJJ
 * @date ：Created in 2019/4/26/026 13:09
 * @description： QQ479287006
 * @modified By：
 * @version: 1.0.1
 */
public class UUIDUtils {
    private static long num=0;

    public static String getUUID() {
        return UUID.randomUUID().toString();
    }

    /**
     * 主键生成器，已处理
     *
     * @return 32位的UUID
     */
    public static String getUUIDDispose() {
        return UUIDUtils.getUUID().replace("-", "");
    }


    /**
     * 根据字符串生成固定UUID
     * @param name
     * @return
     */
    public static synchronized String getUUID(String name){
        UUID uuid=UUID.nameUUIDFromBytes(name.getBytes());
        String str = uuid.toString();
        String uuidStr=str.replace("-", "");
        return uuidStr;
    }

    public static void main(String[] args) {
        System.out.println(getUUID("话加"));
    }

}
