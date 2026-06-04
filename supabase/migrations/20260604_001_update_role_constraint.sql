BEGIN;

-- Drop existing check constraint
ALTER TABLE public.users
DROP CONSTRAINT IF EXISTS users_role_check;

-- Add updated check constraint dengan role-role baru
ALTER TABLE public.users
ADD CONSTRAINT users_role_check CHECK (
  role = ANY (ARRAY[
    'admin'::text,
    'admin_satuan'::text,
    'komandan'::text,
    'prajurit'::text,
    'guard'::text,
    'staf'::text,
    'staff_satuan'::text,
    'super_admin'::text
  ])
);

-- Now migrate role 'admin' to 'admin_satuan'
UPDATE public.users
SET role = 'admin_satuan'
WHERE role = 'admin';

-- Migrate role 'staf' to 'staff_satuan'
UPDATE public.users
SET role = 'staff_satuan'
WHERE role = 'staf'
  AND role NOT IN ('admin_satuan', 'super_admin', 'komandan', 'prajurit');

COMMIT;
