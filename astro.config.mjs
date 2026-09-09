// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

/**
 * Endereço público do site. É usado no canonical, no sitemap, no robots.txt e
 * nas tags de compartilhamento (a prévia do WhatsApp busca a imagem por aqui).
 *
 * A ordem resolve sozinha quando o domínio próprio for conectado:
 *   1. SITE_URL — defina só se quiser forçar um endereço específico.
 *   2. VERCEL_PROJECT_PRODUCTION_URL — a Vercel injeta o domínio de produção
 *      no build; ao apontar ocucaresolve.com.br para o projeto, ele passa a
 *      valer aqui sem ninguém mexer em código.
 *   3. O endereço atual da Vercel, como último recurso.
 */
const site =
  process.env.SITE_URL ??
  (process.env.VERCEL_PROJECT_PRODUCTION_URL
    ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
    : 'https://o-cuca-resolve.vercel.app');

export default defineConfig({
  site,
  integrations: [sitemap()],
});
