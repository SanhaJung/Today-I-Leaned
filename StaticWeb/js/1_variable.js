// 1. var, let, const
// 변수선언은 let사용(이유: 유효범위 구분)
// 상수선언은 const 사용(값 변경없이 read only로 사용)
var x; //변수선언
x = 6;  //값 할당
const constVariable = 10; //상수(서버에서 받아오는 경우)
let glovalVariable = 5; // 변수(전역 변수)
{
    let localVarible = 5; // 변수(지역 변수)
    var y = 5;
    console.log("localVariable", localVarible);
    console.log("globalVariable", glovalVariable);
    console.log("var x", x);
    console.log("var y", y);
    console.log("constVariable", constVariable);
}
// constVariable = 100; //error: 상수는 값 할당 안됨
console.log("globalVariable", glovalVariable);
// console.log("localVariable", localVarible); //let으로 사용한 지역변수는 전역에서 쓸 수 없음
console.log("var x", x);
console.log("var y", y);
console.log("constVariable", constVariable);

//document.getElementById("data").innerHTML = x;
// = //
document.getElementById("data").innerHTML = "<h3>variable x = " + x + "</h3>";


