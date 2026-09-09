---
name: Socorro! O Cuca Resolve
description: A real technical drawing sheet — two inks and the paper, where line weight carries the rule.
colors:
  navy: "#0b1f3d"
  navy-raised: "#13294d"
  navy-hover: "#1b3865"
  orange: "#f5811f"
  orange-hover: "#ff9436"
  orange-ink: "#a8500a"
  paper: "#f4f1ea"
  chalk: "#eef3fa"
  chalk-dim: "#93a9c6"
  graphite: "#14203a"
  graphite-dim: "#55657f"
  burnt-dim: "#4a2a06"
  whatsapp-green: "#25d366"
  whatsapp-green-hover: "#34e277"
  whatsapp-ink: "#04301a"
  line-navy: "rgba(147, 169, 198, 0.34)"
  line-navy-strong: "rgba(147, 169, 198, 0.62)"
  line-paper: "rgba(20, 32, 58, 0.26)"
  line-paper-strong: "rgba(20, 32, 58, 0.52)"
  grid-fine-navy: "rgba(147, 169, 198, 0.07)"
  grid-major-navy: "rgba(147, 169, 198, 0.15)"
  grid-fine-paper: "rgba(20, 32, 58, 0.05)"
  grid-major-paper: "rgba(20, 32, 58, 0.1)"
typography:
  display:
    fontFamily: "Archivo, ui-sans-serif, system-ui, 'Segoe UI', sans-serif"
    fontSize: "clamp(2.35rem, 5.4vw, 4.4rem)"
    fontWeight: 800
    lineHeight: 0.94
    letterSpacing: "-0.032em"
  headline:
    fontFamily: "Archivo, ui-sans-serif, system-ui, 'Segoe UI', sans-serif"
    fontSize: "clamp(1.9rem, 5.2vw, 3.5rem)"
    fontWeight: 800
    lineHeight: 0.94
    letterSpacing: "-0.032em"
  title:
    fontFamily: "Archivo, ui-sans-serif, system-ui, 'Segoe UI', sans-serif"
    fontSize: "1.25rem"
    fontWeight: 800
    lineHeight: 1.25
    letterSpacing: "-0.02em"
  subtitle:
    fontFamily: "Archivo, ui-sans-serif, system-ui, 'Segoe UI', sans-serif"
    fontSize: "1.0625rem"
    fontWeight: 700
    lineHeight: 1.25
    letterSpacing: "-0.012em"
  lead:
    fontFamily: "Archivo, ui-sans-serif, system-ui, 'Segoe UI', sans-serif"
    fontSize: "clamp(1.05rem, 0.98rem + 0.42vw, 1.3rem)"
    fontWeight: 400
    lineHeight: 1.5
    letterSpacing: "normal"
  body:
    fontFamily: "Archivo, ui-sans-serif, system-ui, 'Segoe UI', sans-serif"
    fontSize: "clamp(1rem, 0.96rem + 0.2vw, 1.0625rem)"
    fontWeight: 400
    lineHeight: 1.6
    letterSpacing: "normal"
    fontFeature: "tabular-nums"
  note:
    fontFamily: "'Chivo Mono', ui-monospace, 'SF Mono', Menlo, monospace"
    fontSize: "0.6875rem"
    fontWeight: 500
    lineHeight: 1.6
    letterSpacing: "0.1em"
    fontFeature: "tabular-nums"
  note-micro:
    fontFamily: "'Chivo Mono', ui-monospace, 'SF Mono', Menlo, monospace"
    fontSize: "0.625rem"
    fontWeight: 600
    lineHeight: 1.6
    letterSpacing: "0.12em"
rounded:
  square: "0px"
  node: "50%"
spacing:
  s-1: "0.375rem"
  s-2: "0.75rem"
  s-3: "1.25rem"
  s-4: "2rem"
  s-5: "3.25rem"
  s-6: "clamp(3.5rem, 9vw, 7rem)"
  margin: "clamp(1.15rem, 4vw, 3rem)"
  gutter: "clamp(1.5rem, 5vw, 4.5rem)"
