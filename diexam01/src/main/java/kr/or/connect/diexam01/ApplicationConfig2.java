package kr.or.connect.diexam01;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("kr.or.connect.diexam01")//component scan에서 읽어들이는 어노테이션은 컨트롤러, 서비스, 레포지토리, 서비스 어노테이션을 찾아서 다 bean으로 등록시켜준다.
public class ApplicationConfig2 {

}
