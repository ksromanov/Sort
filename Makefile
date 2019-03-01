CLM=env CLEANLIB=/usr/lib64/clean/exe/ clm -lat -lset -I /usr/lib64/clean/StdEnv/ 

UTIL=UtilityFunctions.dcl UtilityFunctions.icl

all: selectionSort

selectionSort: selectionSort.icl ${UTIL}
	$(CLM) selectionSort -o selectionSort

clean:
	rm -f selectionSort
	rm -rf "Clean System Files"
