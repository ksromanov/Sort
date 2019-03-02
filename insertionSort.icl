module insertionSort
import StdEnv
import StdDebug
import UtilityFunctions

// Вставка на правильное место.
// Из-за особенностей pattern-matching, надо ввести
// j` == j - 1
insert j j` arr=:{ [j] = curr, [j`] = prev }
    | j < 1 || (prev > curr) = arr
    | otherwise = insert j` (j` - 1) (swap arr j j`)

sort :: *{!Real} -> *{!Real}
sort arr = go 1 arr`
    where (sz, arr`) = usize arr
          go i arr
            | i >= sz = arr
            | otherwise = go (i + 1) (insert i (i - 1) arr)

Start :: *{!Real}
Start = sort {! 1.0, 8.0, 3.0, 4.0, 0.5, 22.0, 5.0}
