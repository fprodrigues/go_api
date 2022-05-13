package models

type Transfer struct {
	id                     int64
	account_origin_id      int
	account_destination_id int
	amount                 float64
	created_at             string
}
