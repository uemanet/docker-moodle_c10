init:
	echo "Subindo o container"
	docker-compose up -d

copyfiles:
	echo "Copiando arquivos"
	docker-compose exec web bash /var/scripts/copy_files.sh

importdb:
	echo "Importando a base de dados"
	docker-compose exec web bash /var/scripts/import_database.sh

upgrade:
	echo "Atualizando o moodle"
	docker-compose exec web bash /var/scripts/upgrade.sh