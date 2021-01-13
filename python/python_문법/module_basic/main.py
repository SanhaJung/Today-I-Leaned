# import test_package.test_module as test
# import test_package.test_module2 as test2

# __init__.py사용
from test_package import test_module
from test_package import test_module2

radius = test_module.number_input()
print(test_module.get_circumference(radius))
print(test_module.get_circle_area(radius))


x, y = test_module2.number_input()
print(test_module2.get_circumference(x, y))
print(test_module2.get_rectangle_area(x, y))

print("# 메인의 __name__출력 #")
print(__name__)
print()
