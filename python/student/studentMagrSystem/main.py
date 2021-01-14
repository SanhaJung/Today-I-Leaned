from controller_view.student_controller import StudentController
from view_template.template_view import menu_display, menu_select_display, update_display
from view_template.template_view import delet_display, input_display, message_display

contoller = StudentController()

contoller.file_read()

while True:
    menu_display()

    menu = menu_select_display()

    if menu == "1":
        student = input_display()
        contoller.register(student)

    elif menu == "2":
        contoller.getAllStudents()

    elif menu == "3":
        id, major = update_display()
        contoller.update()

    elif menu == "4":
        id = delet_display()
        contoller.remove(id)

    elif menu == "0":
        message_display("프로그램을 종료 합니다.")
        contoller.file_write()
        break
    else:
        menu = input("1, 2, 3, 4, 0번 중에 선택하세요 \n 메뉴: ")
