// 7. object
// class: object생성하기 위한 template(type)
//        현실세계의 요구사항을 추상화하여 속성과 기능을 표현한 템플릿
// object: class type으로 생성된 변수
//         클래스로 생성된 변수
//         클래스 new(초기화) 생성자를 통해 인스턴스화된 변수


// 1) class 선언(ECMA6 - class 키워드 존재)
// class 클래스이름{
//     변수;
//     메소드(함수);
// }
//<ex>
// class person{
//     name="";
//     age=0;

//     constructor(name, age){
//         this.name=name;
//         this.age=age;
//     }
// }
//this 주의! - 꼭 들어가야함
class Person{
    _name="";
    _age=0;

    constructor(name, age){
        this._name=name;
        this._age=age;
    }

    print(){
         console.log(`이름: ${this._name}  나이:${this._age}`);
    }
    //computed
    get brithYear(){
        return 2021-this._age+1;
    }
    //action
    set brithYear(year){
        this._age = 2021-year+1;
    }
}
let p=new Person("권혜영", 25);
 //p.birthYear(1997) - not a function error - Type error
p.brithYear=1997;

console.log(`${p._name}님 ${p.brithYear}년 출생`);
p.print();

// 2) function 객체로 선언
function Student(name, age, major) {
    this._name = name;
    this._age = age;
    this._major = major;
    this.print=function () {
        console.log(`이름: ${this._name}  나이: ${this._age} 전공: ${this._major}`);
    }    
}
let s=new Student("허성현", 26, "컴퓨터공학과");
s.print();
//훅?

// 3) json(Javascript Objetc Notation) - data표현법
// function의 불편함을 해결하기위한 표현법
// data교환에 쓰임
let e = {person:{name:'한로빈', age:28}, department:'연구소', arry:[1,2,3], male: "True"};
let arry = [{name:'박기윤', age:28}, 1, [1,2,3], "null", "false", 'name'];
console.log(e);
console.log(arry)




// 역할별로 클래스를 나눠서 써야 재사용성이 높아져서 넓어지는 fron-end의 범위를 커버 할 수 있다.