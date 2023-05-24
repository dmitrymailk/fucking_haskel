-- Определите функцию, принимающую на вход целое число n и возвращающую список, содержащий n элементов, упорядоченных по возрастанию.
-- 1) Список натуральных чисел.
intFunc :: Int -> [Int]
intFunc 0 = []
intFunc n = [1..n]

-- 2) Список нечетных натуральных чисел.
oddFunc :: Int -> [Int]
oddFunc 0 = []
oddFunc n = [1, 3..n]

-- 3) Список четных натуральных чисел.
evenFunc :: Int -> [Int]
evenFunc n = [2, 4..n]

-- 4) Список квадратов натуральных чисел.
-- x ^ 2 | x <- [1..n] - это генератор списка (list comprehension) в Haskell
-- x ^ 2 - это выражение обрабатывающее каждый элемент списка
-- x <- [1..n] - это генератор списка
squareFunc :: Int -> [Int]
squareFunc n = [x ^ 2 | x <- [1..n]]

-- 5) Список факториалов.
-- product [1..x] - это функция, которая вычисляет произведение элементов списка
-- [1..x] - это список элементов, произведение которых будет вычислено функцией product
factorialFunc :: Int -> [Int]
factorialFunc n = [product [1..x] | x <- [1..n]]

-- 6) Список степеней двойки.
powerOfTwoFunc :: Int -> [Int]
powerOfTwoFunc n = [2 ^ x | x <- [1..n]]

-- 7) Список треугольных чисел.
-- sum [1..x] - это функция, которая вычисляет сумму элементов списка
triangleFunc :: Int -> [Int]
triangleFunc n = [sum [1..x] | x <- [1..n]]

trDigit :: Int -> Int
trDigit 1 = 1
trDigit n = n + trDigit(n - 1)

pyrDigit :: Int -> Int
pyrDigit 1 = 1
pyrDigit n = trDigit(n) + pyrDigit(n-1)

-- 8) Список пирамидальных чисел.
-- 'div' - это оператор целочисленного деления
pyramidFunc :: Int -> [Int]
-- pyramidFunc n = [x * (x + 1) * (x + 2) `div` 6 | x <- [1..n]]
pyramidFunc n = [ pyrDigit(x) | x <- [1..n]]

main = do
  print "1) Int nums:"
  print(intFunc 10)
  print "2) Odd nums:"
  print( oddFunc 10)
  print "3) Even nums:"
  print (evenFunc 10)
  print "4) Square nums:"
  print (squareFunc 10)
  print "5) Factorial nums:"
  print (factorialFunc 10)
  print "6) Power of two nums:"
  print (powerOfTwoFunc 10)
  print "7) Triangle nums:"
  print (triangleFunc 10)
  print "8) Pyramid nums:"
  print (pyramidFunc 10)