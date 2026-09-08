<?php

namespace App\Http\Controllers\Audiens;

use App\Http\Controllers\Controller;
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

        return redirect()->route('konsultasi.show', $konsultasi->id);
    }
}