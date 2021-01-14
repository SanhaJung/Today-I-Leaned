# 비즈니스 로직 처리
from exception.duplicate_exception import DuplicateExeption
from exception.idnotfound_exception import IDNotFoundException
from dao.file_dao import save_list, init_data_load


# 수강생관리 스시템
class StudentService:
    students = []       # 클래스 변수
#                         : 프로그램 시작시 파일에서 Student객체 읽어서 초기화(한번만)
#                         호출할때마다 초기화(여러번) 해야한다면 slef.으로

    # 수강생 등록: 입력받은 id 중복체크 후 list student에 정보 저장 -> message 리턴
    #              존재하는 경우 DuplicateException 발생
    def register(self, student):
        index = self.is_exist(student.id)
        if index < 0:
            StudentService.students.append(student)
            return "\n {0}(이)가 등록되었습니다. \n".format(student.name)
        else:
            try:
                raise DuplicateExeption(student.id)
            except DuplicateExeption as inputError:
                return str(inputError)

    # 수강생 목록: list studnet 리턴
    def getAllStudents(self):
        return StudentService.students

    # 수강생 정보 수정: id를 검색하여 전공정보 수정하고 massage리턴
    #                  존재하지 않는 경우 IDNotFouncException 발생
    def update(self, id, major):
        index = self.is_exist(id)
        print(f"update index: {index}")
        if index > -1:
            StudentService.students[index].major = major
            return f"{id}의 전공정보가 수정되었습니다."
        else:
            try:
                raise IDNotFoundException(id)
            except IDNotFoundException as updateError:
                return str(updateError)

# 수강생 삭제: id를 검색하여 수가생 정보 삭제 message 리턴
#                  존재하지 않는 경우 IDNotFouncException 발생
    def remove(self, id):
        index = self.is_exist(id)
        if index > -1:
            StudentService.students.pop(index)
            return f"{id}의 정보가 삭제하였습니다."
        else:
            try:
                raise IDNotFoundException(id)
            except IDNotFoundException as removeError:
                return str(removeError)

    # 수강생 존재여부 검색: id 검색하여 list studnents의 index값 리턴
    def is_exist(self, id):
        for i, s in enumerate(StudentService.students):
            if s.id == id:
                return i       # return 함수 탈출
        return -1          # 해당하는 id가 없으면 -1 리턴한다고 약속한 것임

    # file read
    def file_read(self):
        StudentService.students = init_data_load()

    # file write
    def file_write(self):
        save_list(StudentService.students)