components:
  act:
    backgroundColor: "{colors.orange}"
    textColor: "{colors.navy}"
    rounded: "{rounded.square}"
    padding: "0.85rem 1.6rem"
    height: "52px"
  act-hover:
    backgroundColor: "{colors.orange-hover}"
    textColor: "{colors.navy}"
  act-invert:
    backgroundColor: "{colors.navy}"
    textColor: "{colors.paper}"
    rounded: "{rounded.square}"
    padding: "0.85rem 1.6rem"
    height: "52px"
  act-invert-hover:
    backgroundColor: "{colors.navy-hover}"
    textColor: "{colors.paper}"
  act-titleblock:
    backgroundColor: "{colors.orange}"
    textColor: "{colors.navy}"
    padding: "0.55rem 1rem"
    height: "44px"
  nav-link:
    backgroundColor: "transparent"
    textColor: "{colors.chalk-dim}"
    typography: "{typography.note}"
    padding: "0 0.7rem"
    height: "44px"
  nav-link-hover:
    textColor: "{colors.orange}"
  tie:
    backgroundColor: "transparent"
    textColor: "inherit"
    padding: "0.28rem 0"
  tie-hover:
    textColor: "{colors.orange}"
  dock:
    backgroundColor: "{colors.whatsapp-green}"
    textColor: "{colors.whatsapp-ink}"
    rounded: "{rounded.square}"
    padding: "0.8rem 1.25rem"
    height: "52px"
  dock-hover:
    backgroundColor: "{colors.whatsapp-green-hover}"
    textColor: "{colors.whatsapp-ink}"
  terminal:
    backgroundColor: "transparent"
    textColor: "{colors.chalk}"
    rounded: "{rounded.square}"
    padding: "1.25rem"
  terminal-hover:
    backgroundColor: "{colors.navy-raised}"
    textColor: "{colors.chalk}"
  terminal-live:
    backgroundColor: "{colors.whatsapp-green}"
    textColor: "{colors.whatsapp-ink}"
    rounded: "{rounded.square}"
    padding: "1.25rem"
  stamp:
    backgroundColor: "transparent"
    textColor: "{colors.chalk}"
    rounded: "{rounded.square}"
    padding: "0.75rem 1.25rem"
  skip-link:
    backgroundColor: "{colors.orange}"
    textColor: "{colors.navy}"
    rounded: "{rounded.square}"
    padding: "0.7rem 1.1rem"
---

# Design System: Socorro! O Cuca Resolve

## Overview

**Creative North Star: "A Prancha" (The Drafting Sheet)**

The product has no photography, no reviews, no numbers and no prices, and nothing may be
invented. So the interface does not claim to be trustworthy — it behaves like a technical
document, and trust is what a document earns by being legible. Every surface is a sheet from
a drawing folder: navy plan sheets alternating with light detail sheets, numbered in the
margin (Folha 02 through Folha 05), ruled with 40px margin ticks, cornered with registration
crosses, and drawn on a two-level drafting grid (24px fine, 120px major). The apparatus is
not decoration; it is what makes the page read as a record rather than an advertisement.

The system runs on two inks and the paper. Navy (`#0b1f3d`) holds the surface; orange
(`#f5811f`) is the live ink and marks only what is active or available. There is exactly one
region in the whole page where orange floods (the closing action sheet), and its rarity is
the argument. The single third color, WhatsApp green, is platform ink for one action and
belongs to the platform, not to the brand.

The central rule is that line weight carries meaning. A solid 2px rule tops a service the
business performs directly; a dashed rule tops a family with restricted scope; a dotted rule
and a 45° poché hatch band mark what is out of scope. A legend at the head of the services
sheet declares all three, so the notation closes: nothing is drawn that the reader has not
been taught to read. Corners are square, elevation is declared by border and tone only —
there is not one `box-shadow` in the stylesheet — and the only authored motion in the page
is the orange circuit line drawing itself once on scroll.

**Key Characteristics:**
- Two inks and the paper: navy ground, orange live ink, light paper for detail sheets.
- Line weight is semantic: solid = direct service, dashed = restricted scope, dotted/poché = out of scope.
- Zero shadows, zero rounded corners (one exception: the 13px circular circuit node).
- Drafting apparatus as structure: sheet numbers, margin rules, registration marks, title block, stamp.
- Archivo 800 at billboard scale for display; Chivo Mono for annotation and measurement only.
- Hand-authored icon geometry on a 24 grid with square caps and miter joins — no library glyphs.
- One authored motion moment in the entire page; the default, no-JS state is already drawn.

