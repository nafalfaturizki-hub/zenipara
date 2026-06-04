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

-- 2. Migrasi role 'staf' ke 'staff_satuan'
UPDATE public.users
SET role = 'staff_satuan'
WHERE role::text = 'staf'
  AND role::text NOT IN ('admin_satuan', 'super_admin', 'komandan', 'prajurit');

-- 3. Migrasi role 'admin' lama ke 'admin_satuan'
-- Pengecekan untuk memastikan hanya update role 'admin'
UPDATE public.users
SET role = 'admin_satuan'
WHERE role::text = 'admin'
  AND role::text NOT IN ('super_admin', 'admin_satuan', 'komandan', 'staff_satuan', 'prajurit');

COMMIT;