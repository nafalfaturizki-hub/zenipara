# 🔐 Super Admin Testing Credentials

## ✅ Login yang Berhasil (Fixed)

Setelah deployment terbaru, gunakan credentials berikut untuk login:

### Super Admin Account
```
NRP: 000000000000
PIN: 000000
```

## 📋 Flow setelah Login

1. **Login dengan credentials di atas**
   - Akan masuk ke dashboard untuk super_admin

2. **Force Change PIN** (jika required)
   - Sistem akan meminta untuk change PIN
   - PIN baru harus 6 digit numeric
   - Gunakan PIN yang diingat untuk login berikutnya

3. **Dashboard Roles**
   - Super Admin: Akses penuh ke semua menu
   - Admin Satuan: Manajemen satuan
   - Komandan: Manajemen unit komando
   - Staff Satuan: Administrasi
   - Prajurit: Staff militer

## 🔧 Deployment Status

✅ **Fixes Applied:**
- Vercel routing configuration (vercel.json) untuk SPA fallback
- Super admin PIN di-set dan verified di database
- Login RPC function tested dan working

⏳ **Waiting for:**
- Vercel deployment auto-deploy dari GitHub (dapat 5-15 menit)
- Browser cache bersih mungkin diperlukan (Ctrl+Shift+Delete)

## 🌐 URL Production
```
https://zenipara.vercel.app
```

## ⚠️ Troubleshooting Login Issues

Jika masih ada error "NRP atau PIN salah":

1. **Clear browser cache**
   - Press: `Ctrl+Shift+Delete`
   - Clear cookies dan cached data
   - Refresh halaman

2. **Check browser console** (F12)
   - Lihat error messages di console
   - Screenshot error jika masih ada

3. **Verify Supabase connectivity**
   - Network tab (F12) → check API calls ke supabase
   - Status code harus 200 bukan 4xx/5xx

4. **Fallback test**
   - Coba test di localhost: `npm run dev`
   - Login dengan same credentials
   - Jika berhasil di localhost tapi tidak di Vercel, mungkin env vars issue

## 📊 Database Status

```
Total Users: 434
  - prajurit: 429
  - admin_satuan: 3
  - komandan: 1
  - super_admin: 1

All migrations: ✅ Applied (85+ migrations)
Role constraint: ✅ Updated untuk 8 roles
Supabase region: Northeast Asia Tokyo
Project: upvrcaivdzuxozdwzvdq
```
