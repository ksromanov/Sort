module heapSort
import StdEnv
import UtilityFunctions

/*
 У кучи дети находятся на позициях
 2*(k + 1) - 1, 2*(k + 1)

 1 2 3 4 5 6 7
   | | | | | |
   1 1 2 2 3 3
*/

// sz - размер окна
sink :: Int Int *{!Real} -> *{!Real}
sink k sz arr=:{[k] = value}
    | r > sz = arr
    | otherwise = (internal arr)

    where (l, r) = (2*(k + 1) - 1, 2*(k + 1))

          internal arr=:{[l] = left, [r] = right}
            | left < right || r == sz = swapAndSink l left arr
            | otherwise = swapAndSink r right arr

          swapAndSink i value_i arr
            | value > value_i = sink i sz (swap arr i k)
            | otherwise = arr

makeHeap :: *{!Real} -> *{!Real}
makeHeap arr = go (sz / 2 - 1) arr`
    where (sz, arr`) = usize arr
          go i arr
            | i >= 0 = go (i - 1) (sink i sz arr)
            | otherwise = arr

// Сортировка кучей.
sort :: *{!Real} -> *{!Real}
sort arr = go (sz - 1) (makeHeap arr`)
    where (sz, arr`) = usize arr
          go i arr
            | i > 0 = go (i - 1) (sink 0 i arr`)
            | otherwise = arr
            where arr` = swap arr 0 i

Start :: *{!Real}
Start = sort {! 1.0, 8.0, 3.0, 4.0, 11.0, 7.0, 2.0}
