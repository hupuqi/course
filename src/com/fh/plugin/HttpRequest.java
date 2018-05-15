package com.fh.plugin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class HttpRequest {
	public static String sendPost(String url, String param) {
		PrintWriter out = null;
		BufferedReader in = null;
		String result = "";
		try {
			URL realUrl = new URL(url);
			// 鎵撳紑鍜孶RL涔嬮棿鐨勮繛鎺�
			HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();
			// 璁剧疆閫氱敤鐨勮姹傚睘鎬�
			conn.setRequestProperty("accept", "*/*");
			conn.setRequestProperty("connection", "Keep-Alive");
			conn.setRequestProperty("user-agent",
					"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			// 鍙戦�丳OST璇锋眰蹇呴』璁剧疆濡備笅涓よ
			conn.setDoOutput(true);
			conn.setRequestProperty("Content-Type","text/xml");
			conn.setDoInput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Charsert", "UTF-8");
			// 鑾峰彇URLConnection瀵硅薄瀵瑰簲鐨勮緭鍑烘祦
			out = new PrintWriter(conn.getOutputStream());
			// 鍙戦�佽姹傚弬鏁�
			System.out.println(param);
			out.print(param);
			// flush杈撳嚭娴佺殑缂撳啿
			out.flush();
			// 瀹氫箟BufferedReader杈撳叆娴佹潵璇诲彇URL鐨勫搷搴�
			in = new BufferedReader(
					new InputStreamReader(conn.getInputStream(),"utf-8"));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			System.out.println("鍙戦�� POST 璇锋眰鍑虹幇寮傚父锛�"+e);
			e.printStackTrace();
		}
		//浣跨敤finally鍧楁潵鍏抽棴杈撳嚭娴併�佽緭鍏ユ祦
		finally{
			try{
				if(out!=null){
					out.close();
				}
				if(in!=null){
					in.close();
				}
			}
			catch(IOException ex){
				ex.printStackTrace();
			}
		}
		return result;
	}
}
