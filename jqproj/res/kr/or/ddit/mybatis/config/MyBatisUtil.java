package kr.or.ddit.mybatis.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	static SqlSessionFactory sqlSessionFactory = null;
	static SqlSession session = null;

	static {

		// 1) MyBatis의 환경 설정 파일(mybatis-config.xml)을 읽어와서 처리하여
		// SplSessionFactory 객체 생성한다

		InputStream in = null;
		try {
			// 1-1) 환경 설정 파일을 읽어올 스트림 객체 생성
			in = Resources.getResourceAsStream("kr/or/ddit/mybatis/config/mybatis-config.xml");
			// 1-2) 환경 설정 파일을 읽어와 환경 설정을 완성한 후 SqlSessionFactory객체를 생성한다.
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
		} catch (Exception e) {
			System.out.println("MyBatis 초기화 실패");
			e.printStackTrace();
		} finally {
			if (in != null)
				try {
					in.close();
				} catch (IOException e) {
				}
		}
	}
	
	public static SqlSession getSqlSession() {
		
		session = sqlSessionFactory.openSession();
		
		return session;
	}
}