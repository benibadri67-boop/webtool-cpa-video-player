-- ==============================================================
-- 🎬 Supabase SQL Schema: Cloud CPA & Traffic Hub Video Tools
-- Jalankan skrip ini di Supabase SQL Editor (Dashboard > SQL Editor > New query)
-- ==============================================================

-- 1. Buat Tabel cpa_videos
CREATE TABLE IF NOT EXISTS public.cpa_videos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    cdn_url TEXT NOT NULL,
    thumbnail_url TEXT,
    smartlink_cpa_url TEXT NOT NULL,
    category TEXT DEFAULT 'Viral',
    views_count INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Aktifkan Row Level Security (RLS) demi keamanan
ALTER TABLE public.cpa_videos ENABLE ROW LEVEL SECURITY;

-- 3. Kebijakan Keamanan: Publik (Anonim) Boleh Membaca Video yang Aktif
DROP POLICY IF EXISTS "Public can view active cpa_videos" ON public.cpa_videos;
CREATE POLICY "Public can view active cpa_videos"
ON public.cpa_videos
FOR SELECT
TO anon, authenticated
USING (is_active = TRUE);

-- 4. Fungsi Aman Pencatat Views (RPC Function)
-- Memungkinkan pengunjung anonim menambah views tanpa membuka akses edit ke tabel
CREATE OR REPLACE FUNCTION public.increment_cpa_views(target_id UUID)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    UPDATE public.cpa_videos
    SET views_count = views_count + 1
    WHERE id = target_id;
END;
$$;

-- Beri izin eksekusi ke anon & authenticated
GRANT EXECUTE ON FUNCTION public.increment_cpa_views(UUID) TO anon, authenticated;

-- ==============================================================
-- 🎁 DATA CONTOH (Demo Seed)
-- Silakan ganti smartlink_cpa_url dengan link iklan CPA / Adsterra Anda
-- ==============================================================
INSERT INTO public.cpa_videos (title, cdn_url, thumbnail_url, smartlink_cpa_url, category, views_count, is_active)
VALUES 
(
    'Momen Tak Terduga Yang Bikin Semua Orang Kaget! 😱',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://images.unsplash.com/photo-1536240478700-b869070f9279?auto=format&fit=crop&w=800&q=80',
    'https://buatquotes.blogspot.com/', -- Ganti dengan link penawaran CPA Anda
    'Viral',
    1240,
    TRUE
),
(
    'Detik-Detik Penyelamatan Dramatis Yang Menegangkan! 🔥',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'https://images.unsplash.com/photo-1518173946687-a4c8a383392e?auto=format&fit=crop&w=800&q=80',
    'https://buatquotes.blogspot.com/', -- Ganti dengan link penawaran CPA Anda
    'Trending',
    3580,
    TRUE
)
ON CONFLICT DO NOTHING;
