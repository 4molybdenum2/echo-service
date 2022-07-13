package kube_e2e_test

import (
	"testing"

	"github.com/onsi/ginkgo/v2"
	. "github.com/onsi/ginkgo/v2"
	"github.com/onsi/gomega"
	. "github.com/onsi/gomega"
)

func TestE2e(t *testing.T) {
	RegisterFailHandler(Fail)
	gomega.RegisterFailHandler(ginkgo.Fail)
	RunSpecs(t, "e2e Suite")
}
