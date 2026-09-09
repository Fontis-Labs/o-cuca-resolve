import type { APIRoute } from 'astro';

/** Gerado a partir de `site` no astro.config.mjs, para o sitemap nunca divergir. */
export const GET: APIRoute = ({ site }) => {
  const sitemap = new URL('sitemap-index.xml', site).href;

  return new Response(
    ['User-agent: *', 'Allow: /', 'Disallow: /admin/', '', `Sitemap: ${sitemap}`, ''].join('\n'),
    { headers: { 'Content-Type': 'text/plain; charset=utf-8' } },
  );
};
