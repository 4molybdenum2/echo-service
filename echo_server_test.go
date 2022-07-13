package kube_e2e_test

import (
	http "net/http"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

const (
	echoServerUrlWithTls  = "https://test.com"
	echoServerUrlInsecure = "http://test.com"
)

var _ = Describe("Echo server argocd tests", func() {

})

var _ = Describe("EchoServer ingress tests", func() {
	Context("echo-server Deployment should be available", func() {})

	Context("route with https (tls)", func() {
		It("should return 200", func() {
			resp, err := http.Get(echoServerUrlInsecure)
			Expect(err).To(BeNil())
			Expect(resp.StatusCode).To(Equal(http.StatusOK))
		})
	})

	Context("route without http (insecure)", func() {
		It("url without http (insecure)", func() {
			resp, err := http.Get(echoServerUrlWithTls)
			Expect(err).To(BeNil())
			Expect(resp.StatusCode).To(Equal(http.StatusOK))
		})
	})

	Context("route with vpn-only middleware, with vpn not enabled", func() {
		// network entry in openvpn cloud hasn't been made
		It("should return 403", func() {
			resp, err := http.Get(echoServerUrlInsecure + "/vpn")
			Expect(err).To(BeNil())
			Expect(resp.StatusCode).To(Equal(http.StatusForbidden))
		})
	})
})
