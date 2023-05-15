import sys

num1 = int(sys.argv[1])
num2 = int(sys.argv[2])

#Factorial_Iteration
def factorial(num1):
    answer = 1
    for i in range(1, num1+1):
        answer = answer * i
    return answer

print("Answer is " + str(factorial(num1)))

#Factorial_Recursion
def factorial_recursive(num1):
    if(num1 == 0):
        return 1
    return num1* factorial_recursive(num1 -1)

print("Answer is " + str(factorial_recursive(num1)))

#Fibonacci_Iteration
def fibonacci(num1):
    n1 = 0
    n2 = 1
    for i in range (1,num1):
        fib = n1 + n2
        n1 = n2
        n2 = fib
    return fib

print("Fibinacci is " + str(fibonacci(num1)))

#Fibonacci_Recursive
def fibonacci_recursive(num1):
    if(num1 < 3):
        return 1;
    else:
        return fibonacci_recursive(num1-1) + fibonacci_recursive(num1-2)

print("Fibinacci is " + str(fibonacci_recursive(num1)))

#Fibonacci_Iteration

def GCD(num1, num2):
    if(num2 == 0):
        return num1
    else:
        return GCD(num1, num1%num2)

print("GCD is " + str(GCD(num1,num2)))



        


    

