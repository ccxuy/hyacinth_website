package com.hyacinth.model;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class IOTest {
	 /** urlΪ�����ļ��еĵ�ַ
     * ��ȡ���� 
     */ 
	public   String ReadDate(String url) {   
        String inf=null;
    	 try {  
             FileReader read = new FileReader(new File(url));  
             StringBuffer sb = new StringBuffer();  
             char ch[] = new char[1024];  
             int d = read.read(ch);  
             while(d!=-1){  
                 String str = new String(ch,0,d);  
                sb.append(str);  
                d = read.read(ch);  
              }  
              inf=sb.toString();  
         } catch (FileNotFoundException e) {  
              e.printStackTrace();  
         } catch (IOException e) {  
            e.printStackTrace();  
         } 
         return inf;
     }  
     /**
     * @param inf inf Ϊд�����Ϣ
     * @param url urlΪд��ĵ�ַ
     */
	public Passage WriteDate(String inf,String url,Passage psg) {  
        
        try{  
            File file = new File(url);  
            if (file.exists()) {  
                  
                file.delete();  
            }  
              
            file.createNewFile();  
              
            BufferedWriter output = new BufferedWriter(new FileWriter(file));  
            output.write(inf);   
            output.close();  
            
            //data base op
            psg.setUrl(url);
        } catch (Exception ex) {  
            System.out.println("Write HTML ERR:��"+ex);  
        }
		return psg;  
       
 }
	/**
	 * д��Resource�����ش���
	 * @param inf ��Ҫд���String
	 * @param url Ҫд���·�����ļ���
	 * @param res
	 * @return
	 */
	public boolean WriteResource(String inf,String url) {  
        
        try{  
            File file = new File(url);  
            if (file.exists()) {  
                  
                file.delete();  
            }  
              
            file.createNewFile();  
              
            BufferedWriter output = new BufferedWriter(new FileWriter(file));  
            output.write(inf);   
            output.close();  
            
            
        } catch (Exception ex) {  
            System.out.println("Write HTML ERR:��"+ex);  
            return false;
        }
		return true;  
       
 }
}
