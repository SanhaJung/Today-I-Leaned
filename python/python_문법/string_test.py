hello = "안녕하세요"  # 문자열 배열: 0~len()-1
hello2 = "   hello PYTHON   "

print(hello[1:3])     # index 1부터 (3-1)개 문자열
print(len(hello))     # 문자열 길이
# foramt함수 쓸때 {}(괄호)가 더 많을 때 : IndexError
print("문자열 '안녕하세요' 길이는 {0}입니다.".format(len(hello)))  # 문자열 형식 지정

print(hello2.upper())
print(hello2.lower())
print(hello2.strip())

num_string = input("숫자입력: ")
print("{0}이 숫자 인가{1}".format(num_string, num_string.isdecimal()))
if num_string.isalnum():
    num1 = 10 + int(num_string)

# find는 함수: 객체.함수("요소")
print("'l'문자열 검색", hello2.find("l"))  # 검색한 문자열 first index result
print("'l'문자열 검색", hello2.rfind("l"))  # 검색한 문자열 last index result
# print("'l'문자열 포함여부", hello2.in("l"))  #  함수가 아니고 연산자 이므로 이렇게 쓰면 안됨
print("'l'문자열 포함여부", "l" in hello2)

# split()
print(hello2.split(" "))  # 공백문자를 기준으로 나누어 배열에 담는다.
