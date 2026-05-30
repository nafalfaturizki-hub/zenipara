#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

readonly lookup_patterns=(
  "@/features/auth/icons"
  "@/features/admin/icons"
  "@/features/komandan/icons"
  "@/features/prajurit/icons"
  "@/features/staff/icons"
  "@/features/super-admin/icons"
  "@/features/shared/icons"
  "@/features/types"
  "@/features/auth/types"
  "@/features/admin/types"
  "@/features/komandan/types"
  "@/features/prajurit/types"
  "@/features/staff/types"
  "@/features/super-admin/types"
  "@/features/shared/types"
  "@/features/auth/utils"
  "@/features/admin/utils"
  "@/features/komandan/utils"
  "@/features/prajurit/utils"
  "@/features/staff/utils"
  "@/features/super-admin/utils"
  "@/features/shared/utils"
  "@/features/auth/store"
  "@/features/admin/store"
  "@/features/komandan/store"
  "@/features/prajurit/store"
  "@/features/staff/store"
  "@/features/super-admin/store"
  "@/features/shared/store"
)

for pattern in "${lookup_patterns[@]}"; do
  if grep -R -n --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=public --exclude-dir=dist --exclude-dir=build "$pattern" src | head -n 1 >/dev/null 2>&1; then
    echo "ERROR: Found a live reference to wrapper path '$pattern'. Aborting." >&2
    grep -R -n --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=public --exclude-dir=dist --exclude-dir=build "$pattern" src
    exit 1
  fi
 done

readonly files=(
  src/features/icons.ts
  src/features/auth/icons.ts
  src/features/admin/icons.ts
  src/features/komandan/icons.ts
  src/features/prajurit/icons.ts
  src/features/staff/icons.ts
  src/features/super-admin/icons.ts
  src/features/shared/icons.ts
  src/features/types/index.ts
  src/features/auth/types/index.ts
  src/features/admin/types/index.ts
  src/features/komandan/types/index.ts
  src/features/prajurit/types/index.ts
  src/features/staff/types/index.ts
  src/features/super-admin/types/index.ts
  src/features/shared/types/index.ts
  src/features/utils/timeFormatter.ts
  src/features/utils/gatepass.ts
  src/features/auth/utils/timeFormatter.ts
  src/features/auth/utils/gatepass.ts
  src/features/admin/utils/timeFormatter.ts
  src/features/admin/utils/gatepass.ts
  src/features/komandan/utils/timeFormatter.ts
  src/features/komandan/utils/gatepass.ts
  src/features/prajurit/utils/timeFormatter.ts
  src/features/prajurit/utils/gatepass.ts
  src/features/staff/utils/timeFormatter.ts
  src/features/staff/utils/gatepass.ts
  src/features/super-admin/utils/timeFormatter.ts
  src/features/super-admin/utils/gatepass.ts
  src/features/shared/utils/timeFormatter.ts
  src/features/shared/utils/gatepass.ts
  src/features/store/uiStore.ts
  src/features/store/featureStore.ts
  src/features/store/posJagaStore.ts
  src/features/store/authStore.ts
  src/features/store/adminDashboardStore.ts
  src/features/store/gatePassStore.ts
  src/features/store/platformStore.ts
  src/features/store/komandanDashboardStore.ts
  src/features/auth/store/uiStore.ts
  src/features/auth/store/featureStore.ts
  src/features/auth/store/posJagaStore.ts
  src/features/auth/store/authStore.ts
  src/features/auth/store/adminDashboardStore.ts
  src/features/auth/store/gatePassStore.ts
  src/features/auth/store/platformStore.ts
  src/features/auth/store/komandanDashboardStore.ts
  src/features/admin/store/uiStore.ts
  src/features/admin/store/featureStore.ts
  src/features/admin/store/posJagaStore.ts
  src/features/admin/store/authStore.ts
  src/features/admin/store/adminDashboardStore.ts
  src/features/admin/store/gatePassStore.ts
  src/features/admin/store/platformStore.ts
  src/features/admin/store/komandanDashboardStore.ts
  src/features/komandan/store/uiStore.ts
  src/features/komandan/store/featureStore.ts
  src/features/komandan/store/posJagaStore.ts
  src/features/komandan/store/authStore.ts
  src/features/komandan/store/adminDashboardStore.ts
  src/features/komandan/store/gatePassStore.ts
  src/features/komandan/store/platformStore.ts
  src/features/komandan/store/komandanDashboardStore.ts
  src/features/prajurit/store/uiStore.ts
  src/features/prajurit/store/featureStore.ts
  src/features/prajurit/store/posJagaStore.ts
  src/features/prajurit/store/authStore.ts
  src/features/prajurit/store/adminDashboardStore.ts
  src/features/prajurit/store/gatePassStore.ts
  src/features/prajurit/store/platformStore.ts
  src/features/prajurit/store/komandanDashboardStore.ts
  src/features/shared/store/uiStore.ts
  src/features/shared/store/featureStore.ts
  src/features/shared/store/posJagaStore.ts
  src/features/shared/store/authStore.ts
  src/features/shared/store/adminDashboardStore.ts
  src/features/shared/store/gatePassStore.ts
  src/features/shared/store/platformStore.ts
  src/features/shared/store/komandanDashboardStore.ts
  src/features/staff/store/uiStore.ts
  src/features/staff/store/featureStore.ts
  src/features/staff/store/posJagaStore.ts
  src/features/staff/store/authStore.ts
  src/features/staff/store/adminDashboardStore.ts
  src/features/staff/store/gatePassStore.ts
  src/features/staff/store/platformStore.ts
  src/features/staff/store/komandanDashboardStore.ts
  src/features/super-admin/store/uiStore.ts
  src/features/super-admin/store/featureStore.ts
  src/features/super-admin/store/posJagaStore.ts
  src/features/super-admin/store/authStore.ts
  src/features/super-admin/store/adminDashboardStore.ts
  src/features/super-admin/store/gatePassStore.ts
  src/features/super-admin/store/platformStore.ts
  src/features/super-admin/store/komandanDashboardStore.ts
)

for file in "${files[@]}"; do
  if [[ -f "$file" ]]; then
    echo "Removing $file"
    rm "$file"
  fi
 done

echo "Deleted wrapper files. Please run 'npm run build' and/or 'npm test' to verify."