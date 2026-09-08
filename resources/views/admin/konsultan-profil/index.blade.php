<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Kelola Profil Konsultan</h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-5xl mx-auto sm:px-6 lg:px-8">
            @if (session('success'))
                <div class="bg-green-100 text-green-700 p-3 rounded mb-4 text-sm">{{ session('success') }}</div>
            @endif

            <a href="{{ route('admin.konsultan-profil.create') }}" class="inline-block mb-4 bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 text-sm">
                + Tambah Profil Konsultan
            </a>

            <div class="bg-white shadow rounded-lg overflow-hidden">
                <table class="w-full text-sm text-left">
                    <thead class="bg-gray-50 text-gray-600 uppercase text-xs">
                        <tr>
                            <th class="px-4 py-3">Nama</th>
                            <th class="px-4 py-3">Kategori</th>
                            <th class="px-4 py-3">Status</th>
                            <th class="px-4 py-3 text-right">Aksi</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        @forelse ($profils as $profil)
                            <tr>
                                <td class="px-4 py-3 font-medium">{{ $profil->user->name }}</td>
                                <td class="px-4 py-3 text-gray-500">{{ $profil->kategori->nama_kategori }}</td>
                                <td class="px-4 py-3">
                                    @if ($profil->aktif)
                                        <span class="bg-green-100 text-green-700 px-2 py-1 rounded-full text-xs">Aktif</span>
                                    @else
                                        <span class="bg-gray-100 text-gray-500 px-2 py-1 rounded-full text-xs">Nonaktif</span>
                                    @endif
                                </td>
                                <td class="px-4 py-3 text-right space-x-2">
                                    <a href="{{ route('admin.konsultan-profil.edit', $profil->id) }}" class="text-blue-600 hover:underline">Edit</a>
                                    <form action="{{ route('admin.konsultan-profil.destroy', $profil->id) }}" method="POST" class="inline" onsubmit="return confirm('Yakin hapus?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="text-red-600 hover:underline">Hapus</button>
                                    </form>
                                </td>
                            </tr>
                        @empty
                            <tr><td colspan="4" class="px-4 py-6 text-center text-gray-400">Belum ada profil konsultan.</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</x-app-layout>