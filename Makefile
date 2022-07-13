all: up test

test_bed_up:
	kustomize build echo-service | kubectl apply -f -

test:
	ginkgo
