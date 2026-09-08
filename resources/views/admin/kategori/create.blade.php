<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Tambah Kategori Konsultan</h2>
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

                <form action="{{ route('admin.kategori.store') }}" method="POST" class="space-y-4">
                    @csrf
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Nama Kategori</label>
                        <input type="text" name="nama_kategori" value="{{ old('nama_kategori') }}"
                            class="w-full border border-gray-300 rounded-md px-3 py-2" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Keterangan</label>
                        <textarea name="keterangan" rows="3" class="w-full border border-gray-300 rounded-md px-3 py-2">{{ old('keterangan') }}</textarea>
                    </div>
                    <div class="flex gap-3">
                        <button type="submit" class="bg-blue-600 text-white px-5 py-2 rounded-md hover:bg-blue-700">Simpan</button>
                        <a href="{{ route('admin.kategori.index') }}" class="text-gray-600 px-5 py-2 rounded-md border border-gray-300 hover:bg-gray-50">Batal</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>