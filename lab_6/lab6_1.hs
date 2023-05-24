-- 1) Программа, считывающая два числа и возвращающая их сумму.
main = do
   putStrLn "x1: "
   input1 <- getLine
   putStrLn "x2: "
   input2 <- getLine
   let x = (read input1 :: Int)
   let y = (read input2 :: Int)
   putStrLn $ "result=" ++ show (x + y)