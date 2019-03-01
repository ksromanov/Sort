// Примитивы для работы с массивами, которые используются
// в сортировках.
definition module UtilityFunctions
import StdArray

// Swaps two elements of mutable array or slice
swap:: !*(a e) !Int !Int -> *(a e) | Array a e
