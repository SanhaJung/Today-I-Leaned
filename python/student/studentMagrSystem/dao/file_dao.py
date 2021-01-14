import os.path
from entity.student import Student


# 프로그램 종료시 list students "students.dat"파일 저장
def save_list(students):
    save_file = open("students.dat", "w")
    for index, student in enumerate(students):
        save_file.write(f"{index+1}번째 | {student.id}, {student.name}, {student.age}, {student.major} \n")
    save_file.close()


# 프로그램 시작시 "students.dat" 파일이 존재하고 있는 경우 list student 초기화
def init_data_load():
    fileExist = os.path.isfile("students.dat")
    students = []
    if fileExist:
        read_file = open("students.dat", "r")
        while True:
            line_data = read_file.readline()
            if len(line_data.split("|")) == 2:
                student = line_data.split("|")[1].strip("\n").split(",")
                students.append(Student(student[0].strip(), student[1].strip(), int(student[2].strip()), student[3].strip()))
            if not line_data:
                break
        read_file.close()
    return students
