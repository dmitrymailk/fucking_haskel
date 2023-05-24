-- 2) Программа, распечатывающая переданные в нее аргументы командной строки.
import System.Environment

main = do
    args <- getArgs
    progName <- getProgName
    print $ args
    print $ progName