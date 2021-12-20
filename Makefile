start:
	cd web; npm start

deploy:
	source .env; ./scripts/deploy

tf-apply:
	source .env; cd ./terraform; terraform init; terraform apply