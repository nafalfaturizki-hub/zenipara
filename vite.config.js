import { defineConfig } from 'vitest/config';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import { resolve } from 'node:path';

const basePath = process.env.VITE_BASE_PATH || '/';

export default defineConfig({
  base: basePath,
  plugins: [
    react(),
    tailwindcss(),
  ],
  resolve: {
    alias: [
      { find: '@/features/store/authStore', replacement: resolve(__dirname, './src/features/auth/authStore.ts') },
      { find: '@/features/store/adminDashboardStore', replacement: resolve(__dirname, './src/features/admin/adminStore.ts') },
      { find: '@/features/store/komandanDashboardStore', replacement: resolve(__dirname, './src/features/komandan/komandanStore.ts') },
      { find: '@/features/store/featureStore', replacement: resolve(__dirname, './src/store/featureStore.ts') },
      { find: '@/features/store/gatePassStore', replacement: resolve(__dirname, './src/store/gatePassStore.ts') },
      { find: '@/features/store/platformStore', replacement: resolve(__dirname, './src/store/platformStore.ts') },
      { find: '@/features/store/posJagaStore', replacement: resolve(__dirname, './src/store/posJagaStore.ts') },
      { find: '@/features/store/uiStore', replacement: resolve(__dirname, './src/store/uiStore.ts') },
      { find: '@/features/staff/types', replacement: resolve(__dirname, './src/types/index.ts') },
      { find: '@', replacement: resolve(__dirname, './src') },
    ],
  },
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: ['./src/tests/setup.ts'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'text-summary', 'html', 'lcov'],
      include: ['src/**/*.{ts,tsx}'],
      exclude: ['src/tests/**', 'src/main.tsx'],
    },
  },
  build: {
    outDir: 'dist',
    target: 'es2020',
    sourcemap: false,
    reportCompressedSize: false,
    chunkSizeWarningLimit: 600,
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom', 'react-router-dom'],
          supabase: ['@supabase/supabase-js'],
          state: ['zustand'],
          icons: ['lucide-react'],
          qr: ['html5-qrcode', 'react-qr-code'],
        },
      },
    },
  },
  server: {
    port: 5173,
    host: true,
  },
});
