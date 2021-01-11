# {"name": "value", ...} 
# value: int, float, boolean, str, list

# student = {"name": "고재경", "age": 26, "major": "컴공"}
# print("이름:{} 나이:{} 전공:{}".format(student["name"], student["age"], student["major"]))

student = []
student.append({"name": "고재경", "age": 26, "major": "컴공"})
student.append({"name": "권혜영", "age": 25, "major": "정보보안", "성별": "여자"})

# 추가 수정
student[0]["name"] = "고재경2"  # key값이 있는 경우: 값 update
student[0]["성별"] = "남자"     # key값이 없는 경우: key, value 쌍 추가

for s in student:
    print("이름:{0} 나이:{1} 전공:{2} 성별:{3}".format(s["name"], s["age"], s["major"], s["성별"]))

# 삭제
del student[0]["성별"]
print(student[0])

# get(): key check 없는 경우 None return
key_value = input("student 속성 입력(name, age, major): ")
while student[0].get(key_value) == None:
    key_value = input("name, age, major 중에 하나를 입력하세요: ")
