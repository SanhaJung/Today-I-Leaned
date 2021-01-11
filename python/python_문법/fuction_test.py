# def 함수명([argumentlist]):
#     구현
#     [return data]
# 함수는 정의하고 함수 호출을 해야함
# 함수 호출 시 정의된 함수의 argumentlist에 맞도록 데이터 전달
# 가변 매개변수(*argument): 호출 시마다 argumentlist다를 수 있다.
# 기본 매개변수(argument=값) arguemtn 기본값 설정 - 호출시 argument 생략가능


def print_3_times(*values):  # values는 list임
    for value in values:
        for i in range(3):
            print("{0} : hello {1}".format(i, value))


print()

print_3_times(1)
print_3_times('test')
print_3_times('test', 'test2')


def argument_test(a, b=10, c=20):
    print("{0} : {1}: {2}".format(a, b, c))


argument_test(10)  # b, c는 기본값
argument_test(10, 200, 300)  # 순서대로 변수에 값 매필
argument_test(c=100, b=25, a=1)  # 순서상관 없이 변수에 값 매핑


def retrn_none_test():
    return              # return: function 종료 - 호출한 곳으로

print(retrn_none_test())  # return data 없는 경우 None


def mul(*values):
    result = 1
    for value in values:
        result *= value
    return result

print(mul(1, 2, 3))


# tuple: 값 변경하지 않는 list tuple변수 = (value, value, )  -  read only
tuple_data = (10, 20, 30, 40, 50)
list_data = [10, 20, 30, 40, 50]

for tdata in tuple_data:
    print(tdata, end = "  ")
print()
for ldata in list_data:
    print(ldata, end = "  ")

# tuple_data[0] = 100  # TypeError: 'tuple' object does not support item assignment
list_data[0] = 100