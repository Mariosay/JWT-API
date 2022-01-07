<?php namespace App\Models;
use CodeIgniter\Model;
use Exception;
class UserModel extends Model{

    protected $table = 'user';
    protected $allowedFields =[
        'name', 'email', 'password'
    ];
    protected $updateField = 'updated_at';

    protected $beforeInsert = ['beforeInsert'];
    protected $beforeUdate = ['beforeUdate'];

    protected function beforeInsert(array $data):array
    {
        return $this->getUpdatedDataWithHashedPassword($data);
    }

    protected function beforeUdate(array $data):array
    {
        return $this->getUpdatedDataWithHashedPassword($data);
    }

    private function getUpdatedDataWithHashedPassword(array $data):array
    {
        if(isset($data['data']['password'])){
            $plaintextPassword = $data['data']['password'];
            $data['data']['password'] = password_hash($plaintextPassword,PASSWORD_BCRYPT);
        }
        return $data;
    }

    public function findUserByEmailAddress(string $emailAddress){
        $user = $this->asArray()->where(['email'=>$emailAddress])->first();
    
        if(!$user){
            throw new \Exception('User does not exist for specified email address');
        }
        return $user;
    
    }

}







