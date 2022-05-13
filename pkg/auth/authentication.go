package auth

import (
	"crypto/md5"
	"encoding/hex"
	"log"

	"github.com/fprodrigues/go_api/pkg/models"
)

func Authentication(cpf, password string) {
	md5Hash := md5.Sum([]byte(password))
	md5Password := hex.EncodeToString(md5Hash[:])

	secret := models.GetPassword(cpf)

	if secret == md5Password {
		log.Println("deu certo")
	}
}
