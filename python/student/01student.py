# 수강생관리 스시템
students = []
index = 0

while True:
    print("-----------Cloud MSA 반 수강생 관리 시스템-----------")
    print("1. 수강생 정보 등록")
    print("2. 수강생 목록 보기")
    print("3. 수강생 정보 수정")
    print("4. 수강생 정보 삭제")
    print("0. 종료")

    menu = input("메뉴를 선택하세요 :  ")
    if menu == "1":
        name = input("이름: ")
        age = input("나이: ")
        while not age.isdecimal():
            print("나이는 18의 숫자로 입력해주세요.")
            age = input("나이: ")
        major = input("전공: ")
        student = {"id": index + 1, "name": name, "age": int(age), "major": major}
        students.append(student)
        print()
        print("{0}(이)가 등록되었습니다.".format(student["name"]))
        print()
        index += 1
    elif menu == "2":
        print("=====수강생 목록보기=====")
        for s in students:
            print(s)
    elif menu == "3":
        while True:
            index_change = int(input("수정할 수강생 id: ")) - 1
            print("{0}의 정보를 수정하시겠습니까?".format(students[index_change]['name']))
            print(students[index_change])
            agree = input("수정: Y, 수정 안함: N \n")
            if agree == "Y":
                major_change = input("수정할 전공을 입력하세요 \n")
                students[index_change]['major'] = major_change
                print("{0}의 정보가 수정되었습니다.".format(students[index_change]["name"]))
                break
            elif agree == "N":
                print("수정하지 않았습니다.")
                break
            else:
                print("다시 입력해 주세요.")
    elif menu == "4":
        id_del = input("삭제할 id: ")
        while not id_del.isdecimal():
            print("수강생 번호는 숫자로 입력해 주세요.")
            id_del = input("수정할 수강생 번호: ")
        for student in students:
            if student["id"] == int(id_del):
                delete = input("{0}의 정보를 삭제하시겠습니다.[Y/n]".format(student["name"]))
                if delete == "y" or delete == 'Y':
                    students.remove(student)
                    print("{0}의 정보가 삭제 되었습니다.".format(id_del))
                    break
    elif menu == "0":
        print("프로그램을 종료 합니다.")
        break
    else:
        menu = input("메뉴: ")

# github: python_workshop repository생성 - 01.todos.py 작성해보기
#                                          {"todoNum": todoNum, "title": title}데이터
#                                          등록, 수정, 삭제, 일정목록, 전체삭제 기능