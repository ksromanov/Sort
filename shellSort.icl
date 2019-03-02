module shellSort
import StdEnv
import StdDebug
import UtilityFunctions

// Начало убывающей последовательности 1/2 (3^k - 1)
h0 n = go 1
    where go h
            | h < n/3   = go (3*h + 1)
            | otherwise = h

// Вставка на правильное место.
// Из-за особенностей pattern-matching, надо ввести
// j` == j - h
insert h j j` arr=:{ [j] = curr, [j`] = prev }
    | j < h || (prev > curr) = arr
    | otherwise = insert h j` (j` - h) (swap arr j j`)

hSort :: Int *{!Real} -> *{!Real}
hSort h arr = go 1 arr`
    where (sz, arr`) = usize arr
          go i arr
            | i >= h = arr
            | otherwise = go (i + h) (insert h i (i - 1) arr)

sort :: Int *{!Real} -> *{!Real}
sort h arr = go h arr
    where go h arr
            | h >= 1    = go (h/3) (hSort h arr)
            | otherwise = arr

Start :: *{!Real}
Start = sort (h0 n) arr
        where (n, arr) = usize {! 1.0, 8.0, 3.0, 4.0, 0.5, 22.0, 5.0}
