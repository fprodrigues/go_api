package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strings"

	"github.com/fprodrigues/go_api/config/database"
	"github.com/fprodrigues/go_api/pkg/auth"
	"github.com/gorilla/mux"
)

type loginStruct struct {
	Cpf      string
	Password string
}

func main() {
	db, dbErr := database.ConnectionDB()

	if dbErr != nil {
		log.Fatalf("Error establishing database connection: %s", dbErr)
	}
	log.Println("Server initialing... Port: 8080")
	err := http.ListenAndServe(":8080", handler())
	if err != nil {
		log.Fatal(err)
	}

	defer db.Close()
}

func handler() http.Handler {
	router := mux.NewRouter()
	router.HandleFunc("/login", login).Methods("POST")
	router.HandleFunc("/accounts", accounts).Methods("GET")
	router.HandleFunc("/accounts", newAccount).Methods("POST")
	router.HandleFunc("/accounts/{account_id}/balance", listBalanceUser).Methods("GET")
	router.HandleFunc("/transfers", listTransfersUser).Methods("GET")
	router.HandleFunc("/transfers", newTransfer).Methods("POST")
	return router
}

func login(w http.ResponseWriter, r *http.Request) {
	decoder := json.NewDecoder(r.Body)

	if r.Header.Get("Content-type") != "application/json" {
		w.WriteHeader(http.StatusUnsupportedMediaType)
		return
	}

	var login loginStruct
	err := decoder.Decode(&login)

	if err != nil {
		w.WriteHeader(http.DefaultMaxHeaderBytes)
	}

	passwordClean := strings.TrimSpace(login.Password)
	auth.Authentication(login.Cpf, passwordClean)
	fmt.Fprint(w, "foi")
}

func accounts(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "account")
}

func newAccount(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "newAccount")
}

func listBalanceUser(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "listBalance")
}

func listTransfersUser(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "listTransfersUser")
}

func newTransfer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "listTransfersUser")
}
