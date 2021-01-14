import os.path

# 수강생관리 스시템
students = []


# 수강생 등록: 입력받은 id 중복체크 후 list student에 정보 저장 -> message 리턴
def register(student):
    index = is_exist(student["id"])
    if index < 0:
        students.append(student)
        return "\n {0}(이)가 등록되었습니다. \n".format(student["name"])
    else:
        return "\n 이미 등록된 정보입니다."


# 수강생 목록: list studnet 리턴
def getAllStudents():
    return students


# 수강생 정보 수정: id를 검색하여 전공정보 수정하고 massage리턴
def update(id, major):
    index = is_exist(id)
    print(f"update index: {index}")
    if index > -1:
        students[index]["major"] = major
        return f"{id}의 전공정보가 수정되었습니다."
    else:
        return f"{id}의 정보가 존재하지 않습니다."


# 수강생 삭제: id를 검색하여 수가생 정보 삭제 message 리턴
def remove(id):
    index = is_exist(id)
    if index > -1:
        students.pop(index)
        return f"{id}의 정보가 삭제하였습니다."
    else:
        return f"{id}의 정보가 존재하지 않습니다."


# 수강생 존재여부 검색: id 검색하여 list studnents의 index값 리턴
def is_exist(id):
    for i, s in enumerate(students):
        if s["id"] == id:
            return i       # return 함수 탈출
    return -1          # 해당하는 id가 없으면 -1 리턴한다고 약속한 것임


# menu display
def menu_display():
    print()
    print("-----------Cloud MSA 반 수강생 관리 시스템-----------")
    print("1. 수강생 정보 등록")
    print("2. 수강생 목록 보기")
    print("3. 수강생 정보 수정")
    print("4. 수강생 정보 삭제")
    print("0. 종료")


# message display
def message_display(message=""):
    print(message)


# 프로그램 종료시 list students "students.dat"파일 저장
def save_list():
    save_file = open("students.dat", "w")
    print(students)
    for index, student in enumerate(students):
        save_file.write(f"{index+1}번째 | {student['id']}, {student['name']}, {student['age']}, {student['major']} \n")
    save_file.close()


# 프로그램 시작시 "students.dat" 파일이 존재하고 있는 경우 list student 초기화
def init_data_load():
    fileExist = os.path.isfile("students.dat")
    if fileExist:
        read_file = open("students.dat", "r")
        while True:
            line_data = read_file.readline()
            if len(line_data.split("|")) == 2:
                student = line_data.split("|")[1].strip("\n").split(",")
                students.append({'id': student[0].strip(), 'name': student[1].strip(), 'age': student[2].strip(), 'major': student[3].strip()})
            if not line_data:
                break
        read_file.close()


init_data_load()
while True:
    menu_display()

    print()
    menu = input("메뉴를 선택하세요 :  ")

    if menu == "1":
        id = input("학번: ")
        name = input("이름: ")
        age = input("나이: ")
        while not age.isdecimal():
            print("나이는 18이상의 숫자로 입력해주세요.")
            age = input("나이: ")
        major = input("전공: ")
        student = {"id": id, "name": name, "age": int(age), "major": major}
        message_display(register(student))

    elif menu == "2":
        print("=====수강생 목록보기=====")
        message_display(getAllStudents())

    elif menu == "3":
        id_change = input("수정할 수강생 id: ")
        major_change = input("수정할 전공: ")
        message_display(update(id_change, major_change))

    elif menu == "4":
        id_del = input("삭제할 id: ")
        message_display(remove(id_del))

    elif menu == "0":
        print(students)
        message_display("프로그램을 종료 합니다.")
        save_list()
        break
    else:
        menu = input("1, 2, 3, 4, 0번 중에 선택하세요 \n 메뉴: ")

# github: python_workshop repository생성 - 01.todos.py 작성해보기
#                                          {"todoNum": todoNum, "title": title}데이터
#                                          등록, 수정, 삭제, 일정목록, 전체삭제 기능