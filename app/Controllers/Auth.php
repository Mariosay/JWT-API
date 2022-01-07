<?php
// https://github.com/rivalix/apirestful-segura-ci4-jwt.git
namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UserModel;
use CodeIgniter\HTTP\ResponseInterface;
use PHPUnit\Util\Xml\Validator;

class Auth extends BaseController
{
    public function register()
    {
       $rules=[
           'name'=>'required',
           'email'=> 'required|valid_email|is_unique[user.email]',
           'password'=>'required|min_length[8]|max_length[255]'
       ];
       $input = $this -> getRequestInput($this->request);
       if(!$this->validateRequest($input,$rules)){
           return $this->getResponse($this->Validator->getErrors(),ResponseInterface::HTTP_BAD_REQUEST);
       }
       $userModel =new UserModel();
       $userModel->save($input);
       return $this->getJWTForUser($input['email'],ResponseInterface::HTTP_CREATED);
    }

    public function login(){
        $rules=[
            'email'=> 'required|min_length[6]|max_length[50]|valid_email',
            'password'=>'required|min_length[8]|max_length[255]|validateUser[email,password]'
        ];
        $errors =[
            'password'=> [
                'validateUser'=> 'Invalid login credentials provided'
            ]
            ];
            $input= $this->getRequestInput($this->request);

            if(!$this->validateRequest($input,$rules,$errors)){
               return $this->getResponse($this->validator->getErrors(),ResponseInterface::HTTP_BAD_REQUEST); 
               
            }
            return $this->getJWTForUser($input['email']);

    }
    private function getJWTForUser(string $email, int $resposeCode = ResponseInterface::HTTP_OK)
    {
        try{
            $model = new UserModel();
            $user =$model ->findUserByEmailAddress($email);
            unSet($user['password']);

            helper('jwt');

            return $this->getResponse([
                'message'=>'user authenticated successfully',
                'user'=>$user,
                'access_token' =>getSignedJWTForUser($email)
            ]);
        }catch(\Exception $e){
            return $this->getResponse([
                'response'=> $e->getMessage()
            ],$resposeCode);
        }
    }
}
