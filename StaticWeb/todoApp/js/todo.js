

let todoInputHandler = function(){
    // todos 배열에 {todoNum은 max(todoNum), title은 #todoInput에 입력된 value 값 추가}  
    const result = todos.map(todo => todo.todoNum);
    // Math - 클래스 이름으로 정의되어 있는 것이 대문자로 시작함
    // 객체지향으로 쓸때 클래스 이름 정의할때 주의해야함
    // 자바스크립트에서는 클래스를 잘안써서 큰 의미 없음
    const maxTodoNum = Math.max.apply(null, result); // Math.max(...result)
    const addTitle = document.getElementById("todoInput").value;

    let todo = {todoNum: maxTodoNum+1, title: addTitle};
    todos.push(todo);


    // todoList rendering (처음에 스크립트에 써놨던거 메소드로 바꿔줌)
    displayList();
}

let todoDeleteHandler = function(todoNum) {
    // todos 배열에서 todoNum 해당하는 데이터 삭제 (splice, fileter사용)
    // todos.splice(todoNUm-1, 1);
    // 가독성을 위해 아래처럼 쓰는 것이 권장됨
    const index = todos.findIndex(todo => todo.todoNum == todoNum);
    todos.splice(index, 1) // splice는 재할당 할 필요 없음

    // todoList rendering
    displayList();
}

let todoClear = function() {
    // todos 배열 empty
    // MDN사이트에서 메소드확인했지만 없어서 초기화 시켜줌
    todos=[];

    // todoList rendering
    // const todoList = document.getElementById("todoList");
    // todoList.innerHTML = "";

    //-> displayList 만든후 
    displayList();

}

// todoList rendering을 위해 반복적으로 호출되므로 명시적 함수로 정의
function displayList(){
    // loop돌면서 인덱스 반환
    // document는 body를 뜻함
    const todoList = document.getElementById("todoList");
    let dataList = "";
    todos.forEach(todo=> {
        //loop 돌면서 list 추가
        dataList += `
            <li class="shadow" >
                <i  aria-hidden="true" class="checkBtn fa fa-check"></i>
                <!-- json파일 참조 -->
                ${todo.title}
                <span type="button" class="removeBtn" onClick="todoDeleteHandler(${todo.todoNum})">
                    <i aria-hidden="true" class="fa fa-trash-o"></i>
                </span>
            </li> `
    });
    // innerHTML로 할 수 있는 것은 text로 받아들여서 그리는 것임
    todoList.innerHTML = dataList;
}