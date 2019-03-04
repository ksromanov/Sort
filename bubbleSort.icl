module bubbleSort
import StdEnv
import UtilityFunctions

// Сортировка пузырьком, удивительно легко пишется.
sort :: *{!Real} -> *{!Real}
sort arr = iter sz arr`
    where (sz, arr`) = usize arr
          go i` i arr=:{[i`] = prev, [i] = curr}
            | i >= sz   = arr
            | prev < curr = go i (i + 1) (swap arr i` i)
            | otherwise = go i (i + 1) arr
          iter n arr
            | n > 0 = iter (n - 1) (go 0 1 arr)
            | otherwise = arr

Start :: *{!Real}
Start = sort {! 1.0, 8.0, 3.0, 4.0}
