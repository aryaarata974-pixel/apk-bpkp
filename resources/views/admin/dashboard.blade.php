<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard Admin</h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">

            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="bg-white p-6 rounded-lg shadow">
                    <p class="text-gray-500 text-sm">Total Audiens</p>
                    <p class="text-3xl font-bold">{{ $totalAudiens }}</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow">
                    <p class="text-gray-500 text-sm">Total Konsultan</p>
                    <p class="text-3xl font-bold">{{ $totalKonsultan }}</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow">
                    <p class="text-gray-500 text-sm">Total Konsultasi</p>
                    <p class="text-3xl font-bold">{{ $totalKonsultasi }}</p>
                </div>
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="font-semibold mb-4">Menu Kelola</h3>
                <div class="flex flex-wrap gap-3">
                    <a href="{{ route('admin.kategori.index') }}"
                        class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 text-sm">
                        Kelola Kategori Konsultan
                    </a>
                    <a href="{{ route('admin.konsultan-profil.index') }}"
                        class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 text-sm">
                        Kelola Profil Konsultan
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>