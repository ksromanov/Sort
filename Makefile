CLM=env CLEANLIB=/usr/lib64/clean/exe/ clm -lat -lset -I /usr/lib64/clean/StdEnv/ 

UTIL=UtilityFunctions.dcl UtilityFunctions.icl

all: selectionSort insertionSort

selectionSort: selectionSort.icl ${UTIL}
	$(CLM) selectionSort -o selectionSort

insertionSort: insertionSort.icl ${UTIL}
	$(CLM) insertionSort -o insertionSort

clean:
	rm -f selectionSort insertionSort
	rm -rf "Clean System Files"
