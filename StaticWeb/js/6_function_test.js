// 1. javascript는 일급함수
// 함수 정의, 함수 호출해서 사용
// 정의: function 함수명([parameter, parameter, ....]) {
        //     구현;
        //     [return Data;]
        // }
// 호출: let data = 함수명([parameter값, parameter값])
// Parameter, return data에 함수 사용 가능
// ====
//let functionV = function([parameter, parameter, ....]){
//     구현;
//     [return data;]
// }   
// functionV :함수 객체
// arrow function: ([parameter, parameter, ...]) => {구현 [return data;]} // 일회용(초기화 등에 사용)

//1)선언적 함수 - 변수선언 이전에 호출 가능
//함수정의
function add(x, y) {
    return x+y;
}

//함수 사용
let sum = add(10, 20);   //타입이 명확하지 않다면 함수에서 typeof로 점검해주기
console.log("add(10, 20)", sum);

//2) 익명함수 - 변수를 함수처럼 이용 / 변수 선언 이후에 호출
let substract = function(x, y){
    return x-y;
}
console.log("substract(20, 10) = ", substract(20, 10), typeof substract, substract)

//3) arrow function(즉시실행 함수) - 한번만 쓰일 event에 
let divide = (x, y) => console.log('divide(x, y)',x/y); //다른언어는 람다식으로 존재
divide(20, 10)
// = //
let divide2 = (x, y) => {return x/y};
console.log('divide2(x, y)', divide2(20, 10)); 

// 함수 선언 및 실행
let multiply = ((x, y) => {console.log(`multiply(${x}*${y}):`, x*y) })(20, 10);

// 클로져
// 함수에서 다른 함수를 리턴
// (지역변수를 외부에서 사용가능하게 함 - life cycle 끝난 로컬변수를 사용할 수 있다.)
function makeAdder(x){
    let y = 1;        // makeAdder function local variable
    return function(z){
        y = 100;     // 외부함수 local variable 사용
        return x+y+z;
    }
}

let add5 = makeAdder(5);
let add10 = makeAdder(10);
console.log(add5(2), add5);
console.log(add10(2), add10)

// 교재 클로져
function multiply_c(n) {
    return function(){
        return n *= n;
    }
}
let multi1 = multiply_c(10)
let multi2 = multiply_c(20)
console.log(multi1(), multi1)
console.log(multi2(), multi2)

// 재귀함수 - 무한루프조심해야함 - 종료 필수
let rest = 1;
function factorial(n) {
    if(n === 0){
        console.log('호출 끝');
    } else{
        console.log('호출 ' + n);
        rest *= n;
        factorial(n-1);
    }
    return rest;
}

console.log("10!", factorial(10));