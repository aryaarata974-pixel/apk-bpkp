<?php

namespace App\Events;

use App\Models\Pesan;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class PesanDikirim implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public Pesan $pesan;

    public function __construct(Pesan $pesan)
    {
        $this->pesan = $pesan->load('pengirim');
    }

    public function broadcastOn(): array
    {
        return [
            new PrivateChannel('konsultasi.' . $this->pesan->konsultasi_id),
        ];
    }

    public function broadcastAs(): string
    {
        return 'PesanDikirim';
    }

    public function broadcastWith(): array
    {
        return [
            'id' => $this->pesan->id,
            'isi_pesan' => $this->pesan->isi_pesan,
            'pengirim_id' => $this->pesan->pengirim_id,
            'pengirim_nama' => $this->pesan->pengirim->name,
            'waktu' => $this->pesan->created_at->format('H:i'),
        ];
    }
}