## Colors

Two inks and the paper, plus one borrowed platform green — the palette is a materials list,
not a spectrum.

### Primary
- **Drafting Navy** (`{colors.navy}`): The ground of the whole system. Plan sheets, the sticky title block, the colophon, and the `<body>` default. It is the paper of the drawing, not a "dark mode".
- **Live Orange** (`{colors.orange}`): The live ink. It marks what is active or available and nothing else: primary actions, the drawn circuit line and its nodes, registration crosses, the highlighted half of the display headline, focus rings, selection, caret, and the scrollbar thumb. Contrast against navy is 6.24:1 as navy-on-orange.
- **Burnt Orange Ink** (`{colors.orange-ink}`): The same live ink re-mixed for legibility on paper sheets (4.88:1 on paper). It is never used on navy.

### Secondary
- **WhatsApp Green** (`{colors.whatsapp-green}`) with **Deep Leaf Ink** (`{colors.whatsapp-ink}`): Platform color, used only on the floating dock action and the highlighted terminal row on `/links`. It is a quotation of another product's identity, deliberately excluded from every other surface.

### Neutral
- **Paper** (`{colors.paper}`): The ground of detail sheets, the backing plate behind the crest in the title block, stamp and colophon, and the ink color of the inverted action.
- **Chalk** (`{colors.chalk}`): Primary text on navy (14.7:1).
- **Chalk Dim** (`{colors.chalk-dim}`): Secondary text, leads, notes and nav links on navy (6.8:1).
- **Graphite** (`{colors.graphite}`): Primary text on paper (14.4:1), and the solid 2px rule over in-scope service families.
- **Graphite Dim** (`{colors.graphite-dim}`): Secondary text on paper (5.2:1), and the dashed/dotted rules of restricted and out-of-scope notation.
- **Navy Raised** (`{colors.navy-raised}`): The only tonal lift in the system — the hover ground of a terminal row on `/links`.
- **Burnt Dim** (`{colors.burnt-dim}`): Secondary copy on the flooded orange action sheet, where chalk-dim would disappear.
- **Line and grid tokens** (`{colors.line-navy}`, `{colors.line-navy-strong}`, `{colors.line-paper}`, `{colors.line-paper-strong}`, and the four grid values): The drawn structure. Hairlines are `line`, structural rules and margin ticks are `line-strong`. Detail sheets re-point `--line`/`--line-strong` at the paper pair so a component written once draws correctly on both grounds.

### Named Rules
**The Two Inks Rule.** Navy, orange, and the paper. No third brand color is ever introduced. WhatsApp green is platform ink and appears only on the two WhatsApp-specific surfaces; it never spreads into brand chrome, and it never touches the flooded orange sheet.

**The Live Ink Rule.** Orange marks only what is active, available, or currently drawn. It is never a background wash for atmosphere, never a decorative accent on a divider, and it floods exactly one region in the page: the closing action sheet.

**The Contextual Live Ink Rule.** Never hardcode orange in a component. Use `--ink-live`, which resolves to `{colors.orange}` on navy sheets and `{colors.orange-ink}` on paper sheets. On the flooded action sheet the sheet itself re-points `--chalk`, `--chalk-dim`, `--line` and `--line-strong` to navy values; components inherit and stay legible with no per-sheet overrides.

## Typography

**Display Font:** Archivo, self-hosted variable 100–900 (fallback `ui-sans-serif, system-ui, 'Segoe UI', sans-serif`)
**Body Font:** Archivo, same face — the system runs one text family
**Label/Mono Font:** Chivo Mono, self-hosted variable 100–700 (fallback `ui-monospace, 'SF Mono', Menlo, monospace`)

Both faces are served from the same origin as latin and latin-ext subsets with `font-display: swap`, and the two latin files are preloaded in the document head — no third party sits in the critical path.

**Character:** Archivo at 800 with -0.032em tracking is a signboard grotesque: dense, uppercase, set at billboard scale with a 0.94 line-height so two lines lock into a block. Chivo Mono is the drafter's hand — small, wide-tracked, uppercase, tabular — and it never speaks in sentences.

