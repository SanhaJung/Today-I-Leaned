# 함수: open(), close(), read()

# test data file 출력
write_file = open("hello.txt", "w")
write_file.write("\n Hello Python...")
write_file.close()  # 자원 반납

# with open(file명, mode) as file객체
# 자원반납 자동으로
with open("hello.txt", "a") as file:      # mode: 문자열로 받음
    file.write("\n File Write Test")      # "w" - overwrite, "a" - append write, "r" -read

# file read => console 출력
with open("hello.txt", "r") as read_file:
    print("<hello.txt 내용> ", read_file.read())
# console입력 => file 출력
cont = input("입력할 문장 입력: ")

with open("console_input.txt", "w") as console_file:
    console_file.write(cont)

with open("console_input.txt", "r") as console_read:
    print("<console_input.txt 내용>\n",  console_read.read())

# file입력 => file출력(file copy)
file_read = open("hello.txt", "r")
file_copy = open("hello_copy.txt", "w")
file_copy.write(file_read.read())
file_copy.close()
file_read.close()

file_cat = open("hello_copy.txt", "r")
print("<file_copy.txt 내용>", file_cat.read())  # 내용을 보려면 .read() 필요함!
file_cat.close()


# 예제 - 키와 몸무게
import random

hangles = list("가나다라마바사")

with open("info.txt", "w") as file:
    for i in range(10):
        name = random.choice(hangles) + random.choice(hangles)
        weight = random.randrange(40, 70)
        height = random.randrange(155, 170)

        file.write("{}, {}, {}\n".format(name, weight, height))

with open("info.txt", "r") as output:
    print(output.read())


# with open("X.txt", "r") as X_output:    # 없는 파일 읽음
#     print(X_output.read())              # FileNotFoundError: [Errno 2] No such file or directory: 'X.txt'


