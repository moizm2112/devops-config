<?php


$variables = [

        'PHP_APP_URL' => 'https://sandbox1-dev.paywalletllc.com/php/',
        'SERVER_URL' => 'https://sandbox1-dev.paywalletllc.com/api/v1/',
        'REACT_APP_URL' => 'https://sandbox1-dev.paywalletllc.com/salesrep/',
        'GET_TOKEN_URL' => 'https://sandbox1-dev.paywalletllc.com:8443/auth/realms/luther-sales/protocol/openid-connect/token',
        'CLIENT_ID' => 'luthersales-inhouse-app',
        'CLIENT_SECRET' => '4629c60b-35b1-4a49-8480-1e59d92fccd3',
        'GRANT_TYPE' => 'client_credentials',
  ];

    foreach ($variables as $key => $value) {
        putenv("$key=$value");
    }
?>