### Hierarchy
- **Display** (800, `clamp(2.35rem, 5.4vw, 4.4rem)`, 0.94, uppercase, max 20ch): The page's one billboard, on `h1` only. The second line takes `.display__live` to carry the live ink.
- **Headline** (800, `clamp(1.9rem, 5.2vw, 3.5rem)`, 0.94, uppercase, max 17ch): Sheet headings on `h2`. On the flooded action sheet the measure tightens to 15ch.
- **Title** (800, 1.25rem, -0.02em, uppercase): Service family names. The index rows on the audience sheet use a smaller cut (800, 1.125rem, -0.015em, uppercase).
- **Subtitle** (700, 1.0625rem, -0.012em, 1.25): The default `h3` — circuit steps and the trust creed.
- **Lead** (400, `clamp(1.05rem, 0.98rem + 0.42vw, 1.3rem)`, 1.5, max 46ch): The supporting sentence under a display or headline. Dim ink on both grounds.
- **Body** (400, `clamp(1rem, 0.96rem + 0.2vw, 1.0625rem)`, 1.6, tabular numerals): Running copy. Measures are capped per context — 62ch for boundary statements, 54ch for index rows, 40ch for circuit nodes.
- **Note** (Chivo Mono 500, 0.6875rem, 0.1em, uppercase, tabular): Annotation. Sheet numbers, step codes, stamp fields, colophon fields, nav links (0.75rem), and boundary verdicts (600 weight).
- **Note Micro** (Chivo Mono 600, 0.625rem, 0.1–0.12em, uppercase): Colophon column headings and the "Regra" tag inside a dimension callout.

### Named Rules
**The Mono-Is-Measurement Rule.** Chivo Mono is for annotation, sheet fields, codes, verdicts and measurement. It never sets body copy, never sets a heading, and never appears in a sentence a visitor reads for meaning rather than for reference.

**The No-Eyebrow Rule.** There is no eyebrow, kicker, or category label above a heading anywhere in this system, and none may be added. The mono labels that sit above headings are drawing annotations carrying real data — a sheet number, a step code (`Etapa 01`), an index number, a verdict — and the test is exact: if the label would still make sense with its text removed, it is an eyebrow and does not ship.

**The One Billboard Rule.** Only `h1` gets display scale, and only one word or phrase inside it takes the live ink. A second highlighted phrase in the same headline halves the value of both.

## Layout

Every surface is a sheet. `.sheet` sets the vertical rhythm (`{spacing.s-6}` block padding) and
`.sheet__inner` centers a 1240px measure with `{spacing.margin}` inline padding — a fluid gutter
that runs from 1.15rem on a phone to 3rem on a desktop. Column gaps in multi-column regions use
the wider `{spacing.gutter}`.

The spacing scale is six steps (6 / 12 / 20 / 32 / 52px, then a fluid 56–112px), and it is used
literally: `{spacing.s-3}` for internal padding and label gaps, `{spacing.s-4}` for row and column
separation, `{spacing.s-5}` for the space between a sheet head and its content, `{spacing.s-6}` for
the space between sheets.

Sheets alternate ground: navy `.sheet--plan` for plan surfaces (the circuit, the boundary, the
closing action, the `/links` page) and light `.sheet--detail` for reading-dense surfaces (the
service families, the audience index). Both carry the same two-level drafting grid — 24px fine
plus 120px major, `background-position: center top` — at different opacities for their ground.

Breakpoints are declared where the content actually breaks rather than on a fixed device ladder:
560 and 640 (chrome and dock compress), 700 (sheet numbers drop out), 720 (families become a
7-column grid), 760 (two- and three-column rows resolve), 780 (the circuit turns horizontal), 860
and 880 (creed and closing action resolve), 900 (nav links drop out), 1040 (the first sheet
splits head from stamp). The service family row is a 7-column grid with deliberately unequal
spans (3/2/2 for core families, 3 and 4 for restricted ones) so it reads as a drawing of families
rather than a row of equal cards.

Below 780px the circuit rotates from a horizontal rail to a vertical spine drawn down the left
edge of the step list, and the same draw-on-scroll behavior moves with it.

### Named Rules
**The Sheet Alternation Rule.** Consecutive sheets never share a ground. A new sheet is either a navy plan sheet or a light detail sheet, and it announces itself with a margin sheet number in mono (`Folha 02` onward) plus a `1.5px` structural rule above its head.

