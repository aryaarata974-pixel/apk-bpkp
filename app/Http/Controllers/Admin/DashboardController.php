<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Konsultasi;

class DashboardController extends Controller
{
    public function index()
    {
        $totalAudiens = User::where('role', 'audiens')->count();
        $totalKonsultan = User::where('role', 'konsultan')->count();
        $totalKonsultasi = Konsultasi::count();

        return view('admin.dashboard', compact('totalAudiens', 'totalKonsultan', 'totalKonsultasi'));
    }
}