# SOCORRO! O CUCA RESOLVE — site

Site institucional e página de links do **SOCORRO! O CUCA RESOLVE** — manutenção
residencial e assistência técnica em Socorro-SP e região.

Feito em [Astro](https://astro.build) (HTML estático, sem servidor) com
[Sveltia CMS](https://sveltiacms.app) para o próprio Cuca editar os textos pelo navegador.

## Páginas

| Rota     | O que é                                                                          |
| -------- | -------------------------------------------------------------------------------- |
| `/`      | Landing page: serviços, como funciona, quem atendemos e CTA para o WhatsApp       |
| `/links` | Linktree: WhatsApp, Instagram, Mercado Livre, Shopee e e-mail                     |
| `/admin` | Painel de edição (Sveltia CMS)                                                    |

## Rodar na sua máquina

```bash
npm install
npm run dev      # http://localhost:4321
npm run build    # gera o site em dist/
npm run preview  # serve o dist/ para conferir
```

## Onde ficam os textos

Todo o conteúdo editável está em `src/content/`, em JSON. Pode mexer direto no arquivo
ou pelo painel — dá no mesmo, o painel só escreve nesses arquivos.

| Arquivo                     | Conteúdo                                                     |
| --------------------------- | ------------------------------------------------------------ |
| `src/content/site.json`     | Nome, WhatsApp, e-mail, região. Usado no site inteiro.       |
| `src/content/home.json`     | Todos os textos da landing page.                             |
| `src/content/services.json` | As cinco frentes de serviço.                                 |
| `src/content/links.json`    | Os botões da página `/links`.                                |

Detalhes que valem saber:

- **O número do WhatsApp fica em um lugar só.** `site.json` → `whatsapp`, em formato
  internacional e sem símbolos (`5519997916128`). Todos os botões do site, o link do
  linktree e o `tel:` são montados a partir dele por `src/lib/site.ts`.
- **O botão de WhatsApp do linktree não tem URL.** O campo `url` dele fica vazio de
  propósito — a página monta o `wa.me` com a mensagem já escrita.
- **Os ícones são uma lista fechada.** Estão definidos em `src/components/Icon.astro`.
  Usar um nome que não existe lá cai no ícone de check. Para adicionar outro, inclua o
  path do SVG no componente e a opção correspondente no `config.yml`.

## Falta preencher

Estão como placeholder em `src/content/links.json` — trocar antes de divulgar:

- [ ] `https://instagram.com/TROCAR_PELO_USUARIO`
- [ ] `https://www.mercadolivre.com.br/TROCAR_PELO_LINK_DA_LOJA`
- [ ] `https://shopee.com.br/TROCAR_PELO_LINK_DA_LOJA`
- [ ] Domínio real em `astro.config.mjs`, `public/robots.txt` e `public/admin/config.yml`
      (hoje: `https://ocucaresolve.com.br`)

## Publicar

O build é estático, então qualquer host serve. Todos detectam Astro sozinhos —
basta conectar o repositório do GitHub:

- **Netlify / Vercel / Cloudflare Pages**: build `npm run build`, pasta de saída `dist`.
- **GitHub Pages**: precisa de um workflow; veja
  [docs.astro.build/pt-br/guides/deploy/github](https://docs.astro.build/pt-br/guides/deploy/github/).

Depois de publicar, atualize o campo `site` em `astro.config.mjs` com o domínio final e
faça um novo deploy — o canonical, o sitemap e as prévias de compartilhamento dependem dele.

## Configurar o painel de edição

O Sveltia CMS grava as alterações como commits no GitHub, e cada commit dispara um novo
deploy. Não existe banco de dados nem senha de painel: quem edita entra com a própria
conta do GitHub.

1. Suba este projeto para um repositório no GitHub.
2. Em `public/admin/config.yml`, troque `repo: SEU_USUARIO/o-cuca-resolve` pelo caminho
   real (`usuario/repositorio`) e confirme se a `branch` é a mesma que você usa.
3. Dê acesso de escrita ao repositório para a conta do GitHub de quem vai editar.
4. Acesse `https://SEU-DOMINIO/admin`.

Para o login, há dois caminhos:

**Token pessoal (mais simples, não precisa de nada extra).** No GitHub, em
Settings → Developer settings → Personal access tokens, gere um token com acesso de
leitura e escrita ao conteúdo deste repositório e cole na tela de login do painel.

**Botão "Entrar com GitHub" (mais confortável no dia a dia).** Exige um cliente OAuth
publicado — o [Sveltia CMS Authenticator](https://github.com/sveltia/sveltia-cms-auth)
roda de graça no Cloudflare Workers. Depois de publicá-lo, descomente a linha `base_url`
no `config.yml` apontando para a URL dele.

### Editar sem estar publicado

Com o projeto clonado e o `npm run dev` rodando, abra `http://localhost:4321/admin`
e escolha trabalhar com o repositório local. O painel edita os arquivos direto no disco
e você faz os commits na mão. Isso exige a pasta `.git` presente no projeto.

## Estrutura

```
src/
├── content/          # textos editáveis (JSON) — o que o painel altera
├── lib/site.ts       # monta o link do wa.me e o tel: a partir do número
├── components/       # Header, Footer e Icon (todos os SVGs em um só lugar)
├── layouts/Base.astro# <head>, SEO, Open Graph e JSON-LD de negócio local
├── pages/            # index.astro (LP) e links.astro (linktree)
└── styles/global.css # tokens de cor, tipografia e todos os componentes visuais
public/
├── admin/            # painel do Sveltia CMS (index.html + config.yml)
├── media/            # imagens enviadas pelo painel
├── logo.jpeg
├── favicon.svg
└── robots.txt
```
