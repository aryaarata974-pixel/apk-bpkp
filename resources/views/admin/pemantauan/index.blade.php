<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Memantau Percakapan</h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-5xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white shadow rounded-lg overflow-hidden">
                <table class="w-full text-sm text-left">
                    <thead class="bg-gray-50 text-gray-600 uppercase text-xs">
                        <tr>
                            <th class="px-4 py-3">Audiens</th>
                            <th class="px-4 py-3">Konsultan</th>
                            <th class="px-4 py-3">Status</th>
                            <th class="px-4 py-3">Terakhir Diperbarui</th>
                            <th class="px-4 py-3 text-right">Aksi</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        @forelse ($konsultasis as $k)
                            <tr>
                                <td class="px-4 py-3">{{ $k->audiens->name }}</td>
                                <td class="px-4 py-3">{{ $k->konsultan->name }}</td>
                                <td class="px-4 py-3">
                                    <span class="px-2 py-1 rounded-full text-xs bg-gray-100 text-gray-700">{{ $k->status }}</span>
                                </td>
                                <td class="px-4 py-3 text-gray-500">{{ $k->updated_at->format('d/m/Y H:i') }}</td>
                                <td class="px-4 py-3 text-right">
                                    <a href="{{ route('admin.pemantauan.show', $k->id) }}" class="text-blue-600 hover:underline">Lihat Chat</a>
                                </td>
                            </tr>
                        @empty
                            <tr><td colspan="5" class="px-4 py-6 text-center text-gray-400">Belum ada percakapan.</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</x-app-layout>