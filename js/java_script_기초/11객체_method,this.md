### method: 객체 프로퍼티로 할당 된 **함수**

``` javascript
const superman = {
    name: 'clark',
    age: 33, 
    fly: function(){
        console.log('날아갑니다.')
    }
    
    // fly(){
	// 		console.log('날아갑니다.')
    // }
}
```



### 함수의 프로퍼티를 자기함수에서 호출

``` javascript
const user = {
    name: 'Mike',
    sayHello: function(){
        console.log(`Hello, I'm ${this.name}`);
    }
}
```





#### 화살표 함수는 this 가지지 않음

--> 외부에서 값을 가져옴 : 전역객체를 가르킴

--> 메소드에는 화살표함수 쓰지 않는 것이 좋음

* 전역객체
  * 브라우저: window
  * Node js: global

