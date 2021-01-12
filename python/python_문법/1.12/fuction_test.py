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
    print(tdata, end="  ")
print()
for ldata in list_data:
    print(ldata, end="  ")

# tuple_data[0] = 100  # TypeError: 'tuple' object does not support item assignment
list_data[0] = 100


# tuple_data[0]=100 // TypeError: 값변경 할 수 없음
# tuple: funcrion에서 다수의 데이터 리턴시 사용
def test_tuple():
    return (10, 20)


a, b = test_tuple()
# a = 30  # 에러 발생하지 않음 튜플의 값을 가리키고 있는 것 아님!
print("{0} + {1} = {2}".format(a, b, a+b))


# 익명함수는 람다식 사용가능
# map(함수, 리스트) : 리스트의 값들을 각각 어떠한 함수를 적용함.
# lambda 매개변수(리스트) : 리턴값 - 일회성 익명함수 
list_input = [1, 2, 3, 4, 5]
output_list = map(lambda data: data*data, list_input)
print(list_input)  # 원본데이터를 변경하지 않음
print(output_list)
print(list(output_list))  # map object 출력하기 위해서는 list로 감싸줘야함


output_filter = filter(lambda data: data < 3, list_input)
print(list_input)
print(output_filter)
print(list(output_filter))