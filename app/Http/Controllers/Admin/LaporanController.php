<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Konsultasi;
use App\Models\User;

class LaporanController extends Controller
{
    public function index()
    {
        $totalAudiens = User::where('role', 'audiens')->count();
        $totalKonsultan = User::where('role', 'konsultan')->count();
        $totalMenunggu = Konsultasi::where('status', 'menunggu')->count();
        $totalBerlangsung = Konsultasi::where('status', 'berlangsung')->count();
        $totalSelesai = Konsultasi::where('status', 'selesai')->count();

        $konsultasis = Konsultasi::with('audiens', 'konsultan')->latest()->get();

        return view('admin.laporan.index', compact(
            'totalAudiens',
            'totalKonsultan',
            'totalMenunggu',
            'totalBerlangsung',
            'totalSelesai',
            'konsultasis'
        ));
    }
}