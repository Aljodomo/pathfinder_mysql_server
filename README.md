# MySQL Server and Adminer on Docker
You need docker-compose to run mysql.yml
Run with:
  docker-compose -f mysql.yml up -d
Reset with:
  docker-compose -f mysql.yml up --build --force-recreate --no-deps -V
