-- В некотором языке программирования существует следующие типы данных
-- - простые типы: целые, ыещественные, строки
-- - сложные типы: структуры. Структура имеет название и состоит из нескольких полей, каждое их которых, в свою очередь, имеет название и простой тип.

-- База данных идентификаторов программы представляет собой список пар, 
-- состоящих из имени идентификатора и его типа. Разработайте тип данных, представляющий собой описанную информацию. Определите следующие функции:
-- 1) isStructured, проверяющая что ее аргумент является сложными типом
-- 2) getType, по заданному имени и списку идентификаторов (базе данных) 
-- возвращающая тип идентификатора с указанным именем (помнить о том что такого идентификатор а может не оказаться)
-- 3) getFields, по заданному имени возвращающая список полей идентификатора, 
-- если он имеет тип структуры
-- 4) getByType, возвращающая список имен идентификаторов указанного типа из базы данных
-- 5) getByTypes, аналогичная предыдуще, принимающей вместо одного типа, список 
-- типов(с  помощью этой функции можно получить например список всех идентификаторов с числовым типом) 


-- Определяем тип данных для хранения информации об идентификаторах
-- Simple конструктор 
data Identifier = Simple String | Structured String [(String, Identifier)] deriving (Eq)
instance Show Identifier where
  show (Simple t) = t
  show (Structured name fields) = name ++ " {" ++ fieldsStr ++ "}"
    where fieldsStr = concatMap (\(n, t) -> n ++ " = " ++ show t ++ ", ") fields


-- Функция для проверки, является ли тип структурным
isStructured :: Identifier -> Bool
isStructured (Structured _ _) = True
isStructured _ = False

-- Функция для получения типа идентификатора по его имени из базы данных
getType :: String -> [(String, Identifier)] -> Maybe Identifier
getType name [] = Nothing
getType name ((n, t):xs)
  | name == n = Just t
  | otherwise = getType name xs

-- Функция для получения списка полей идентификатора, если он имеет тип структуры
getFields :: Identifier -> Maybe [(String, Identifier)]
getFields (Structured _ fields) = Just fields
getFields _ = Nothing

-- Функция для получения списка имен идентификаторов указанного типа из базы данных
getByType :: Identifier -> [(String, Identifier)] -> [(String, Identifier)]
getByType typ xs = filter (\(_, t) -> t == typ) xs

-- Функция для получения списка имен идентификаторов указанных типов из базы данных
getByTypes :: [Identifier] -> [(String, Identifier)] -> [(String, Identifier)]
getByTypes types = filter (\(_, t) -> t `elem` types)

database :: [(String, Identifier)] 
database = [
	("intId", Simple "int"),
	("intId2", Simple "int"),
	("floatId", Simple "float"),
	("stringId", Simple "string"),
	("structId", Structured "struct" [("field1", Simple "int"), ("field2", Simple "string")])]

main = do
  print database
  print $ getType "intId" database
  print $ getType "unknownId" database
  print $ getType "floatId" database
  print $ getFields (Simple "int") 
  print $ getFields (Structured "struct" [("field1", Simple "int"), ("field2", Simple "string")]) 
  print $ getByType (Simple "int") database 
  print $ getByTypes [Simple "int", Simple "string"] database 

