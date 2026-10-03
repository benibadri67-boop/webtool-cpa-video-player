# 🗺️ Roadmap Fitur: Cloud CPA & Traffic Hub Video Player

## 🚀 Fase 1: MVP (Rilis Utama - Selesai Hari Ini)
- [x] **Skema Database Supabase (`cpa_videos`):**
  - Tabel PostgreSQL lengkap dengan kolom id, title, cdn_url, thumbnail_url, smartlink_cpa_url, category, views_count, is_active.
  - Kebijakan keamanan Row Level Security (RLS) untuk akses publik baca (*read-only*).
  - Fungsi Stored Procedure (RPC) `increment_cpa_views` untuk pencatatan jumlah tontonan anonim tanpa membuka akses tulis langsung.
- [x] **Player Web Interaktif (Cloudflare Pages):**
  - Membaca parameter query URL (`?id=...` atau `?v=...`).
  - Pemutar video responsif mobile (rasio vertikal 9:16 dan lanskap 16:9).
  - Logika **First-Click Smartlink**: Klik pertama membuka iklan CPA di tab baru (popunder), video tab utama langsung diputar (*autoplay*).
  - Logika **Timer Content Gate**: Pada detik ke-8, video otomatis di-pause dan menampilkan layar kunci beranimasi dengan tombol *"Lanjutkan Menonton"* yang mengarahkan ke smartlink penawaran.
  - Mode Katalog Cadangan: Jika dibuka tanpa ID, menampilkan daftar video aktif yang siap ditonton.
- [x] **Script Otomasi Google Apps Script (GAS):**
  - Script sinkronisasi untuk mem-posting teaser video ke Google Blogger secara otomatis.

---

## ⚡ Fase 2: Peningkatan Monetisasi & Pengalaman Pengguna
- [ ] **Dual Monetization Banner:** Banner iklan native di bawah tombol video (Adsterra 300x250).
- [ ] **Rekomendasi Video Terkait:** Grid 4 video acak dari kategori yang sama di bawah player untuk memperpanjang waktu kunjungan (*dwell time*).
- [ ] **Tombol Bagikan Viral:** Tombol 1-klik bagikan ke WhatsApp dan Telegram dengan teks pancingan otomatis.
- [ ] **Anti-AdBlock Warning Lembut:** Notifikasi ramah jika pengguna memakai pemblokir iklan agresif.

---

## 🌐 Fase 3: Otomasi Skala Besar
- [ ] **Webhook Telegram Bot:** Kirim link video dari bot Telegram langsung terbit ke Supabase + Blogger.
- [ ] **Auto-Shortener Link:** Integrasi pemendek link otomatis (Bitly/TinyURL) via Edge Functions.
