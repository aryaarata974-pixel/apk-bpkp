<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard Konsultan</h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

            @if (session('success'))
                <div class="bg-green-100 text-green-700 p-3 rounded mb-4 text-sm">{{ session('success') }}</div>
            @endif

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="font-semibold mb-4">Daftar Konsultasi Masuk</h3>
                @forelse ($konsultasis as $k)
                    <div class="border-b py-3 flex justify-between items-center">
                        <a href="{{ route('konsultasi.show', $k->id) }}" class="flex-1 hover:bg-gray-50 -mx-2 px-2 py-1 rounded">
                            <p class="font-medium">{{ $k->audiens->name }}</p>
                            <p class="text-sm text-gray-500">Status: {{ $k->status }}</p>
                        </a>
                        <form action="{{ route('konsultasi.destroy', $k->id) }}" method="POST"
                            onsubmit="return confirm('Hapus konsultasi dengan {{ $k->audiens->name }}? Semua chat di dalamnya juga akan terhapus.')">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="text-red-600 hover:underline text-sm ml-4">
                                Hapus
                            </button>
                        </form>
                    </div>
                @empty
                    <p class="text-gray-400">Belum ada permintaan konsultasi.</p>
                @endforelse
            </div>
        </div>
    </div>

    @push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const userId = {{ auth()->id() }};

            window.Echo.private(`user.${userId}`)
                .listen('.AktivitasKonsultasi', () => {
                    window.location.reload();
                });
        });
    </script>
    @endpush
</x-app-layout>