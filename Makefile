PASSWORD=gisdatabase

postgis:
	docker run --name postgis-test -e POSTGRES_PASSWORD=$(PASSWORD) -d mdillon/postgis
