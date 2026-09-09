// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  // Troque para o domínio final quando publicar.
  // É usado no sitemap, no canonical e nas tags de compartilhamento (OG).
  site: 'https://ocucaresolve.com.br',
  integrations: [sitemap()],
});
