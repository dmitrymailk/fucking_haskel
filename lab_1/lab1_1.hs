-- Приведите пример нетривиальных выражений, принадлежащих следующему типу:
-- 1) ((Char,Integer), String, [Double])
(( 'z', 1), "HaHaHaskell", [1.0, 2.0, 3.0])

-- 2) [(Double,Bool,(String,Integer))]
[(1.0, True, ("HaHaHaskell", 1)), (2.0, False, ("Python", 2))]

-- 3) ([Integer],[Double],[(Bool,Char)])
([1,2,3], [1.0, 2.0, 3.0], [(True, 'z'), (False, 'o')])

-- 4) [[[(Integer,Bool)]]]
[[[(1, True), (2, False)]]]

-- 5) (((Char,Char),Char),[String])
((('z', 'o'), 'v'), ["HaHaHaskell", "Python"])

-- 6) (([Double],[Bool]),[Integer])
(([1.0, 2.0, 3.0], [True, False]), [1, 2, 3])

-- 7) [Integer, (Integer,[Bool])]
[1, (2, [True, False])]   

-- 8) (Bool,([Bool],[Integer]))
(True, ([True, False], [1, 2, 3]))

-- 9) [([Bool],[Double])]
[([True, False], [1.0, 2.0, 3.0])]

-- 10) [([Integer],[Char])]
[([1, 2, 3], ['z', 'o', 'v'])] 