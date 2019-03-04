CLM=env CLEANLIB=/usr/lib64/clean/exe/ clm -lat -lset -I /usr/lib64/clean/StdEnv/ 

UTIL=UtilityFunctions.dcl UtilityFunctions.icl

all: bubbleSort selectionSort insertionSort shellSort

bubbleSort: bubbleSort.icl ${UTIL}
	$(CLM) bubbleSort -o bubbleSort

selectionSort: selectionSort.icl ${UTIL}
	$(CLM) selectionSort -o selectionSort

insertionSort: insertionSort.icl ${UTIL}
	$(CLM) insertionSort -o insertionSort

shellSort: shellSort.icl ${UTIL}
	$(CLM) shellSort -o shellSort

clean:
	rm -f bubbleSort selectionSort insertionSort shellSort
	rm -rf "Clean System Files"
