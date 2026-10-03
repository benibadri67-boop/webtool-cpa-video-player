# 🎨 Desain & UI/UX: Cloud CPA & Traffic Hub Video Player

## 🎭 Estetika & Konsep Visual
- **Tema:** *Cinematic Dark Mode* (Slate-950, Zinc-900, Aksen Biru Neon & Amber).
- **Tipografi:** System Sans-Serif modern (Inter / SF Pro Display) dengan kontras tinggi.
- **Rasio Aspek:** Mobile-First 9:16 (Vertikal gaya TikTok/Reels) dengan wadah responsif yang tetap rapi di layar desktop (maksimum lebar 460px untuk mode vertikal, atau 800px untuk mode lanskap).

---

## 📱 Komponen Antarmuka Utama

### 1. Header Ringkas
- Logo Hub Video ("▶ HubStream / VideoTube").
- Badge status penayangan & jumlah penonton aktif secara live.

### 2. Wadah Pemutar Video (The Canvas)
- **Thumbnail Teaser:** Menampilkan gambar thumbnail berkualitas tinggi sebelum diputar dengan tombol Play berdenyut (*pulse effect*).
- **Video Element:** HTML5 Video tag dengan atribut `playsinline`, `preload="metadata"`.
- **First-Click Trigger:** Menghilangkan thumbnail, membuka tab baru ke smartlink CPA, lalu langsung memutar video secara instan.

### 3. Overlay Content Gate (Layar Kunci Detik ke-8)
- Muncul di atas video secara *backdrop-blur* saat `currentTime >= 8`.
- Ikon gembok bercahaya kuning/merah (*amber glow*).
- Judul: *"⚠️ Verifikasi Konten Diperlukan"*.
- Pesan: *"Selesaikan langkah singkat untuk membuka kelanjutan video lengkap tanpa batas durasi."*
- Tombol CTA: *"🚀 LANJUTKAN MENONTON SEKARANG &raquo;"* (berkedip lembut mengundang klik).

### 4. Info Video & Interaksi
- Judul video tebal.
- Kategori tag (misal: `#Viral`, `#Trending`, `#Hiburan`).
- Statistik: Jumlah views riil dari Supabase.
- Tombol aksi: Like, Bagikan ke WhatsApp, Laporkan.
