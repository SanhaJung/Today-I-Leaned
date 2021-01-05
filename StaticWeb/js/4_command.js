//4. 제어문
//1) 조건문
//   if(조건식) 참일때 실행문;
//   else 거짓일때 실행문;

let month = prompt("월 입력: ", "");

if(month== 1|| month==3 || month==5 || month==7|| month==8 || month==10 || month==12){
    console.log(`${month}월은 31일까지 있습니다.`);
}
else if(month==2){
    console.log(`${month}월은 28일까지 있습니다.`);
}
else{
    console.log(`${month}월은 30일까지 있습니다.`);
}

//switch문 
// switch (값){  //이때 값은 문자로 들어옴
//     case 값1:
//         실행문;
//         break;
//     case 값2:
//         실행문;
//         break;
// }
switch(month){
    case '1':
    case '3':
    case '5':
    case '7':
    case '8':
    case '10':
    case '12': console.log(`${month}월은 31일까지 있습니다.`);
            break;

    case '2': console.log(`${month}월은 28일까지 있습니다.`);
            break;
    case '4':
    case '6':
    case '9':
    case '11': console.log(`${month}월은 30일까지 있습니다.`);
             break;
}

// 2. 반복문
// 1)while (묶어서 반복 -ex-쓰레드)
// 초기값;
// while(조건식){
//     참일때 실행문;
//     초기값 증감식;
// }

// 2)do while(초기 한번 무조건 실행)
// 초기값;
// do{
//     실행문;
//     증감식;
// } while(조건식);

// 3) for문 (반복횟수 정해져 있을때)
// for(초기값; 조건식; 증감식){
//     실행문;
// }

// for(데이터 in|of 리스트데이터){  //인덱스가 자동으로 하나씩을 증가
//     실행문;                     //of: 변수가 배열의 값
// }                               //in: 변수가 인덱스

let index1 = 1;
let index2 = 1;
let sum1=0;
let sum2=0;
let sum3=0;

while(index1 < 11){
    sum1 += index1; //sum = sum + index;
    index1++; //index = index + 1;
}
console.log(`1~10 합(while): ${sum1}`);

do{
    sum2 += index2; 
    index2++; 
} while(index2 <11)
console.log(`1~10 합(do while): ${sum2}`);

for(i=1; i<11; i++){
    sum3 += i;
}
console.log(`1~10 합(for): ${sum3}`);

// 기타: return - 함수 종료(변환), 
    //   break - 반복문 종료
    //   continue - 반복문으로 돌아가기
let sum4 = 0
    for(i=1; i<11; i++){
        if(i%2 == 0) continue;
        sum4 += i;
    }
    console.log(`1~10 홀수의 합(for): ${sum4}`);    