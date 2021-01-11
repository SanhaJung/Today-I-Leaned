// 반환 - 저장을 하기 위해서는 변수를 지정하여 할당해야함

// charAt() - 인덱스로 문자 반환
let str = 'Javascript_JQuery'
console.log(str.charAt(0));

// indexOf() - 처음 만나는 문자 인덱스 반환
console.log(str.indexOf('a'));

// lastIndexOf() - 뒤에서 처음 만나는 문제 인덱스 반환
console.log(str.lastIndexOf('a'));

// includes() - 포함되어 있는지 확인
console.log(str.includes('script'))

//substring() - 인덱스 번호 기준으로 부분 문자열 반환
console.log(str.substring(0, 3)); // 인덱스가 0부터 3이전까지 문자열 반환
console.log(str.substring(3));    // 인덱스 3번부터 그 이후의 문자열 반환

// substr() - 문자 개수를 기준으로 부분 문자열 반환
console.log(str.substr(1, 5));  // 인덱스 1번부터 5개의 문자열 반환

// split() - 문자열 나누기(array 요소로 저장)
let division = str.split('_');
console.log(division[0] + ',' + division[1]);

// replace() - 부분 문자열 바꾸기
console.log(str.replace('Java', 'vava'));

// concat() - 문자와 문자 연결
let str1 = 'ja';
let str2 = 'va';
console.log(str1.concat(str2));

//trim() - 공백 자르기
let str3 = '   j a v a   ';
console.log(str3.trim());
console.log(str3)

// toLowerCase(), to UpperCase() - 대소문자 통일
console.log(str.toLowerCase());
console.log(str.toUpperCase());