-- Теоретически возможно, хотя и неэффективно, определить целые числа с помощью рекурсивных типов данных следующим образом: data Number = Zero | Next Number.
-- Т. е. число является либо нулем (Zero), либо определяется, как число, следующее за предыдущим числом.
-- Например, число 3 записывается как Next (Next (Next Zero)). Определи для такого представления следующие функции:
-- 1) fromInt, для заданного целого числа типа Integer возвращающую соответствующее ему значение типа Number.
-- 2) toInt, преобразующую значение типа Number в соответствующее целое число.
-- 3) plus :: Number -> Number -> Number, складывающую свои аргументы.
-- 4) mult :: Number -> Number -> Number, умножающую свои аргументы.
-- 5) dec, вычитающую единицу из своего аргумента. Для Zero функция должна возвращать Zero.
-- 6) fact, вычисляющую факториал.

-- Zero | Next Number - это рекурсивный тип данных (рекурсивный тип данных - это тип данных, который содержит в себе значения этого же типа)
-- Является либо нулем (Zero), либо определяется, как число, следующее за предыдущим числом
data Number = Zero | Next Number

-- fromInt - это функция, которая принимает на вход целое число типа Integer и возвращает значение типа Number
fromInt :: Integer -> Number
-- fromInt 0 - это сопоставление с образцом, которое проверяет, равно ли число 0, если да, то возвращает значение Zero, иначе возвращает значение Next (fromInt (n - 1))
fromInt 0 = Zero
fromInt n = Next (fromInt (n - 1))

-- toInt - это функция, которая принимает на вход значение типа Number и возвращает целое число типа Integer
toInt :: Number -> Integer
-- toInt Zero - это сопоставление с образцом, которое проверяет, равно ли значение Zero, если да, то возвращает значение 0, иначе возвращает значение 1 + toInt n
toInt Zero = 0
toInt (Next n) = 1 + toInt n

-- plus - это функция, которая принимает на вход два значения типа Number и возвращает значение типа Number
plus :: Number -> Number -> Number
-- plus Zero n - это сопоставление с образцом, которое проверяет, равно ли значение Zero, если да, то возвращает значение n, иначе возвращает значение Next (plus m n)
plus Zero n = n
plus (Next m) n = Next (plus m n)

-- mult - это функция, которая принимает на вход два значения типа Number и возвращает значение типа Number
mult :: Number -> Number -> Number
-- mult Zero n - это сопоставление с образцом, которое проверяет, равно ли значение Zero, если да, то возвращает значение Zero, иначе возвращает значение plus n (mult m n)
mult Zero n = Zero
mult (Next m) n = plus n (mult m n)

-- dec - это функция, которая принимает на вход значение типа Number и возвращает значение типа Number
dec :: Number -> Number
-- dec Zero - это сопоставление с образцом, которое проверяет, равно ли значение Zero, если да, то возвращает значение Zero, иначе возвращает значение n
dec Zero = Zero
dec (Next n) = n

-- fact - это функция, которая принимает на вход значение типа Number и возвращает значение типа Number
fact :: Number -> Number
-- fact Zero - это сопоставление с образцом, которое проверяет, равно ли значение Zero, если да, то возвращает значение Next Zero, иначе возвращает значение mult (Next n) (fact n)
fact Zero = Next Zero
fact (Next n) = mult (Next n) (fact n)

-- instance Show Number where - это объявление экземпляра класса Show для типа Number
-- show Zero = "Zero" - это сопоставление с образцом, которое проверяет, равно ли значение Zero, если да, то возвращает значение "Zero", иначе возвращает значение "Next " ++ show n
-- show (Next n) = "Next " ++ show n - это сопоставление с образцом, которое проверяет, равно ли значение (Next n), если да, то возвращает значение "Next " ++ show n
instance Show Number where
  show Zero = "Zero"
  show (Next n) = "Next " ++ show n 

main = do
  print (fromInt 0)
  print (toInt (Next (Next (Next Zero))))
  print (plus (fromInt 3) (fromInt 4))
  print (mult (fromInt 3) (fromInt 4))
  print (dec (fromInt 3))
  print (fact (fromInt 3))