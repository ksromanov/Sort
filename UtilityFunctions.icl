// Примитивы для работы с массивами, которые используются
// в сортировках.
implementation module UtilityFunctions
import StdArray

// Swaps two elements of mutable array or slice
swap:: !*(a e) !Int !Int -> *(a e) | Array a e
swap arr=:{[i]=ai,[j]=aj} i j =
                {arr & [i]=aj,[j]=ai}

