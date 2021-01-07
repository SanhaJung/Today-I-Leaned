let button = document.getElementById('button'); // 지정된 ID를 가진 요소를 가져온다.
let input = document.getElementById('input');
let list = document.getElementById('list');

// addEventLister()는 지정한 이벤트가 대상에 전달될 때마다 호출할 함수 설정
// target.addEventListener(type, listener[, options]);
// - parameter
//   type: 이벤트 유형을 나타냄
//   listener: 지정된 이벤트 발생시, 알림을 받는 객체
//             eventListener, function 객체여야함
//             콜백
button.addEventListener('click', clickButton);

let cnt = 1; // 노드 id쓸려고

function clickButton() {
    let temp = document.createElement('li');
    temp.className = "shadow";
    let temp2 = document.createElement('i');
    temp2.className="checkBtn fa fa-check";
    temp2.setAttribute("aria-hidden", "true");
    //DOM tree
    temp2.innerHTML = input.value; 
    temp.appendChild(temp2);

    //할일 삭제
    let del = document.createElement('span');
    del.setAttribute("id", "sp"+cnt)
    del.setAttribute("type", "button");
    del.setAttribute("class", "removeBtn");
    del.setAttribute("style",'float: right;');
    del.setAttribute("onclick", 're()');


    let im = document.createElement('i');
    im.setAttribute("aria-hidden", "true");
    im.className = "fa fa-trash-o";
    del.appendChild(im);  
    temp.appendChild(del);
    

    console.log(temp)
    console.log(temp.id)

    list.appendChild(temp);
    cnt++;
}

// 할일 삭제
function re(){
    let t = document.getElementById("sp"+1) //TODO: 삭제방법
    t.parentNode.remove();
}

//[출처]
// https://m.blog.naver.com/magnking/220972680805
// https://popcorn16.tistory.com/126
// https://blogpack.tistory.com/670  //DOM

{/* <li class="shadow">
        <i aria-hidden="true" class="checkBtn fa fa-check"></i>
        일정1
        <span type="button" class="removeBtn">
            <i aria-hidden="true" class="fa fa-trash-o"></i>
        </span>
</li> */}