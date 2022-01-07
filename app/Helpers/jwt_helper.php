<?php 

use Config\Services;
use Firebase\JWT\JWT;
use App\Models\UserModel;

function getJWTFromRequest($authenticationHeader):string
{
    if(is_null($authenticationHeader)){
        throw new Exception ('Misisng or invalid JWT in request');
    }
    return explode(' ',$authenticationHeader)[1];
}

function validateJWTFromRequest(string $encodedToken)
{
    $key = Services:: getSecretkey();
    $decodeToken = JWT::decode($encodedToken, $key, ['HS256']);
    $userModel= new UserModel();
    $userModel->findUserByEmailAddress($decodeToken->email);
}

function getSignedJWTForUser(string $email):string
{
    $issuedAtTime= time();
    $tokenTimeToLive= getenv('JWT_TIME_TO_LIVE');
    $tokenExpiration = $issuedAtTime + $tokenTimeToLive;
    $payload=[
        'email'=> $email,
        'iat'=> $issuedAtTime,
        'exp'=> $tokenExpiration
    ];

    $jwt = JWT::encode($payload, Services::getSecretkey());

    return $jwt;
}