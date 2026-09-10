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
                Geser kanan (atau klik ikon ↩ di laptop) untuk membalas. Klik kanan/tekan-tahan pesan sendiri untuk menghapus.
            </p>
            <div class="bg-white shadow rounded-lg p-6 h-96 overflow-y-auto flex flex-col gap-3" id="chat-box">
                @foreach ($konsultasi->pesans as $pesan)
                    <div id="pesan-{{ $pesan->id }}"
                        class="w-full flex items-end gap-1 group {{ $pesan->pengirim_id === auth()->id() ? 'justify-end' : 'justify-start' }}"
                        data-id="{{ $pesan->id }}"
                        data-isi="{{ $pesan->isi_pesan }}"
                        data-nama="{{ $pesan->pengirim->name }}"
                        data-milik-sendiri="{{ $pesan->pengirim_id === auth()->id() ? '1' : '0' }}">

                        <button class="btn-reply shrink-0 text-gray-400 opacity-0 group-hover:opacity-100 hover:text-blue-600 text-base px-1">
                            ↩
                        </button>

                        <div class="pesan-bubble max-w-xs px-4 py-2 rounded-lg select-none {{ $pesan->pengirim_id === auth()->id() ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-800' }}"
                            style="-webkit-touch-callout: none; -webkit-user-select: none; touch-action: pan-y;">

                            @if ($pesan->balasKe)
                                <div class="mb-1 pl-2 border-l-2 {{ $pesan->pengirim_id === auth()->id() ? 'border-blue-300' : 'border-gray-400' }} text-xs opacity-80">
                                    <p class="font-semibold">{{ $pesan->balasKe->pengirim->name }}</p>
                                    <p class="truncate">{{ $pesan->balasKe->isi_pesan }}</p>
                                </div>
                            @endif

                            @if ($pesan->file_path)
                                @if ($pesan->isGambar())
                                    <a href="{{ asset('storage/' . $pesan->file_path) }}" target="_blank">
                                        <img src="{{ asset('storage/' . $pesan->file_path) }}" class="rounded-md max-w-full mb-1" alt="{{ $pesan->file_nama }}"
                                        onerror="window.retryGambar(this)">
                                    </a>
                                @else
                                    <a href="{{ asset('storage/' . $pesan->file_path) }}" target="_blank"
                                        class="flex items-center gap-2 mb-1 px-2 py-1.5 rounded {{ $pesan->pengirim_id === auth()->id() ? 'bg-blue-700' : 'bg-gray-200' }}">
                                        <span>📎</span>
                                        <span class="text-xs truncate">{{ $pesan->file_nama }}</span>
                                    </a>
                                @endif
                            @endif

                            @if ($pesan->isi_pesan)
                                <p class="text-sm pesan-isi">{{ $pesan->isi_pesan }}</p>
                            @endif
                            <p class="text-[10px] opacity-70 mt-1">{{ $pesan->created_at->format('H:i') }}</p>
                        </div>
                    </div>
                @endforeach
            </div>

            <div id="file-preview" class="hidden mt-3 bg-gray-50 border-l-4 border-green-500 px-3 py-2 rounded flex justify-between items-center">
                <p class="text-xs text-gray-600 truncate" id="file-preview-nama"></p>
                <button type="button" id="btn-batal-file" class="text-gray-400 hover:text-red-500 text-sm ml-2">✕</button>
            </div>

            <div id="reply-preview" class="hidden mt-3 bg-gray-50 border-l-4 border-blue-500 px-3 py-2 rounded flex justify-between items-start">
                <div>
                    <p class="text-xs font-semibold text-blue-600" id="reply-nama"></p>
                    <p class="text-xs text-gray-500 truncate" id="reply-isi"></p>
                </div>
                <button type="button" id="btn-batal-reply" class="text-gray-400 hover:text-red-500 text-sm ml-2">✕</button>
            </div>

            <form id="form-pesan" class="mt-2 flex gap-2 items-center">
                <label for="input-file" class="cursor-pointer text-xl px-2 text-gray-500 hover:text-blue-600" title="Kirim file/foto">
                    📎
                </label>
                <input type="file" id="input-file" class="hidden">
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
                        window.retryGambar = function (img) {
                const percobaan = parseInt(img.dataset.percobaan || '0', 10);
                if (percobaan >= 5) return;

                img.dataset.percobaan = percobaan + 1;
                setTimeout(() => {
                    const urlAsli = img.src.split('?')[0];
                    img.src = urlAsli + '?retry=' + Date.now();
                }, 1000);
            };
            const userId = {{ auth()->id() }};
            const namaSaya = '{{ auth()->user()->name }}';
            const chatBox = document.getElementById('chat-box');
            const form = document.getElementById('form-pesan');
            const input = document.getElementById('input-pesan');
            const inputFile = document.getElementById('input-file');
            const filePreview = document.getElementById('file-preview');
            const filePreviewNama = document.getElementById('file-preview-nama');
            const btnBatalFile = document.getElementById('btn-batal-file');
            const btnHapusSemua = document.getElementById('btn-hapus-semua');
            const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

            const replyPreview = document.getElementById('reply-preview');
            const replyNama = document.getElementById('reply-nama');
            const replyIsi = document.getElementById('reply-isi');
            const btnBatalReply = document.getElementById('btn-batal-reply');

            let replyTarget = null;

            function setReply(id, isi, nama) {
                replyTarget = { id, isi, nama };
                replyNama.textContent = 'Membalas ' + nama;
                replyIsi.textContent = isi || '[File]';
                replyPreview.classList.remove('hidden');
                input.focus();
            }

            function batalReply() {
                replyTarget = null;
                replyPreview.classList.add('hidden');
            }

            btnBatalReply.addEventListener('click', batalReply);

            inputFile.addEventListener('change', function () {
                if (inputFile.files.length > 0) {
                    filePreviewNama.textContent = '📎 ' + inputFile.files[0].name;
                    filePreview.classList.remove('hidden');
                } else {
                    filePreview.classList.add('hidden');
                }
            });

            btnBatalFile.addEventListener('click', function () {
                inputFile.value = '';
                filePreview.classList.add('hidden');
            });

            function isGambarFile(tipe, nama) {
                if (tipe && tipe.startsWith('image/')) return true;
                if (nama) {
                    const ext = nama.split('.').pop().toLowerCase();
                    return ['jpg', 'jpeg', 'png', 'gif', 'webp'].includes(ext);
                }
                return false;
            }

            function buatBubble(id, isiPesan, waktu, pengirimId, namaPengirim, balasKe, fileUrl, fileNama, fileTipe) {
                const milikSendiri = pengirimId === userId;

                const wrapper = document.createElement('div');
                wrapper.id = `pesan-${id}`;
                wrapper.className = 'w-full flex items-end gap-1 group ' +
                    (milikSendiri ? 'justify-end' : 'justify-start');
                wrapper.dataset.id = id;
                wrapper.dataset.isi = isiPesan || '';
                wrapper.dataset.nama = namaPengirim;
                wrapper.dataset.milikSendiri = milikSendiri ? '1' : '0';

                const btnReply = document.createElement('button');
                btnReply.className = 'btn-reply shrink-0 text-gray-400 opacity-0 group-hover:opacity-100 hover:text-blue-600 text-base px-1';
                btnReply.textContent = '↩';
                btnReply.addEventListener('click', () => setReply(id, isiPesan, namaPengirim));
                wrapper.appendChild(btnReply);

                const inner = document.createElement('div');
                inner.className = 'pesan-bubble max-w-xs px-4 py-2 rounded-lg select-none ' +
                    (milikSendiri ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-800');
                inner.style.webkitTouchCallout = 'none';
                inner.style.webkitUserSelect = 'none';
                inner.style.touchAction = 'pan-y';

                if (balasKe) {
                    const kutipan = document.createElement('div');
                    kutipan.className = 'mb-1 pl-2 border-l-2 ' +
                        (milikSendiri ? 'border-blue-300' : 'border-gray-400') + ' text-xs opacity-80';
                    const pNama = document.createElement('p');
                    pNama.className = 'font-semibold';
                    pNama.textContent = balasKe.pengirim_nama;
                    const pIsi = document.createElement('p');
                    pIsi.className = 'truncate';
                    pIsi.textContent = balasKe.isi_pesan || '[File]';
                    kutipan.appendChild(pNama);
                    kutipan.appendChild(pIsi);
                    inner.appendChild(kutipan);
                }

                if (fileUrl) {
                    if (isGambarFile(fileTipe, fileNama)) {
                        const a = document.createElement('a');
                        a.href = fileUrl;
                        a.target = '_blank';
                        const img = document.createElement('img');
                        img.src = fileUrl;
                        img.className = 'rounded-md max-w-full mb-1';
                        img.alt = fileNama || '';
                        img.onerror = function () { window.retryGambar(img); };
                        a.appendChild(img);
                        inner.appendChild(a);
                    } else {
                        const a = document.createElement('a');
                        a.href = fileUrl;
                        a.target = '_blank';
                        a.className = 'flex items-center gap-2 mb-1 px-2 py-1.5 rounded ' +
                            (milikSendiri ? 'bg-blue-700' : 'bg-gray-200');
                        const span1 = document.createElement('span');
                        span1.textContent = '📎';
                        const span2 = document.createElement('span');
                        span2.className = 'text-xs truncate';
                        span2.textContent = fileNama || 'File';
                        a.appendChild(span1);
                        a.appendChild(span2);
                        inner.appendChild(a);
                    }
                }

                if (isiPesan) {
                    const p1 = document.createElement('p');
                    p1.className = 'text-sm pesan-isi';
                    p1.textContent = isiPesan;
                    inner.appendChild(p1);
                }

                const p2 = document.createElement('p');
                p2.className = 'text-[10px] opacity-70 mt-1';
                p2.textContent = waktu;
                inner.appendChild(p2);

                wrapper.appendChild(inner);

                if (milikSendiri) {
                    pasangEventHapus(wrapper);
                } else {
                    pasangEventKlikKananReply(wrapper);
                }
                pasangEventSwipeReply(wrapper);

                chatBox.appendChild(wrapper);
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
                    prosesHapus();
                });

                el.addEventListener('touchstart', function () {
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
            }

            function pasangEventKlikKananReply(el) {
                el.addEventListener('contextmenu', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    setReply(el.dataset.id, el.dataset.isi, el.dataset.nama);
                });
            }

            function pasangEventSwipeReply(el) {
                const bubble = el.querySelector('.pesan-bubble');
                let startX = 0;
                let startY = 0;
                let geser = false;

                el.addEventListener('touchstart', function (e) {
                    startX = e.touches[0].clientX;
                    startY = e.touches[0].clientY;
                    geser = false;
                }, { passive: true });

                el.addEventListener('touchmove', function (e) {
                    const deltaX = e.touches[0].clientX - startX;
                    const deltaY = e.touches[0].clientY - startY;

                    if (Math.abs(deltaX) > Math.abs(deltaY) && deltaX > 10) {
                        geser = true;
                        const geseran = Math.min(deltaX, 60);
                        bubble.style.transform = `translateX(${geseran}px)`;
                    }
                }, { passive: true });

                el.addEventListener('touchend', function () {
                    bubble.style.transform = '';
                    if (geser) {
                        setReply(el.dataset.id, el.dataset.isi, el.dataset.nama);
                    }
                    geser = false;
                });
            }

            document.querySelectorAll('[data-id]').forEach(function (el) {
                if (el.dataset.milikSendiri === '1') {
                    pasangEventHapus(el);
                } else {
                    pasangEventKlikKananReply(el);
                }
                pasangEventSwipeReply(el);

                const btnReply = el.querySelector('.btn-reply');
                if (btnReply) {
                    btnReply.addEventListener('click', () => setReply(el.dataset.id, el.dataset.isi, el.dataset.nama));
                }
            });

            btnHapusSemua.addEventListener('click', async () => {
                if (!confirm('Hapus SEMUA chat di percakapan ini (hanya untuk kamu)? Tindakan ini tidak bisa dibatalkan.')) return;

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
                const file = inputFile.files[0] || null;

                if (!isiPesan && !file) return;

                const balasKeIdSaatIni = replyTarget ? replyTarget.id : null;
                const balasKeSaatIni = replyTarget ? { isi_pesan: replyTarget.isi, pengirim_nama: replyTarget.nama } : null;

                input.value = '';
                inputFile.value = '';
                filePreview.classList.add('hidden');
                batalReply();

                const formData = new FormData();
                if (isiPesan) formData.append('isi_pesan', isiPesan);
                if (balasKeIdSaatIni) formData.append('balas_ke_id', balasKeIdSaatIni);
                if (file) formData.append('file', file);

                const res = await fetch(`/konsultasi/${konsultasiId}/pesan`, {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': csrfToken,
                        'X-Socket-ID': window.Echo.socketId(),
                    },
                    body: formData,
                });

                const data = await res.json();
                if (data.success) {
                    buatBubble(data.id, isiPesan, 'Baru saja', userId, namaSaya, data.balas_ke || balasKeSaatIni, data.file_url, data.file_nama, data.file_tipe);
                }
            });

            window.Echo.private(`konsultasi.${konsultasiId}`)
                .listen('.PesanDikirim', (e) => {
                    if (e.pengirim_id === userId) return;
                    buatBubble(e.id, e.isi_pesan, e.waktu, e.pengirim_id, e.pengirim_nama, e.balas_ke, e.file_url, e.file_nama, e.file_tipe);
                });

            chatBox.scrollTop = chatBox.scrollHeight;
        });
    </script>
    @endpush
</x-app-layout>