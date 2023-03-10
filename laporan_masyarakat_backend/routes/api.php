<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MyController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', [MyController::class, 'login']);
Route::post('report', [MyController::class, 'report']);
Route::post('report_list', [MyController::class, 'reportList']);
Route::post('report_list_all', [MyController::class, 'reportListAll']);
Route::post('all_users', [MyController::class, 'getAllUsers']);
