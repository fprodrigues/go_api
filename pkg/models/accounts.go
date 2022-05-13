package models

import (
	"fmt"

	"github.com/fprodrigues/go_api/config/database"
)

var Account struct {
	id         int64
	name       string
	cpf        string
	secret     string
	balance    float64
	created_at string
}

func GetPassword(cpf string) (secret string) {
	sqlUserPassword := fmt.Sprintf("SELECT secrect FROM accounts WHERE cpf =" + cpf)

	err := database.DB.QueryRow(sqlUserPassword, 1).Scan(Account.secret)

	if err != nil {
		//to do
	}
	return Account.secret
}
