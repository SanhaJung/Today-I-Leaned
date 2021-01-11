# if 조건식:
#     참일때 실행문
# elif 조건식2:
#     조건식2가 참일때 실행문
# else:
#     조건식1, 2가 거짓일 때

month = input("월입력: ")
if month.isdecimal():
    m = int(month)
    if 1 <= m <= 7:
        if m % 2 == 1:
            print("{0}월은 31일까지 있습니다.".format(m))
        elif m == 2:
            print("{0}월은 28일까지 있습니다.".format(m))
        else:
            print("{0}월은 30일까지 있습니다.".format(m))
    else:
        if m % 2 == 1:
            print("{0}월은 30일까지 있습니다.".format(m))
        else:
            print("{0}월은 31일까지 있습니다.".format(m))
else:
    month = input("월은 1-12사이 값을 입력: ")


# list type: [str, int, float, boolean, list]
#            +, *(iteration), len()
list_a = [1, 2, 3, 7, 1]
list_b = [4, 5, 6]
print(list_a+list_b, "+연산후 list_a: ", list_a)  # 연산 후 저장하려면 할당해야함

# append(), insert(), pop(), del, remove(), clear()
list_a.append(4)
print("append 후 list_a: ", list_a)  # 마지막 index+1에 추가
list_a.insert(1, 5)
print("insert 후 list_a", list_a)  # 해당 index에 삽입
list_a.pop(1)
print("pop 후 list_a", list_a)  # 해당 index 요소 삭제
del list_a[1:3]
print("del 후 list_a", list_a)  # 해당 index 요소들 삭제
list_a.remove(1)
print("remove 후 list_a", list_a)  # 첫번째 만나는 값 삭제
list_a.clear()
print("clear 후 list_a", list_a)  # 리스트 내부 요소를 모두 제거

# for 반복자 in 반복할 수 있는 데이터(list, dictionary, string, range()):
#   실행문
for data in list_b:
    print("index: {}, data: {}".format(list_b.index(data), data))