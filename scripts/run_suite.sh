#!/usr/bin/env bash
set -e 

# Ejecuta un test suite si la variable de entorno TEST-SUITE está configurada
if [ -z "$TEST_SUITE"]; then
    TEST_SUITE=""
fi

CMD="robot --console verbose --outputdir /reports /test_suites/$TEST_SUITE"

echo "********Inicio validaciones del contenedor...********"

ls /usr/bin/ | grep chrome
ls /usr/local/bin/ | grep chrome 

google-chrome --version
chromedriver -v

chmod 777 /usr/local/bin/chromedriver

echo "********Final validaciones del contenedor...********"


echo ${CMD}

``${CMD}``