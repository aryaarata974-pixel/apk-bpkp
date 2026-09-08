<?php

namespace App\Http\Controllers;

use App\Events\AktivitasKonsultasi;
use App\Events\ChatDibersihkan;
use App\Events\PesanDikirim;
use App\Models\Konsultasi;
use App\Models\Pesan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PesanController extends Controller
{
    public function store(Request $request, Konsultasi $konsultasi)
    {
        $user = Auth::user();

        abort_unless(
            $konsultasi->audiens_id === $user->id || $konsultasi->konsultan_id === $user->id,
            403
        );

        $validated = $request->validate([
            'isi_pesan' => 'required|string|max:2000',
        ]);

        $pesan = Pesan::create([
            'konsultasi_id' => $konsultasi->id,
            'pengirim_id' => $user->id,
            'isi_pesan' => $validated['isi_pesan'],
        ]);

        $updateData = [];

        if ($konsultasi->status === 'menunggu') {
            $updateData['status'] = 'berlangsung';
        }

        if ($user->id === $konsultasi->audiens_id && $konsultasi->disembunyikan_oleh_konsultan) {
            $updateData['disembunyikan_oleh_konsultan'] = false;
        }

        if ($user->id === $konsultasi->konsultan_id && $konsultasi->disembunyikan_oleh_audiens) {
            $updateData['disembunyikan_oleh_audiens'] = false;
        }

        if (!empty($updateData)) {
            $konsultasi->update($updateData);
        }

        broadcast(new PesanDikirim($pesan))->toOthers();

        $penerimaId = $user->id === $konsultasi->audiens_id ? $konsultasi->konsultan_id : $konsultasi->audiens_id;
        broadcast(new AktivitasKonsultasi($penerimaId));

        return response()->json(['success' => true, 'id' => $pesan->id]);
    }

    public function destroy(Konsultasi $konsultasi, Pesan $pesan)
    {
        $user = Auth::user();

        abort_unless($pesan->konsultasi_id === $konsultasi->id, 404);
        abort_unless($pesan->pengirim_id === $user->id, 403);

        $pesan->update(['disembunyikan_oleh_pengirim' => true]);

        return response()->json(['success' => true]);
    }

    public function clear(Konsultasi $konsultasi)
    {
        $user = Auth::user();

        abort_unless(
            $konsultasi->audiens_id === $user->id || $konsultasi->konsultan_id === $user->id,
            403
        );

        $konsultasi->pesans()->delete();

        broadcast(new ChatDibersihkan($konsultasi->id))->toOthers();

        return response()->json(['success' => true]);
    }
}