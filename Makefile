up:
	docker-compose up -d

down:
	docker-compose up -d

createdb:
	docker exec -it master-go-postgres-1 createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it master-go-postgres-1 dropdb --username=postgres simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: down createdb dropdb migrateup migratedown sqlc