#! /usr/bin/sh

timestamp=$(date +%d-%m-%Y)
codigo=$1;
documento=$2

curl 'https://servicosonline.cpfl.com.br/agencia-webapi/api/via-pagamento/validar-situacao' \
  -H 'authority: servicosonline.cpfl.com.br' \
  -H 'pragma: no-cache' \
  -H 'cache-control: no-cache' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36' \
  -H 'content-type: application/json;charset=UTF-8' \
  -H 'sec-gpc: 1' \
  -H 'origin: https://servicosonline.cpfl.com.br' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://servicosonline.cpfl.com.br/agencia-webapp/' \
  -H 'accept-language: pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7' \
  --data-raw '{"Instalacao":"'${codigo}'","Documento":"'${documento}'","nrContaContrato":null}' \
  --compressed > /tmp/CPFL_${timestamp}.json

codigoBarras=$(cat /tmp/CPFL_${timestamp}.json | jq '.ContasAberto[0].CodigoBarras')
vencimento=$(cat /tmp/CPFL_${timestamp}.json | jq '.ContasAberto[0].Vencimento')
valor=$(cat /tmp/CPFL_${timestamp}.json | jq '.ContasAberto[0].Valor')

echo "Consulta em ${timestamp}"
echo "Vencimento ${vencimento}"
echo "Valor ${valor}"
echo "CodigoBarras ${codigoBarras}"

echo "------------------------------------------"

codigoBarras=$(cat /tmp/CPFL_${timestamp}.json | jq '.ContasAberto[1].CodigoBarras')
vencimento=$(cat /tmp/CPFL_${timestamp}.json | jq '.ContasAberto[1].Vencimento')
valor=$(cat /tmp/CPFL_${timestamp}.json | jq '.ContasAberto[1].Valor')

echo "Consulta em ${timestamp}"
echo "Vencimento ${vencimento}"
echo "Valor ${valor}"
echo "CodigoBarras ${codigoBarras}"
