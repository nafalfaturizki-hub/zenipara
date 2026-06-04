BEGIN;

-- 1. Tambah enum value baru jika belum ada (Hanya saat kolom role adalah ENUM)
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM pg_type t
    WHERE t.typname = 'user_role'
      AND t.typtype = 'e'
  ) AND NOT EXISTS (
    SELECT 1 FROM pg_enum e
    JOIN pg_type t ON e.enumtypid = t.oid
    WHERE t.typname = 'user_role'
      AND e.enumlabel = 'staff_satuan'
  ) THEN
    ALTER TYPE public.user_role ADD VALUE 'staff_satuan';
  END IF;
END $$;

-- 2. Migrasi role 'staf' ke 'staff_satuan' (hanya jika role column bukan enum atau sudah ada 'staff_satuan')
DO $$
BEGIN
  UPDATE public.users
  SET role = 'staff_satuan'
  WHERE role::text = 'staf'
    AND role::text NOT IN ('admin_satuan', 'super_admin', 'komandan', 'prajurit');
EXCEPTION WHEN OTHERS THEN
  -- Abaikan error jika ada issue dengan update
  NULL;
END $$;

-- 3. Cleanup: Update semua users dengan rank 'admin' dan role yang tidak valid ke 'admin_satuan'
DO $$
BEGIN
  UPDATE public.users
  SET role = 'admin_satuan'
  WHERE rank = 'admin'
    AND role::text NOT IN ('super_admin', 'admin_satuan', 'komandan', 'staff_satuan', 'prajurit', 'staf');
EXCEPTION WHEN OTHERS THEN
  -- Abaikan error jika ada issue dengan constraint
  NULL;
END $$;

COMMIT;