package database

import (
	"database/sql"

	_ "github.com/lib/pq"
)

var DB *sql.DB

func ConnectionDB() (*sql.DB, error) {
	var err error
	DB, err := sql.Open("postgres", "postgres://go_api:Password123#@localhost/financial")
	return DB, err
}
