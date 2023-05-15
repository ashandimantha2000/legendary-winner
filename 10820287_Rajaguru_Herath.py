#Rajaguru Herath
#10820287
#PUSL2018 Computational Theory and Statistics for Computing
#Lab Exercise 2

#Question 1

import random
import datetime

numbers_list = []
item_count=[100000,200000,300000,400000,500000,600000,700000,800000,900000,1000000]

def get_random_array(number):
    for number in range(0,number):
        num = random.randint(0,100)
        numbers_list.append(num)
    return numbers_list

#Using Linear Search

print("Using inear Search\n\n\n")



def linear_search(Numbers,key):
    found = 0
    # key = 50
    if len(Numbers) != 0 and found != 1:
        for index,number in enumerate(Numbers):
            if number == key:
                print(f"number found at {index}")
                found = 1
                return index
    if found == 0:
        print("The number you entered is not exist in the array.")


for item in item_count:
    start = datetime.datetime.now()
    linear_search(get_random_array(item),50)
    end = datetime.datetime.now()
    td = (end - start).total_seconds() * 10**3
    print(f"The time spent for execution of linear search algorithm for {item} is : {td:.03f}ms")



#Using Binary Search
#
print("\n\nUsing Binary Search\n\n\n")


def binary_search(Numbers,key):
    Numbers.sort()

    start = 0
    end = len(Numbers)-1
    # print(Numbers)
    # key = 50
    found = 0

    while start <= end:
        mid = int((end+start)/2)

        if Numbers[mid] == key:
            print(f"Number found at index {mid}")
            found = 1
            return mid
        if key > Numbers[mid]:
            start = mid+1
        if key < Numbers[mid]:
            end = mid-1

    if found == 0:
        print("The number you searched is not exist in the array")



for item in item_count:
    start = datetime.datetime.now()
    binary_search(get_random_array(item),50)
    end = datetime.datetime.now()
    td = (end - start).total_seconds() * 10**3
    print(f"The time spent for execution of binary search algorithm for  {item} is : {td:.03f}ms")