**The Anchor Clearance Rule.** The title block is sticky at 63px (62px min-height plus its 1px bottom rule). Every `[id]` in the system therefore carries `scroll-margin-top: 78px`, so an in-page anchor never delivers its target underneath the chrome.

## Elevation & Depth

There are no shadows in this system. The stylesheet contains zero `box-shadow` declarations and
none may be added. Depth is declared the way a drawing declares it: by line weight, by border, and
by ground.

Three devices carry the whole depth vocabulary. **Borders** separate and rank — a `1px`
`line-strong` rule under the sticky title block and above a sheet head, a `1.5px` rule opening a
list of boundary statements, a `2px` rule topping a service family. **Ground change** signals a
new plane: navy to paper between sheets, and the single tonal lift `{colors.navy-raised}` under a
hovered terminal row. **Stacking** is honest and shallow: the title block at z-index 60, the
floating dock at 70, the skip link at 100, and nothing else competes.

### Named Rules
**The No-Shadow Rule.** Elevation is declared by border and ground only. If a surface needs to feel lifted, give it a stronger rule or a different ground — never a shadow, never a glow, never a gradient scrim.

## Shapes

Everything is square. `border-radius` appears exactly twice in the stylesheet, both times `50%`,
both times the 13px circular node on the circuit rail — a drafting symbol, not a rounded corner.
Buttons, inputs, image plates, the stamp, terminal rows and sheet edges are all `0px`.

The system's one cut corner is the chamfer: flooded action controls clip an 11px triangle off the
bottom-right corner via `clip-path: polygon(0 0, 100% 0, 100% calc(100% - 11px), calc(100% - 11px) 100%, 0 100%)`.
It appears on the primary action and on the floating dock, and it is the silhouette that makes a
control read as a drafted part rather than a web button.

Recurring geometry beyond the corner: the 26px leader line with a 7px perpendicular terminator
tick (`.callout`); the 5px-wide 45° poché hatch band that marks an out-of-scope region; the 9px
margin rule of repeating 1px ticks every 40px; the 15px registration cross in the sheet corner;
and the small square list bullet — a 7px box with a 1.5px live-ink border, never a disc.

Raster imagery in the system is a single square plate: the client's own crest on a paper
background with a hairline border and 1–4px of padding, at 34px in the title block, 40px in the
colophon, 44px in the stamp, and 74px on `/links`. It is a seal of authorship and is never
enlarged into a hero illustration.

### Named Rules
**The Square Corner Rule.** Radius is `0`. The only curve permitted is the circular circuit node, because a node in a diagram is a circle.

**The Chamfer Rule.** The 11px cut corner belongs to filled action surfaces only. Outline and text controls stay rectangular; the chamfer is what distinguishes "this is the live control" from "this is a link".

## Components

### Buttons
- **Shape:** Hard rectangle (`{rounded.square}`) with the 11px bottom-right chamfer on filled variants.
- **Primary (`.act`):** Live orange ground with navy ink, `1.5px` border in its own ground color, 52px minimum height, `0.85rem 1.6rem` padding, 700 weight at 1rem, inline SVG icon at 18–20px with a 0.6rem gap.
- **Hover / Focus:** Ground lightens to `{colors.orange-hover}` over 0.18s ease; only `background-color`, `color` and `border-color` transition. Focus is the global `2px` orange ring at 3px offset.
- **Inverted (`.act--invert`):** Navy ground with paper ink, for the flooded orange sheet where green or a lighter orange would be the worst adjacency on the page. Hover lifts to `{colors.navy-hover}`.
- **Compact:** Inside the title block the primary action drops to 44px with `0.55rem 1rem` padding and 0.9375rem type; under 560px its label is hidden and only the icon remains, still at 44px.
- **Text tie (`.tie`):** Not a button — an inline 700-weight link with a 2px orange underline at 0.24em offset and 0.28rem block padding for target size. Hover shifts the text to live ink.

### Cards / Containers
There are no cards in this system, and that is the point. A service family (`.fam`) is a column
with no box, no background and no shadow: a `2px` `{colors.graphite}` rule across its top does the
work a card border would do, and a dashed rule in `{colors.graphite-dim}` marks a restricted-scope
family. Internal padding is asymmetric (`{spacing.s-3}` on top, right and bottom, `0` on the left)
so the top rule runs to the true column edge like a drawn line. The family's action pins to the
bottom with `margin-top: auto`, so a row of families aligns on its actions regardless of copy
length.

