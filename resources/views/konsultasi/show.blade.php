<x-app-layout>
    <x-slot name="header">
        <div class="flex justify-between items-center">
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Konsultasi dengan {{ auth()->user()->id === $konsultasi->audiens_id ? $konsultasi->konsultan->name : $konsultasi->audiens->name }}
            </h2>
            <button id="btn-hapus-semua" class="text-red-600 text-sm hover:underline">
                Hapus Semua Chat
            </button>
        </div>
    </x-slot>

    <div class="py-12">
        <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
            <p class="text-xs text-gray-400 mb-2 text-center">
                Klik kanan (atau tekan-tahan di HP) pesan kamu sendiri untuk menghapus
            </p>
            <div class="bg-white shadow rounded-lg p-6 h-96 overflow-y-auto flex flex-col gap-3" id="chat-box">
                @foreach ($konsultasi->pesans as $pesan)
                    <div id="pesan-{{ $pesan->id }}"
                        class="max-w-xs px-4 py-2 rounded-lg select-none {{ $pesan->pengirim_id === auth()->id() ? 'ml-auto bg-blue-600 text-white pesan-milik-sendiri' : 'bg-gray-100 text-gray-800' }}"
                        style="-webkit-touch-callout: none; -webkit-user-select: none; touch-action: manipulation;"
                        data-id="{{ $pesan->id }}" data-milik-sendiri="{{ $pesan->pengirim_id === auth()->id() ? '1' : '0' }}">
                        <p class="text-sm">{{ $pesan->isi_pesan }}</p>
                        <p class="text-[10px] opacity-70 mt-1">{{ $pesan->created_at->format('H:i') }}</p>
                    </div>
                @endforeach
            </div>

            <form id="form-pesan" class="mt-4 flex gap-2">
                <input type="text" id="input-pesan" autocomplete="off"
                    class="flex-1 border border-gray-300 rounded-md px-3 py-2"
                    placeholder="Tulis pesan...">
                <button type="submit" class="bg-blue-600 text-white px-5 py-2 rounded-md hover:bg-blue-700">
                    Kirim
                </button>
            </form>
        </div>
    </div>

    @push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const konsultasiId = {{ $konsultasi->id }};
            const userId = {{ auth()->id() }};
            const chatBox = document.getElementById('chat-box');
            const form = document.getElementById('form-pesan');
            const input = document.getElementById('input-pesan');
            const btnHapusSemua = document.getElementById('btn-hapus-semua');
            const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

            function buatBubble(id, isiPesan, waktu, pengirimId) {
                const bubble = document.createElement('div');
                bubble.id = `pesan-${id}`;
                bubble.dataset.id = id;
                bubble.dataset.milikSendiri = pengirimId === userId ? '1' : '0';
                bubble.className = 'max-w-xs px-4 py-2 rounded-lg select-none ' +
                    (pengirimId === userId ? 'ml-auto bg-blue-600 text-white pesan-milik-sendiri' : 'bg-gray-100 text-gray-800');
                bubble.style.webkitTouchCallout = 'none';
                bubble.style.webkitUserSelect = 'none';
                bubble.style.touchAction = 'manipulation';

                const p1 = document.createElement('p');
                p1.className = 'text-sm';
                p1.textContent = isiPesan;

                const p2 = document.createElement('p');
                p2.className = 'text-[10px] opacity-70 mt-1';
                p2.textContent = waktu;

                bubble.appendChild(p1);
                bubble.appendChild(p2);

                if (pengirimId === userId) {
                    pasangEventHapus(bubble);
                }

                chatBox.appendChild(bubble);
                chatBox.scrollTop = chatBox.scrollHeight;
            }

            async function hapusPesan(id) {
                if (!confirm('Hapus pesan ini?')) return;

                await fetch(`/konsultasi/${konsultasiId}/pesan/${id}`, {
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-TOKEN': csrfToken,
                        'X-Socket-ID': window.Echo.socketId(),
                    },
                });

                const el = document.getElementById(`pesan-${id}`);
                if (el) el.remove();
            }

            function pasangEventHapus(el) {
                let sudahDiproses = false;
                let timerTekan;

                function prosesHapus() {
                    if (sudahDiproses) return;
                    sudahDiproses = true;
                    hapusPesan(el.dataset.id);
                    setTimeout(() => { sudahDiproses = false; }, 1500);
                }

                el.addEventListener('contextmenu', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                });

                el.addEventListener('touchstart', function (e) {
                    timerTekan = setTimeout(() => {
                        prosesHapus();
                    }, 600);
                }, { passive: true });

                el.addEventListener('touchend', function () {
                    clearTimeout(timerTekan);
                });

                el.addEventListener('touchmove', function () {
                    clearTimeout(timerTekan);
                });

                el.addEventListener('mousedown', function (e) {
                    if (e.button === 2) {
                        prosesHapus();
                    }
                });
            }

            // Pasang event untuk pesan yang sudah ada (dari database)
            document.querySelectorAll('.pesan-milik-sendiri').forEach(pasangEventHapus);

            btnHapusSemua.addEventListener('click', async () => {
                if (!confirm('Hapus SEMUA chat di percakapan ini? Tindakan ini tidak bisa dibatalkan.')) return;

                await fetch(`/konsultasi/${konsultasiId}/pesan`, {
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-TOKEN': csrfToken,
                        'X-Socket-ID': window.Echo.socketId(),
                    },
                });

                chatBox.innerHTML = '';
            });

            form.addEventListener('submit', async function (e) {
                e.preventDefault();
                const isiPesan = input.value.trim();
                if (!isiPesan) return;

                input.value = '';

                const res = await fetch(`/konsultasi/${konsultasiId}/pesan`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                        'X-Socket-ID': window.Echo.socketId(),
                    },
                    body: JSON.stringify({ isi_pesan: isiPesan }),
                });

                const data = await res.json();
                buatBubble(data.id, isiPesan, 'Baru saja', userId);
            });

            window.Echo.private(`konsultasi.${konsultasiId}`)
                .listen('.PesanDikirim', (e) => {
                    if (e.pengirim_id === userId) return;
                    buatBubble(e.id, e.isi_pesan, e.waktu, e.pengirim_id);
                })
                .listen('.PesanDihapus', (e) => {
                    const el = document.getElementById(`pesan-${e.pesan_id}`);
                    if (el) el.remove();
                })
                .listen('.ChatDibersihkan', () => {
                    chatBox.innerHTML = '';
                });

            chatBox.scrollTop = chatBox.scrollHeight;
        });
    </script>
    @endpush
</x-app-layout>