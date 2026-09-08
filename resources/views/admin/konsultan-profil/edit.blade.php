<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Edit Profil Konsultan</h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-lg mx-auto sm:px-6 lg:px-8">
            <div class="bg-white shadow rounded-lg p-6">
                <p class="text-sm text-gray-500 mb-4">Konsultan: <strong>{{ $konsultanProfil->user->name }}</strong></p>

                @if ($errors->any())
                    <div class="bg-red-100 text-red-700 p-3 rounded mb-4 text-sm">
                        <ul class="list-disc list-inside">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form action="{{ route('admin.konsultan-profil.update', $konsultanProfil->id) }}" method="POST" class="space-y-4">
                    @csrf
                    @method('PUT')
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Kategori</label>
                        <select name="kategori_id" class="w-full border border-gray-300 rounded-md px-3 py-2" required>
                            @foreach ($kategoris as $kat)
                                <option value="{{ $kat->id }}" {{ $konsultanProfil->kategori_id == $kat->id ? 'selected' : '' }}>
                                    {{ $kat->nama_kategori }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Bio</label>
                        <textarea name="bio" rows="3" class="w-full border border-gray-300 rounded-md px-3 py-2">{{ old('bio', $konsultanProfil->bio) }}</textarea>
                    </div>
                    <div class="flex items-center gap-2">
                        <input type="hidden" name="aktif" value="0">
                        <input type="checkbox" name="aktif" id="aktif" value="1" {{ $konsultanProfil->aktif ? 'checked' : '' }} class="rounded border-gray-300">
                        <label for="aktif" class="text-sm text-gray-700">Aktif</label>
                    </div>
                    <div class="flex gap-3">
                        <button type="submit" class="bg-blue-600 text-white px-5 py-2 rounded-md hover:bg-blue-700">Update</button>
                        <a href="{{ route('admin.konsultan-profil.index') }}" class="text-gray-600 px-5 py-2 rounded-md border border-gray-300 hover:bg-gray-50">Batal</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>