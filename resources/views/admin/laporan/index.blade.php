<x-app-layout>
    <x-slot name="header">
        <div class="flex justify-between items-center">
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Laporan Sistem</h2>
            <button onclick="window.print()" class="bg-blue-600 text-white px-4 py-2 rounded-md text-sm hover:bg-blue-700 print:hidden">
                🖨️ Cetak Laporan
            </button>
        </div>
    </x-slot>

    <div class="py-12">
        <div class="max-w-5xl mx-auto sm:px-6 lg:px-8 space-y-6">

            <div id="area-cetak">
                <h1 class="text-xl font-bold mb-1 hidden print:block">Laporan Sistem Konsultasi Online</h1>
                <p class="text-sm text-gray-500 mb-4 hidden print:block">Dicetak pada: {{ now()->format('d/m/Y H:i') }}</p>

                <div class="grid grid-cols-2 md:grid-cols-5 gap-4 mb-6">
                    <div class="bg-white p-4 rounded-lg shadow">
                        <p class="text-xs text-gray-500">Total Audiens</p>
                        <p class="text-2xl font-bold">{{ $totalAudiens }}</p>
                    </div>
                    <div class="bg-white p-4 rounded-lg shadow">
                        <p class="text-xs text-gray-500">Total Konsultan</p>
                        <p class="text-2xl font-bold">{{ $totalKonsultan }}</p>
                    </div>
                    <div class="bg-white p-4 rounded-lg shadow">
                        <p class="text-xs text-gray-500">Menunggu</p>
                        <p class="text-2xl font-bold">{{ $totalMenunggu }}</p>
                    </div>
                    <div class="bg-white p-4 rounded-lg shadow">
                        <p class="text-xs text-gray-500">Berlangsung</p>
                        <p class="text-2xl font-bold">{{ $totalBerlangsung }}</p>
                    </div>
                    <div class="bg-white p-4 rounded-lg shadow">
                        <p class="text-xs text-gray-500">Selesai</p>
                        <p class="text-2xl font-bold">{{ $totalSelesai }}</p>
                    </div>
                </div>

                <div class="bg-white shadow rounded-lg overflow-hidden">
                    <table class="w-full text-sm text-left">
                        <thead class="bg-gray-50 text-gray-600 uppercase text-xs">
                            <tr>
                                <th class="px-4 py-3">Audiens</th>
                                <th class="px-4 py-3">Konsultan</th>
                                <th class="px-4 py-3">Status</th>
                                <th class="px-4 py-3">Tanggal Dibuat</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            @forelse ($konsultasis as $k)
                                <tr>
                                    <td class="px-4 py-3">{{ $k->audiens->name }}</td>
                                    <td class="px-4 py-3">{{ $k->konsultan->name }}</td>
                                    <td class="px-4 py-3">{{ $k->status }}</td>
                                    <td class="px-4 py-3 text-gray-500">{{ $k->created_at->format('d/m/Y H:i') }}</td>
                                </tr>
                            @empty
                                <tr><td colspan="4" class="px-4 py-6 text-center text-gray-400">Belum ada data konsultasi.</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <style>
        @media print {
            nav, header, .print\:hidden { display: none !important; }
            body { background: white; }
        }
    </style>
</x-app-layout>