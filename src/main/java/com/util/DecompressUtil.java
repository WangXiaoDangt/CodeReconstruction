package com.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

import com.github.junrar.Archive;
import com.github.junrar.rarfile.FileHeader;

import net.sf.sevenzipjbinding.ExtractOperationResult;
import net.sf.sevenzipjbinding.IInArchive;
import net.sf.sevenzipjbinding.ISequentialOutStream;
import net.sf.sevenzipjbinding.SevenZip;
import net.sf.sevenzipjbinding.SevenZipException;
import net.sf.sevenzipjbinding.impl.RandomAccessFileInStream;
import net.sf.sevenzipjbinding.simple.ISimpleInArchive;
import net.sf.sevenzipjbinding.simple.ISimpleInArchiveItem;

public class DecompressUtil {

    /**使用UTF-8编码避免压缩中文文件名乱码*/
    private static final String CHINESE_CHARSET = "utf-8";
    /**文件读取缓冲区大小*/
    private static final int CACHE_SIZE = 1024;


    public static  void  deCompress(String srcFilePath, String destDir){
        if (srcFilePath.toLowerCase().endsWith(".zip")) {
            unZip(srcFilePath, destDir);
        }
        else if (srcFilePath.toLowerCase().endsWith(".rar")) {
            unRarFile(srcFilePath, destDir);
        }else if (srcFilePath.toLowerCase().endsWith(".7z")) {
            un7ZipFile(srcFilePath, destDir);

        }
    }
    public static List<String>  unZip(String zipFilePath, String destDir) {
        File dFile=new File(destDir);
        List<String> javalist=new ArrayList<String>();
        if (!dFile.exists()) {
            dFile.mkdirs();
        }
        ZipFile zipFile = null;
        try {
            BufferedInputStream bis = null;
            FileOutputStream fos = null;
            BufferedOutputStream bos = null;
            zipFile = new ZipFile(zipFilePath, CHINESE_CHARSET);
            Enumeration<ZipEntry> zipEntries = zipFile.getEntries();
            File file, parentFile;
            ZipEntry entry;

            byte[] cache = new byte[CACHE_SIZE];
            while (zipEntries.hasMoreElements()) {
                entry = (ZipEntry) zipEntries.nextElement();
                //System.out.println("1------------"+entry);
                if(entry.toString().toLowerCase().endsWith(".java")) {//获取所有.java文件
                    //System.out.println("1------------" +entry.toString().substring(entry.toString().lastIndexOf("/")+1));
                    //javalist.add(entry.toString().substring(entry.toString().lastIndexOf("/")+1));
                    //System.out.println(entry.toString());
                    javalist.add(entry.toString());
                }
                if (entry.isDirectory()) {
                    new File(destDir + entry.getName()).mkdirs();//创建一个新的文件夹
                    continue;
                }
                bis = new BufferedInputStream(zipFile.getInputStream(entry));
                file = new File(destDir+File.separator+entry.getName());
                parentFile = file.getParentFile();

                if (parentFile != null && (!parentFile.exists())) {
                    parentFile.mkdirs();
                }
                fos = new FileOutputStream(file);
                bos = new BufferedOutputStream(fos, CACHE_SIZE);
                int readIndex = 0;
                while ((readIndex = bis.read(cache, 0, CACHE_SIZE)) != -1) {
                    fos.write(cache, 0, readIndex);
                }

                bos.flush();
                bos.close();
                fos.close();
                bis.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            try {
                zipFile.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return javalist;
    }

    public static void unRarFile(String srcRarPath, String dstDirectoryPath) {
        File dstDiretory = new File(dstDirectoryPath);
        if (!dstDiretory.exists()) {// 目标目录不存在时，创建该文件夹
            dstDiretory.mkdirs();
        }
        Archive a = null;
        try {
            a = new Archive(new File(srcRarPath));
            if (a != null) {
                FileHeader fh = a.nextFileHeader();
                while (fh != null) {
                    String fileName = fh.getFileNameW().isEmpty()?fh.getFileNameString():fh.getFileNameW();
                    if (fh.isDirectory()) {
                        File fol = new File(dstDirectoryPath + File.separator
                                + fileName);
                        fol.mkdirs();
                    } else {
                        File out = new File(dstDirectoryPath + File.separator
                                + fileName.trim());

                        try {
                            if (!out.exists()) {
                                if (!out.getParentFile().exists()) {
                                    out.getParentFile().mkdirs();
                                }
                                out.createNewFile();
                            }
                            FileOutputStream os = new FileOutputStream(out);
                            a.extractFile(fh, os);
                            os.close();
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                    fh = a.nextFileHeader();
                }
                a.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static  void un7ZipFile(String filepath,final String targetFilePath){

        final File file = new File(targetFilePath);
        if (!file.exists()) {
            file.mkdirs();
        }
        RandomAccessFile randomAccessFile = null;
        IInArchive inArchive = null;

        try {
            randomAccessFile = new RandomAccessFile(filepath, "r");
            inArchive = SevenZip.openInArchive(null,
                    new RandomAccessFileInStream(randomAccessFile));

            ISimpleInArchive simpleInArchive = inArchive.getSimpleInterface();

            for (final ISimpleInArchiveItem item : simpleInArchive.getArchiveItems()) {
                final int[] hash = new int[] { 0 };
                if (!item.isFolder()) {
                    ExtractOperationResult result;

                    final long[] sizeArray = new long[1];
                    result = item.extractSlow(new ISequentialOutStream() {
                        public int write(byte[] data) throws SevenZipException {

                            FileOutputStream fos=null;
                            try {
                                File tarFile=new File(file+File.separator+item.getPath());
                                if (!tarFile.getParentFile().exists()) {
                                    tarFile.getParentFile().mkdirs();
                                }
                                tarFile.createNewFile();
                                fos = new FileOutputStream(tarFile.getAbsolutePath());
                                fos.write(data);
                                fos.close();

                            } catch (FileNotFoundException e) {
                                e.printStackTrace();
                            } catch (IOException e) {

                                e.printStackTrace();
                            }

                            hash[0] ^= Arrays.hashCode(data);
                            sizeArray[0] += data.length;
                            return data.length;
                        }
                    });
                    if (result == ExtractOperationResult.OK) {
                        // System.out.println(String.format("%9X | %10s | %s", //
                        //  hash[0], sizeArray[0], item.getPath()));
                    } else {
                        // System.err.println("Error extracting item: " + result);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        } finally {
            if (inArchive != null) {
                try {
                    inArchive.close();
                } catch (SevenZipException e) {
                    e.printStackTrace();
                }
            }
            if (randomAccessFile != null) {
                try {
                    randomAccessFile.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


//   public static void main(String[] args) {
//       String  file="C:\\Users\\\\wxd\\Desktop\\reconstruction.zip";
//       // String path=request.getSess
//        List<String> javalist=new ArrayList<String>();
//       javalist=DecompressUtil.unZip(file,"D:\\");
//       for(String name:javalist)
//       {
//           System.out.println(name);
//        }
//    }

}