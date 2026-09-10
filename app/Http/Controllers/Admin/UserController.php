<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ActivityLog;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function index()
    {
        $users = User::latest()->paginate(15);
        return view('admin.users.index', compact('users'));
    }

    public function edit(User $user)
    {
        return view('admin.users.edit', compact('user'));
    }

    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'role' => 'required|in:admin,konsultan,audiens',
        ]);

        $user->update($validated);

        ActivityLog::catat(Auth::id(), 'Kelola Akun', Auth::user()->name . ' memperbarui akun ' . $user->name);

        return redirect()->route('admin.users.index')->with('success', 'Akun berhasil diperbarui.');
    }

    public function destroy(User $user)
    {
        abort_if($user->id === Auth::id(), 403, 'Tidak bisa menghapus akun sendiri.');

        $nama = $user->name;
        $user->delete();

        ActivityLog::catat(Auth::id(), 'Kelola Akun', Auth::user()->name . ' menghapus akun ' . $nama);

        return redirect()->route('admin.users.index')->with('success', 'Akun berhasil dihapus.');
    }
}