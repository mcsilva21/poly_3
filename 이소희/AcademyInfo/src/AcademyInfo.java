import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream.GetField;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

public class AcademyInfo {

	public static void main(String[] args) {
		final boolean sql = true;
		
		String url="http://openapi.academyinfo.go.kr/openapi/service/rest/BasicInformationService/getNoticeUniversitySearchList?serviceKey=vbiDzWZOlcY6ASD7xvGUYT6P4rSUj%2BreGdReSvLsT50TUkuhQAcRJFNpftMxakHKB0dnF9GXT6BALhoH7NI8iw%3D%3D&svyYr=2020&schlId=&schlKrnNm=&clgcpDivCd=&schlDivCd=&schlKndCd=&znCd=&estbDivCd=&numOfRows=999&pageNo=&";
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet req = new HttpGet(url);
		
		try {	
			File file;
			
			if(sql)
				file = new File("sql/academy_list.sql");
			else
				file = new File("out/academy_list.txt");
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(file));
			
			HttpResponse res = client.execute(req);
			
			if(res.getStatusLine().getStatusCode() == 200) {
				String body = EntityUtils.toString(res.getEntity(),"UTF-8");
				
				System.out.println(body);
				
				ObjectMapper mapper = new XmlMapper();
				
				AcademyResponse result = mapper.readValue(body, AcademyResponse.class);
				
				System.out.println(result.getHeader().getResultCode());
				System.out.println(result.getHeader().getResultMsg());
				
				//한국어 학교 이름(SchlKrnNm)만 출력하기
//				for(Item item : result.getBody().getItems()) {
//					System.out.println(item.getSchlKrnNm());
//					
//				}
				for(Item item : result.getBody().getItems()) {
					System.out.println(item);
					
					
					if(sql)
					//파일 출력
						writer.write(item.toSQL());
					else
						writer.write(item.toString());
							
					
					writer.newLine();
				}
				
				writer.close();
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		

	}

}