### Navigation
- **Title block (`.titleblock`):** Sticky at top, navy ground, 62px min-height plus a 1px `line-strong` bottom rule, z-index 60. Crest plate + two-line uppercase wordmark on the left (the second line in live ink), mono nav links center-right, primary action far right.
- **Links:** Mono note type at 0.75rem, `{colors.chalk-dim}`, 44px minimum height, 0.7rem inline padding, hover to live ink over 0.15s. They are hidden below 900px, where the persistent WhatsApp action carries navigation duty.
- **Terminal row (`/links`):** A full-width 1.25rem row with a hairline bottom rule, a 40px bordered icon plate, a two-line label with an ellipsized URL line, and an arrow at the right. Hover raises the ground to `{colors.navy-raised}` and grows a 2px live-ink bar from the top of the left edge via `transform: scaleY()` — a border reveal that never touches layout. The WhatsApp row inverts to platform green with deep leaf ink and suppresses the bar.
- **Skip link:** Live orange on navy, parked at `translateY(-140%)` and dropped into place on focus.

### The Circuit (signature)
The service journey drawn as a rail. On wide viewports it is a dashed `line-strong` rail with an
absolutely positioned SVG line in live ink at `stroke-width: 3`, three 13px circular nodes and a
2px terminator tick at the right end; the three numbered steps sit in a matching 3-column grid
below. The line draws itself once when the block crosses 85% of the viewport height, animating
`stroke-dashoffset` from 1 to 0 over 1.5s `cubic-bezier(0.16, 1, 0.3, 1)`; `pathLength="1"` makes
the dash math exact at any width, and `vector-effect="non-scaling-stroke"` keeps the weight
constant under the non-uniform `preserveAspectRatio="none"` scale.

The default CSS state is **already drawn**. The animation is armed only when a script adds
`.js-draw` to the root element, which happens only when `requestAnimationFrame` exists and the
user has not asked for reduced motion. With no JavaScript, the signature is present and complete.
Below 780px the rail is replaced by a 2px vertical spine behind the step list that draws with
`transform: scaleY()` over 1.3s on the same curve.

### The Callout (signature)
A real dimension cota, and the system's way of saying "this measurement applies here". A
`26px 1fr` grid whose first column is a 1px live-ink leader line offset `0.62em` from the top,
terminated by a 1px × 7px perpendicular tick. It carries the protection rule attached to each
service family, with a mono "Regra" tag above the text — an annotation, not a warning box.

### Notation: the legend and the boundary
- **Legend (`.legend`):** Three 30px key lines declaring the notation before it is used — solid 2px in `{colors.chalk}` (direct service), dashed in `{colors.chalk-dim}` (restricted scope), dotted in `{colors.graphite-dim}` (out of scope).
- **Boundary row (`.limit`):** A `13rem 1fr` definition row with a hairline bottom rule. The verdict is mono at 600 in live ink, preceded by a 26px dashed key line. Out-of-scope rows switch that key to dotted and grow a 5px band of 45° poché hatch (`repeating-linear-gradient(45deg, var(--line-strong) 0 1px, transparent 1px 5px)`) in the left margin, marking the region as excluded the way a drawing hatches a void.

### Sheet apparatus
- **Sheet number (`.sheet__no`):** Mono, dim, absolutely positioned in the top-right margin, non-interactive, hidden below 700px where there is no margin to live in.
- **Margin rule (`.sheet__rule`):** A 9px strip of 1px `line-strong` ticks every 40px, pinned to the top of a sheet; the bottom variant flips with `scaleY(-1)`.
- **Registration mark (`.regmark`):** A 15px live-ink cross in the sheet corner, drawn with the icon system, `pointer-events: none`.
- **Stamp (`.stamp`):** The title block of the drawing. A bordered `auto 1fr` plate holding the 44px crest, the signature line at 0.8125rem/700, and two mono fields (category, and region in live ink with a 12px location symbol).
- **Colophon (`.colophon`):** Navy ground, a `1.4fr 1fr 1fr 1fr` field grid over a hairline, mono micro headings in live orange, and a foot row of mono fields. The build credit carries its own higher-specificity rule so it reads as a link at rest in live orange rather than inheriting the dim link color.

