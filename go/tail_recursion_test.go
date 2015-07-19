package exercise_test

import (
	"runtime"
	"testing"
)

// Go compiler does not support tail call optimization.
// https://groups.google.com/forum/#!msg/golang-nuts/nOS2FEiIAaM/miAg83qEn-AJ
// - To make stack traces more useful.
// - Go is not Scheme.
func TestTailRecursion(t *testing.T) {
	count := 10
	stacked := countStack()
	stackCount := recursionFunc(count)
	if stackCount != count+stacked {
		t.Error("want %d, got %d", count+stacked, stackCount)
	}
}

func recursionFunc(count int) int {
	if count == 1 {
		//debug.PrintStack()
		return countStack()
	}
	return recursionFunc(count - 1)
}

func countStack() int {
	var i int = 1 // 1 frame up
	for ; ; i++ {
		_, _, _, ok := runtime.Caller(i)
		if !ok {
			break
		}
	}
	return i
}
