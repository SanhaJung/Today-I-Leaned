// 3. 연산자
// 1)산술연산자: +, -, *, /, %, ++, --
let x=10;
let y=20;
//console.log(x, "+", y, "=", x+y);
console.log(`${x} + ${y}= ${x+y}`); // 문자열과 변수 한번에 출력
console.log(`${x} - ${y}= ${x-y}`); // ``, ${} 사용
console.log(`${x} * ${y}= ${x*y}`);
console.log(`${x} / ${y}= ${x/y}`);
console.log(`${x} % ${y}= ${x%y}`);

//2) 대입연산자(=) - 다른연산자=
const z = x+y;
let res = x;
res += y;
console.log(`z = ${z}`);
console.log(`result = ${res}`);

//3) 비교연산자(<, >, <=, >=, ==, !=, ===, !==)
let a = 1;
let b = 2;
console.log(`a>b : ${a>b}`);
console.log(`a<b : ${a<b}`);
console.log(`a=b : ${a==b}`);
console.log(`a!=>b : ${a!=b}`);
for (let i=1; i < x; i++){
    if(i%2 == 0) console.log(`${i}는 짝수 입니다.`);
    else console.log(`${i}는 홀수 입니다.`);
}

//===연산자
if(x === "10") console.log("===연산자(data type 비교): x는 string입니다.");
else console.log("===연산자(data type 비교): x는 string이 아닙니다.")
//!==연산자
if(x !== "10") console.log("!==연산자(data type 비교): x는 string이 아닙니다.");
else console.log("!==연산자(data type 비교): x는 string입니다.")


//4) 논리연산자(&&, ||, ~)
if((1<b)&&(b<3)) console.log(`${b}는 1과 3사이의 수 입니다.`);


//5) 비트연산자(&, |, ^, ~) - 0,1로 연산(알고리즘에 쓰일 수 있음)

//6) 삼항연산자(조건 ? 참 : 거짓) - if문 대신 많이 쓰임
let c = -5;
console.log(`a: ${a >0? '양수': '음수'}`)
console.log(`b: ${c >0? '양수': '음수'}`)