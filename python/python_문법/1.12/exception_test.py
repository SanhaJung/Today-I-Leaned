# try:
#     예외발생 가능 실행문
# except:
#     예외발생시 실행할 실행문
# finally:
#     예외 발생여부에 상관없이 실행되는 실행문


# Multi Exception 처리: subClass 타입부터 처리


list_data = [1, 2, 3, 4, 5]
divide_sum = 0
try:
    number_input_a = int(input("정수입력> "))
    for data in list_data:  # 0~len(list_data)-1
        print(data)
    # list_data[5] = 6  # 범위 벗어남

    for index in range(len(list_data)):
        divide_sum += list_data[index]/number_input_a  # Zero Division Error 발생가능
        print(f"{index}번째 데이터: {list_data[index]}")  # Index Error 발생가능

    print()
    print("원의 반지름: ", number_input_a)
    print("원의 둘레: ", 2*3.14*number_input_a)
    print("원의 넓이: ", 3.14*number_input_a*number_input_a)

except ValueError:
    print("ValueError: 숫자를 다시 입력하세요.")
except IndexError:
    print("IndexError: 리스트는 0~{len(list_data)-1}까지 접근 가능")
except Exception as error:  #위에서 걸러내지 못한 오류 여기로 들어옴
    print(error, "프로그램 비정상 종료")
finally:  # ex) 자원 반납코드
    print("예외 여부 관계없이 출력")




# 사용자 정의 예외 = 클래스
# 1. Exception을 상속 받는 사용자의 예외클래스 정의
# 2. 예외상황이 발생됐을 때 raise 이용 강제로 예외 발생
# 3. 호출하는 쪽에서 처리
#     try: 
#        사용자 정의 예외발생하는 함수 호출
#     except 사용자 정의 예외 클래스 타입:
#         예외처리
#     finally:
#         무조건 발생되는 실행문