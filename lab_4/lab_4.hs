-- 2 Функции для работы с типом MyList. Для введенного ранее типа
-- MyList определите следующие функции:
-- 1) lengthMyList, возвращающую длину списка типа MyList.
-- 2) nthMyList, возвращающую n-й элемент списка.
-- 3) removeNegative, которая из списка целых (тип MyList Integer) удаляет отрицательные элементы.
-- 4) fromMyList, преобразующую список типа MyList в обычный список.
-- 5) toMyList, преобразующую обычный список в список типа MyList.

-- Cons - это конструктор данных для списка (в данном случае, для определенного пользователем типа списка MyList), 
-- который принимает два аргумента: первый - значение элемента списка, а второй - ссылку на 
-- следующий элемент списка (который также может быть пустым). 
-- Это позволяет создавать списки из произвольного количества элементов, 
-- где каждый элемент ссылается на следующий элемент в списке.

-- Maybe - предоставляет механизм для обработки значений, которые могут не существовать 
-- или быть недоступными. Она может использоваться для избегания ошибок при работе с null-значениями.
-- поэтому когда мы возвращаем существующие значения мы должны обернуть их в Just
data MyList a = Empty | Cons a (MyList a) deriving (Show)

-- Функция для получения длины списка
lengthMyList :: MyList a -> Int
lengthMyList Empty = 0
lengthMyList (Cons _ xs) = 1 + lengthMyList xs

-- Функция для получения n-го элемента списка
nthMyList :: Int -> MyList a -> Maybe a
nthMyList n Empty = Nothing
nthMyList 0 (Cons x xs) = Just x
nthMyList n (Cons x xs) = nthMyList (n-1) xs

-- Функция для удаления отрицательных элементов из списка
removeNegative :: MyList Integer -> MyList Integer
removeNegative Empty = Empty
removeNegative (Cons x xs) | x >= 0 = Cons x (removeNegative xs)
removeNegative (Cons x xs) = removeNegative xs

-- Функция для преобразования списка типа MyList в обычный список
fromMyList :: MyList a -> [a]
fromMyList Empty = []
fromMyList (Cons x xs) = x : fromMyList xs

-- Функция для преобразования обычного списка в список типа MyList
toMyList :: [a] -> MyList a
toMyList [] = Empty
toMyList (x:xs) = Cons x (toMyList xs)

list1 = Cons 1 (Cons 2 (Cons 3 Empty))
list2 = Cons (-1) (Cons 2 (Cons (-3) Empty))
list3 = toMyList [1, 2, 3, 4, 5]

main = do
  -- Длина списка
  print("lengthMyList")
  print $ lengthMyList list1 -- результат: 3

  -- Получение n-го элемента списка
  print("nthMyList")
  print $ nthMyList 1 list1 -- результат: Just 2
  print $ nthMyList 5 list1 -- результат: Nothing

  -- Удаление отрицательных элементов из списка
  print("removeNegative")
  print $ removeNegative list2 -- результат: Cons 2 Empty

  -- Преобразование списка типа MyList в обычный список
  print("fromMyList")
  print $ fromMyList list1 -- результат: [1, 2, 3]

  -- Преобразование обычного списка в список типа MyList
  print $ toMyList [1, 2, -3, 4, 5] -- результат: Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 Empty))))
