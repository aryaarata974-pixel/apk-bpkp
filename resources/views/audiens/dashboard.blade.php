<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard Audiens</h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">

            @if (session('success'))
                <div class="bg-green-100 text-green-700 p-3 rounded text-sm">{{ session('success') }}</div>
            @endif

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="font-semibold mb-4">Pilih Konsultan</h3>
                @forelse ($konsultans as $kp)
                    <div class="border-b py-3 flex justify-between items-center">
                        <div>
                            <p class="font-medium">{{ $kp->user->name }}</p>
                            <p class="text-sm text-gray-500">{{ $kp->kategori->nama_kategori }}</p>
                            @if ($kp->bio)
                                <p class="text-xs text-gray-400">{{ $kp->bio }}</p>
                            @endif
                        </div>
                        <form action="{{ route('audiens.konsultasi.store', $kp->user->id) }}" method="POST">
                            @csrf
                            <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md text-sm hover:bg-blue-700">
                                Mulai Konsultasi
                            </button>
                        </form>
                    </div>
                @empty
                    <p class="text-gray-400">Belum ada konsultan tersedia.</p>
                @endforelse
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="font-semibold mb-4">Konsultasi Saya</h3>
                @forelse ($konsultasis as $k)
                    <div class="border-b py-3 flex justify-between items-center">
                        <a href="{{ route('konsultasi.show', $k->id) }}" class="flex-1 hover:bg-gray-50 -mx-2 px-2 py-1 rounded">
                            <p class="font-medium">{{ $k->konsultan->name }}</p>
                            <p class="text-sm text-gray-500">Status: {{ $k->status }}</p>
                        </a>
                        <form action="{{ route('konsultasi.destroy', $k->id) }}" method="POST"
                            onsubmit="return confirm('Hapus konsultasi dengan {{ $k->konsultan->name }}? Semua chat di dalamnya juga akan terhapus.')">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="text-red-600 hover:underline text-sm ml-4">
                                Hapus
                            </button>
                        </form>
                    </div>
                @empty
                    <p class="text-gray-400">Belum ada konsultasi.</p>
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