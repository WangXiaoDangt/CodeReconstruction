package com.util;


import java.io.*;
import java.util.EmptyStackException;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class JavaFormUtil {


	public static void main(String[] args) {
	String str = readFile("C:\\Users\\wxd\\Desktop\\测试文件生产.java");
		str = formJava(str);
		System.out.println(str);
	}
	public static String readFile(String fileName) {
		String output = "";
		File file = new File(fileName);
		if(file.exists()){
			if(file.isFile()){
				try{
					BufferedReader input =new BufferedReader(new InputStreamReader(new FileInputStream(fileName),"UTF-8"));
					StringBuffer buffer = new StringBuffer();
					String text;
					while((text = input.readLine()) != null)
						buffer.append(text);
					output = buffer.toString();
				}
				catch(IOException ioException){
					System.err.println("File Error!");
				}
			}
			else if(file.isDirectory()){
				String[] dir = file.list();
				output += "Directory contents:/n";

				for(int i=0; i<dir.length; i++){
					output += dir[i] +"/n";
				}
			}
		}
		else{
			System.err.println("Does not exist!");
		}
		System.out.println(output.toString());
		return output;
	}

	/**
	 * @说明 ：格式化java代码
	 * @参数 ：@param dataTmp
	 * @参数 ：@return
	 * @返回 ：String
	 * @作者 ：WangXL
	 * @时间 ：2018 11 22
	 **/
	public static String formJava(String data) {
		String dataTmp = replaceStrToUUid(data,"\"");
		dataTmp = replaceStrToUUid(dataTmp,"'");
		dataTmp = repalceHHF(dataTmp,"\n","");
		dataTmp = repalceHHF(dataTmp,"{","{\n");
		dataTmp = repalceHHF(dataTmp,"}","}\n");
		dataTmp = repalceHHF(dataTmp,"/*","\n/*\n");
		dataTmp = repalceHHF(dataTmp,"* @","\n* @");
		dataTmp = repalceHHF(dataTmp,"*/","\n*/\n");
		dataTmp = repalceHHF(dataTmp,";",";\n");
		dataTmp = repalceHHF(dataTmp,"//","\n//");
		dataTmp = repalceHHFX(dataTmp,"\n");
		for(Map.Entry<String, String> r : mapZY.entrySet()){
			dataTmp = dataTmp.replace(r.getKey(),r.getValue());
		}
		if(dataTmp==null)
			return data;
		return dataTmp;
	}

	public static Map<String,String> mapZY = new HashMap<String,String>();
	/**
	 * @说明 ： 循环替换指定字符为随机uuid  并将uui存入全局map:mapZY   
	 * @参数 ：@param string   字符串
	 * @参数 ：@param type    指定字符
	 * @作者 ：WangXL
	 * @时间 ：2018 11 23
	 **/
	public static String replaceStrToUUid(String string,String type){
		Matcher slashMatcher = Pattern.compile(type).matcher(string);
		boolean bool = false;
		StringBuilder sb = new StringBuilder();
		int indexHome = -1; //开始截取下标
		while(slashMatcher.find()) {
			int indexEnd = slashMatcher.start();
			String tmp = string.substring(indexHome+1,indexEnd); //获取"号前面的数据
			if(indexHome == -1 ||bool == false){
				sb.append(tmp);
				bool = true;
				indexHome = indexEnd;
			}else{
				if(bool){
					String tem2 = "";
					for( int i=indexEnd-1 ; i>-1 ; i-- ){
						char c = string.charAt(i);
						if(c == '\\'){
							tem2 += c;
						}else{
							break;
						}
					}
					int tem2Len = tem2.length();
					if(tem2Len>-1){
						//结束符前有斜杠转义符 需要判断转义个数奇偶   奇数是转义了  偶数才算是结束符号
						if(tem2Len % 2==1){
							//奇数 非结束符
						}else{
							//偶数才算是结束符号
							String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
							uuid = type+uuid+type;
							mapZY.put(uuid, type+tmp+type);
							sb.append(uuid);
							bool = false;
							indexHome = indexEnd;
						}
					}
				}
			}
		}
		sb.append(string.substring(indexHome+1,string.length()));
		return sb.toString();
	}



	//处理换行
	public static String repalceHHF(String data,String a,String b){
		try{
			data = data.replace(a, "$<<yunwangA>>$<<yunwangB>>");
			String  arr[] = data.split("$<<yunwangA>>");
			StringBuilder result = new StringBuilder();
			if(arr != null){
				for(int i=0;i<arr.length;i++){
					String t = arr[i];
					result.append(t.trim());
					if(t.indexOf("//")!=-1 && "\n".equals(a)){
						result.append("\n");
					}
				}
			}
			String res = result.toString();
			res = res.replace("$<<yunwangB>>", b);
			res = res.replace("$<<yunwangA>>", "");
			return res;
		}catch(Exception e){
		}
		return null;
	}

	//处理缩进
	public static String repalceHHFX(String data,String a){
		try{
			String  arr[] = data.split(a);
			StringBuilder result = new StringBuilder();
			if(arr != null){
				String zbf = "    ";
				Stack<String> stack = new Stack<String>();
				for(int i=0;i<arr.length;i++){
					String tem = arr[i].trim();
					if(tem.indexOf("{")!=-1){
						String kg = getStack(stack,false);
						if(kg == null){
							result.append((tem+"\n"));
							kg = "";
						}else{
							kg = kg + zbf;
							result.append(kg+tem+"\n");
						}
						stack.push(kg);
					}else if(tem.indexOf("}")!=-1){
						String kg = getStack(stack,true);
						if(kg == null){
							result.append(tem+"\n");
						}else{
							result.append(kg+tem+"\n");
						}
					}else{
						String kg = getStack(stack,false);
						if(kg == null){
							result.append(tem+"\n");
						}else{
							result.append(kg+zbf+tem+"\n");
						}
					}
				}
			}
			String res = result.toString();
			return res;
		}catch(Exception e){}
		return null;
	}

	/**
	 * @说明 ： 获得栈数据
	 * @参数 ：@param stack 
	 * @参数 ：@param bool true 弹出  false 获取
	 * @时间 ：2018 11 22
	 **/
	public static String getStack(Stack<String> stack,boolean bool){
		String result = null;
		try{
			if(bool){
				return stack.pop();
			}
			return stack.peek();
		}catch(EmptyStackException  e){
		}
		return result;
	}

}
