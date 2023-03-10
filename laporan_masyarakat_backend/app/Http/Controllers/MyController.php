<?php

namespace App\Http\Controllers;

use App\Models\RerortModel;
use App\Models\UserModell;
use Illuminate\Http\Request;
use Spatie\FlareClient\Report;

class MyController extends Controller
{
    private $userModel;
    private $reportModel;
    public function __construct()
    {
        $this->userModel = new UserModell();
        $this->reportModel = new RerortModel();
    }

    public function login(Request $request){
        $username = $request->all()['username'];
        $password = $request->all()['password'];

        $hasil_login = $this->userModel::all()
            ->where('username', '=', $username)
            ->where('password', '=', $password)->first();
        return $hasil_login;
    }

    public function report(Request $request){
        $id_user = $request->all()['id_user'];
        $report = $request->all()['report'];
        $result = $this->reportModel::create([
            'content' => $report,
            'id_user' => $id_user,
        ]);

        if($result){
            return $result;
        }else {
            return 'Gagal';
        }
    }

    public function reportList(Request $request){
        $id_user = $request->all()['id_user'];
        $reports = $this->reportModel::all()
            ->where('id_user', '=', $id_user)
            ->toArray();

        foreach ($reports as $report){
            $extracted[] = $report;
        }
        return $extracted;
    }

    public function reportListAll(Request $request){
        $reports = $this->reportModel::all()
            ->toArray();

        foreach ($reports as $report){
            $username = $this->userModel::all()->find($report['id_user'])['username'];
//            return $username;
            $report['id_user'] = $username;
            $extracted[] = $report;
        }
        return $extracted;
    }

    public function getAllUsers(){
        return $this->userModel::all()->toArray();
    }
}