### Floating action (`.dock`)
Fixed at the margin inset in the bottom-right corner, z-index 70, platform green with deep leaf
ink, a `1.5px` ink border and the same 11px chamfer as the primary action. It is hidden by
default and revealed only after the in-page primary action scrolls out of view, fading and
rising 10px over 0.25s. Below 640px it collapses to icon-only and the colophon grows 6rem of
bottom padding so it can never cover the last line of the page.

### Icons
Hand-authored geometry on a 24 grid, drawn as single-stroke paths with `stroke-linecap: square`
and `stroke-linejoin: miter` — the property that separates a technical symbol from a library
glyph. Stroke weight is optically compensated by size: 1.7 under 28px, 1.55 at 28–39px, 1.4 at
40px and up. Every icon in the set is a stroke drawing; exactly one, the WhatsApp mark, is a
filled path, because it is another company's logotype and may not be redrawn.

### Named Rules
**The Line-Weight Rule.** Line weight carries the rule, and it is the same rule everywhere in the system: solid = performed directly, dashed = restricted scope or conditional, dotted plus poché hatch = out of scope. Never use a dashed border for decoration, and never mark scope with color alone.

**The Legend-Closes Rule.** Any notation the page uses must be declared in a legend before it is read. If a new line weight, hatch or symbol is introduced, it either enters the legend or it does not ship.

**The Drawn-By-Default Rule.** The default CSS state of any animated element is its finished state. Motion is armed by a script class (`.js-draw`), never depended upon: with no JavaScript, with reduced motion, or with a missed scroll frame, the signature is fully present.

**The Miter Rule.** Icons are drawn, not imported. Square caps, miter joins, a 24 grid, size-compensated stroke weight, and no rounded terminals anywhere. A rounded-cap icon set would contradict every other line on the page.

## Do's and Don'ts

### Do:
- **Do** reach for `--ink-live` instead of a literal orange, so a component drops onto either ground and stays legible (`{colors.orange}` on navy, `{colors.orange-ink}` on paper).
- **Do** give a new sheet the opposite ground of the one before it, a margin sheet number in mono, and a `1.5px` rule above its head.
- **Do** declare scope with line weight — solid, dashed, dotted plus poché — and declare it in the legend before using it.
- **Do** use borders and ground changes for depth, and keep stacking to the three declared layers (60 title block, 70 dock, 100 skip link).
- **Do** keep interactive targets at 44px minimum and primary actions at 52px, and keep the icon-only compressions at 44px too.
- **Do** ship animation as an enhancement over an already-finished default state, and cap the page at one authored motion moment.
- **Do** draw new icons by hand on the 24 grid with square caps and miter joins at the size-compensated stroke weight.
- **Do** theme every browser surface from the palette — selection, caret, accent color, scrollbar track and thumb, focus ring, tabular numerals — so nothing renders in a default gray.
- **Do** cap measures: 46ch for a lead, 62ch for a statement, 40ch inside a circuit node.

### Don't:
- **Don't** add a `box-shadow`, a glow, or a gradient scrim. The stylesheet has zero shadows and that count is the rule.
- **Don't** round a corner. Radius is `0` everywhere except the circular circuit node, and the 11px chamfer is the only cut.
- **Don't** put an eyebrow, kicker, or category label above a heading. A mono label above a heading must carry real data — a sheet number, step code, index number, or verdict.
- **Don't** set body copy, headings, or any full sentence in Chivo Mono; it is annotation and measurement only.
- **Don't** introduce a third brand color. WhatsApp green stays on WhatsApp-specific surfaces and never enters the flooded orange sheet, where the inverted navy action is the correct control.
- **Don't** flood orange in a second region, or scatter it as decorative accent. One flooded sheet, and live ink only on what is active or available.
- **Don't** wrap content in a card with a background and a border. A top rule and honest column padding carry the grouping.
- **Don't** animate layout properties on hover (padding, width, margin). The terminal row's live bar uses `transform: scaleY()` precisely to avoid relayout.
- **Don't** enlarge the crest into a hero image or an illustration. It is a seal of authorship on a paper plate, at 34–74px.
- **Don't** let a component depend on JavaScript for its visual signature, and don't add an entrance animation to a section just because it exists.
