<?php

namespace App\Http\Controllers\Konsultan;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        $konsultasis = Auth::user()->konsultasiSebagaiKonsultan()
            ->where('disembunyikan_oleh_konsultan', false)
            ->with('audiens')
            ->latest()
            ->get();

        return view('konsultan.dashboard', compact('konsultasis'));
    }
}