package kr.or.connect.diexam01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextExam01 {

	public static void main(String[] args) {
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");//applicationContext.xml에 bean 정보를 넣어놨으니 이 정보를 읽어들여서 만들어달라는 의미
		System.out.println("초기화 완료");
		
		UserBean userBean = (UserBean)ac.getBean("userBean");
		userBean.setName("seonggyeong");
		
		System.out.println(userBean.getName());
		
		UserBean userBean2 = (UserBean)ac.getBean("userBean");
		
		if(userBean == userBean2)
			System.out.println("같은 인스턴스입니다.");
	}

}
