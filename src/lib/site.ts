import site from '../content/site.json';

export { site };

/** Monta o link wa.me com a mensagem já preenchida. */
export function whatsappUrl(mensagem: string = site.whatsapp_mensagem): string {
  const numero = site.whatsapp.replace(/\D/g, '');
  return `https://wa.me/${numero}?text=${encodeURIComponent(mensagem)}`;
}

/** Link tel: a partir do mesmo número. */
export function telUrl(): string {
  return `tel:+${site.whatsapp.replace(/\D/g, '')}`;
}
