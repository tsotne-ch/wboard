// Package router handles HTTP routing, endpoints and middleware
package router

import "net/http"

func New() *http.ServeMux {
	mux := http.NewServeMux()

	mux.HandleFunc("GET /health", func(w http.ResponseWriter, r *http.Request) {
		_, err := w.Write([]byte("Server is up and running!"))
		if err != nil {
			http.Error(w, "Error writing response", http.StatusInternalServerError)
			return
		}
	})

	return mux
}
