<?php

namespace App\Http\Controllers\Audiens;

use App\Http\Controllers\Controller;
use App\Models\KonsultanProfil;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        $konsultans = KonsultanProfil::with('user', 'kategori')->where('aktif', true)->get();
        $konsultasis = Auth::user()->konsultasiSebagaiAudiens()
            ->where('disembunyikan_oleh_audiens', false)
            ->with('konsultan')
            ->latest()
            ->get();

        return view('audiens.dashboard', compact('konsultans', 'konsultasis'));
    }
}