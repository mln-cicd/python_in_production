from typing import TypedDict


class Student(TypedDict):
    name: str
    age: int


student: Student = {
    "age": "Marcy",
    "name": 25,
}

student["age"]

other_student = Student(name="dédé", age=25)
print(other_student)
