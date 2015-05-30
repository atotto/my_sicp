package exercise_test

import (
	"math/cmplx"
	"testing"
)

const delta = 1e-5

func Cbrt(x complex128) complex128 {
	z := x
	for {
		n := z - (z*z*z-x)/(3*z*z)
		if cmplx.Abs(n-z) < delta {
			break
		}
		z = n
	}
	return z
}

func TestCbrt(t *testing.T) {
	const x = 2
	actual, expect := Cbrt(x), cmplx.Pow(x, 1./3.)

	if !IsClose(real(actual), real(expect), 1e-5) {
		t.Errorf("Cbrt(%g) = %g, want %g", x, actual, expect)
	}
}
