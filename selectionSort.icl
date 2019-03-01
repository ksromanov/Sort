module selectionSort
import StdEnv
import UtilityFunctions

// Положение максимального элемента
// индексы в интервале [a, b)
maxOfArray :: *{!Real} Int Int -> (Int, Real, *{!Real})
maxOfArray arr=:{[a] = v} a b = go (a + 1) a v arr
    where go i max_i max_v arr=:{[i] = v_i}
            | i == b = (max_i, max_v, arr)
            | v_i > max_v = go (i + 1) i v_i arr
            | otherwise = go (i + 1) max_i max_v arr

sort :: *{!Real} -> *{!Real}
sort arr = go 0 arr`
    where (sz, arr`) = usize arr
          go i arr=:{[i] = v}
            | (i + 1) >= sz = arr
            | otherwise = let (max_i, max_v, arr`) = 
                                    maxOfArray arr (i + 1) sz in
                          if (v < max_v)
                            (go (i + 1) (swap arr` i max_i))
                            (go (i + 1) arr`)

Start :: *{!Real}
Start = sort {! 1.0, 8.0, 3.0, 4.0}
        /* { {! 1.0, 2.0, 3.0, 4.0 } & [2] = arr.[a]}
        where (a,_,arr) = maxOfArray {! 1.0, 8.0, 3.0, 4.0 } 0 4 */
