<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\KonsultanProfil;
use App\Models\KategoriKonsultan;
use App\Models\User;
use Illuminate\Http\Request;

class KonsultanProfilController extends Controller
{
    public function index()
    {
        $profils = KonsultanProfil::with('user', 'kategori')->latest()->get();
        return view('admin.konsultan-profil.index', compact('profils'));
    }

    public function create()
    {
        $usersTanpaProfil = User::where('role', 'konsultan')
            ->whereDoesntHave('konsultanProfil')
            ->get();
        $kategoris = KategoriKonsultan::all();

        return view('admin.konsultan-profil.create', compact('usersTanpaProfil', 'kategoris'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'kategori_id' => 'required|exists:kategori_konsultans,id',
            'bio' => 'nullable|string',
        ]);

        KonsultanProfil::create([
            ...$validated,
            'aktif' => true,
        ]);

        return redirect()->route('admin.konsultan-profil.index')->with('success', 'Profil konsultan berhasil dibuat.');
    }

    public function edit(KonsultanProfil $konsultanProfil)
    {
        $kategoris = KategoriKonsultan::all();
        return view('admin.konsultan-profil.edit', compact('konsultanProfil', 'kategoris'));
    }

    public function update(Request $request, KonsultanProfil $konsultanProfil)
    {
        $validated = $request->validate([
            'kategori_id' => 'required|exists:kategori_konsultans,id',
            'bio' => 'nullable|string',
            'aktif' => 'boolean',
        ]);

        $konsultanProfil->update($validated);

        return redirect()->route('admin.konsultan-profil.index')->with('success', 'Profil konsultan berhasil diperbarui.');
    }

    public function destroy(KonsultanProfil $konsultanProfil)
    {
        $konsultanProfil->delete();
        return redirect()->route('admin.konsultan-profil.index')->with('success', 'Profil konsultan berhasil dihapus.');
    }
}