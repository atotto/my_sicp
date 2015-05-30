test: schemetest gotest

schemetest:
	gosh scheme/run-test.scm

gotest:
	go test -v ./go/...
