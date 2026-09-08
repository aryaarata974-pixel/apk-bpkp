<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Tambah Profil Konsultan</h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-lg mx-auto sm:px-6 lg:px-8">
            <div class="bg-white shadow rounded-lg p-6">
                @if ($errors->any())
                    <div class="bg-red-100 text-red-700 p-3 rounded mb-4 text-sm">
                        <ul class="list-disc list-inside">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form action="{{ route('admin.konsultan-profil.store') }}" method="POST" class="space-y-4">
                    @csrf
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Pilih User Konsultan</label>
                        <select name="user_id" class="w-full border border-gray-300 rounded-md px-3 py-2" required>
                            <option value="">-- Pilih --</option>
                            @foreach ($usersTanpaProfil as $u)
                                <option value="{{ $u->id }}">{{ $u->name }} ({{ $u->email }})</option>
                            @endforeach
                        </select>
                        @if ($usersTanpaProfil->isEmpty())
                            <p class="text-xs text-gray-400 mt-1">Semua user dengan role konsultan sudah punya profil, atau belum ada yang register sebagai konsultan.</p>
                        @endif
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Kategori</label>
                        <select name="kategori_id" class="w-full border border-gray-300 rounded-md px-3 py-2" required>
                            <option value="">-- Pilih Kategori --</option>
                            @foreach ($kategoris as $kat)
                                <option value="{{ $kat->id }}">{{ $kat->nama_kategori }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Bio</label>
                        <textarea name="bio" rows="3" class="w-full border border-gray-300 rounded-md px-3 py-2">{{ old('bio') }}</textarea>
                    </div>
                    <div class="flex gap-3">
                        <button type="submit" class="bg-blue-600 text-white px-5 py-2 rounded-md hover:bg-blue-700">Simpan</button>
                        <a href="{{ route('admin.konsultan-profil.index') }}" class="text-gray-600 px-5 py-2 rounded-md border border-gray-300 hover:bg-gray-50">Batal</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>