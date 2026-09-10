<?php

namespace App\Http\Controllers\Audiens;

use App\Http\Controllers\Controller;
use App\Models\ActivityLog;
use App\Models\Konsultasi;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class KonsultasiController extends Controller
{
    public function store(User $konsultan)
    {
        abort_if($konsultan->role !== 'konsultan', 404);

        $konsultasi = Konsultasi::firstOrCreate(
            [
                'audiens_id' => Auth::id(),
                'konsultan_id' => $konsultan->id,
            ],
            [
                'status' => 'menunggu',
            ]
        );

        if ($konsultasi->disembunyikan_oleh_audiens) {
            $konsultasi->update(['disembunyikan_oleh_audiens' => false]);
        }

        ActivityLog::catat(Auth::id(), 'Mulai Konsultasi', Auth::user()->name . ' memulai konsultasi dengan ' . $konsultan->name);

        return redirect()->route('konsultasi.show', $konsultasi->id);
    }
}