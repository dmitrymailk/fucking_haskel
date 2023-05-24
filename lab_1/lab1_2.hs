-- Определите следующие функции:
-- 1) Функция max3, по трем целым возвращающая наибольшее из них.
max3 :: Int -> (Int -> Int -> Int)
max3 a b c = max (max a b) c

-- 2) Функция min3, по трем целым возвращающая наименьшее из них.
min3 :: Int -> (Int -> Int -> Int)
min3 a b c = min (min a b) c

-- 3) Функция sort2, по двум целым возвращающая пару, в которой
-- наименьшее из них стоит на первом месте, а наибольшее — на втором.
sort2 :: Int -> (Int -> (Int, Int))
sort2 a b = (min a b, max a b)

-- 4) Функция bothTrue :: Bool -> Bool -> Bool, которая
-- возвращает true тогда и только тогда, когда оба ее аргумента
-- будут равны True. Не используйте при определении функции
-- стандартные логический операции (&&, || и т.п.).
-- bothTrue :: Bool -> Bool -> Bool
-- bothTrue a b = a && b
bothTrue :: Bool -> Bool -> Bool
bothTrue a b = if a then b else False

-- 5) Функция solve2::Double->Double->(Bool,Double),
-- которая по двум числам, представляющим собой коэффициенты
-- линейного уравнения ax + b = 0, возвращает пару, первый
-- элемент которой равен True, если решение существует и false
-- в противном случае; при этом второй элемент равен либо
-- значению корня, либо 0.0.
solve2 :: Double -> Double -> (Bool, Double)
solve2 a b = (a /= 0, if a == 0 then 0 else -b / a) 

-- 6) Функция isParallel, возвращающая True, если два отрез-
-- ка, концы которых задаются в аргументах функции, параллель-
-- ны (или лежат на одной прямой). Например, значение выраже-
-- ния isParallel (1,1) (2,2) (2,0) (4,2) должно быть
-- равно True, поскольку отрезки (1, 1) − (2, 2) и (2, 0) − (4, 2) параллельны.

isParallel :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer) -> Bool
isParallel (ax, ay) (bx, by) (cx, cy) (dx, dy) = 
	if (by - ay)*(cx - dx) - (dy - cy)*(ax - bx) == 0 then True else False



-- 7) Функция isIncluded, аргументами которой служат параметры
-- двух окружностей на плоскости (координаты центров и радиусы);
-- функция возвращает True, если вторая окружность целиком со-
-- держится внутри первой.
isIncluded:: ((Double, Double), Double) -> ((Double, Double), Double) -> Bool
isIncluded ((x1, y1), r1) ((x2, y2), r2) = sqrt((x1 - x2)^2 + (y1-y2)^2) + r2 <= r1

-- 8) Функция isRectangular, принимающая в качестве парамет-
-- ров координаты трех точек на плоскости, и возвращающая True,
-- если образуемый ими треугольник — прямоугольный.
--d:: (Double, Double) -> (Double, Double) -> Double
--isRectangular:: (Double, Double) -> (Double, Double) -> (Double, Double) -> Bool
isRectangular:: (Double, Double) -> (Double, Double) -> (Double, Double) -> Bool
vector:: (Double, Double) -> (Double, Double) -> (Double, Double)
skalarProduct:: (Double, Double) -> (Double, Double) -> Double
    
vector (x1, y1) (x2, y2) = (x2 - x1, y2 - y1)
skalarProduct (x1, y1) (x2, y2) = x1 * x2 + y1 * y2
isRectangular (x1, y1) (x2, y2) (x3, y3) = 
    (skalarProduct a b == 0 || skalarProduct b c == 0 || skalarProduct a c == 0) where
        a = vector (x1, y1) (x2, y2)
        b = vector (x1, y1) (x3, y3)
        c = vector (x2, y2) (x3, y3)

-- 9) Функция isTriangle, определяющая, можно ли их отрезков с
-- заданными длинами x, y и z построить треугольник.
isTriangle :: Double -> Double -> Double -> Bool
isTriangle x y z = x + y > z && x + z > y && y + z > x

-- 10) Функция isSorted, принимающая на вход три числа и возвра-
-- щающая True, если они упорядочены по возрастанию или по
-- убыванию.
isSorted :: Double -> Double -> Double -> Bool
isSorted x y z = (x >= y && y >= z) || (x <= y && y <= z)

-- $ - это оператор применения функции. Он позволяет вызывать функцию
main = do
    print "Subtask 1"
    print $ max3 1 2 3
    print "Subtask 2"
    print $ min3 1 2 3
    print "Subtask 3"
    print $ sort2 1 2
    print "Subtask 4"
    print $ bothTrue True True
    print "Subtask 5"
    print $ solve2 0 10
    print "Subtask 6"
    print $ isParallel (1,1) (2,2) (2,0) (4,2)
    print "Subtask 7"
    print (isIncluded ((0, 0),2) ((0,0),2))
    print (isIncluded ((0, 0),2) ((0,1),2))
    print (isIncluded ((0, 0),2) ((1,1),2))
    print "Subtask 8"
    print(isRectangular (0,0) (2,0) (0,2))
    print(isRectangular (0,0) (3,0) (0,4))
    print(isRectangular (0,0) (2,0) (0,2))
    print(isRectangular (0,0) (3,0) (0,4))
    print "Subtask 9"
    print $ isTriangle 5 5 5
    print "Subtask 10"
    print(isSorted 1 2 3)
    print(isSorted 1 2 4)
    print(isSorted 4 2 3)
    print(isSorted 4 3 3)
    print(isSorted 4 1 3)

    print(2^2)