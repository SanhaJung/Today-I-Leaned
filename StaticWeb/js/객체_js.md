# 객체

* 추상화: 복잡한 현실세계를 요구사항에 맞도록 단순화

* 도메인추상화(?)

* event stoming

* 엔티티 클래스

* 왜 js도 객체 프로그래밍언어인가?

  * front-end가 복잡해짐
  * 복잡해지면 재사용율을 높여야함
  * 객체를 사용하면 재사용성 높아짐

  ### **현실세계**							--->						프로그래밍세계

복잡													요구사항 단순화

ex) car-속성, 기능								(Abstraction)						ex) Car (Class)

​																												-- 속성(attribute):name, color, cc

​																												-- 기능(operation): run(), stop()

​																																|

​																																| instance화(data handling 가능)

​																																| 

​																																\/

​																												           **Object**

​																												car 정산하 = 

​																												new Car();  //(생성자) 초기화

​																												

​																												정산하.name="아우디";

​																												정산하.color="검정";

​																												정산하.cc=3000;


​																												박지수.run();



* this주의
* 클래스는 대문자로 시작