# MySQL Server and Adminer on Docker
You need docker-compose to run mysql.yml\n
Run with:\n
  \tdocker-compose -f mysql.yml up -d\n
Reset with:\n
  \tdocker-compose -f mysql.yml up --build --force-recreate --no-deps -V\n
