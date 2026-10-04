# jnaneshwar.com

Personal site of Jnaneshwar Das. Hand-written HTML and CSS — no build step, no dependencies.

## Structure

```
index.html              home: hero, statement, two rails, now block, recent writing
field/                  research
fire/                   art
fire/navagunjara/       flagship project page (reverse-chronology timeline)
writing/                papers and essays, newest first
names/                  the ledger — single source of truth for credits
about/                  bio, contact, appointment, education
now/                    dated "what I'm working on" page
colophon/               how the site is built and verified
404.html                unobserved absence
css/site.css            the entire design system
img/                    stills (extracted from the 2026 build film with FFmpeg)
```

## Editing

Every page is a standalone HTML file. The nav and footer are repeated in each file by design (no templating). When adding a page, copy the nav block from any existing page and set `aria-current="page"` on the right link.

Each footer carries a **provenance line** — update the `verified` date when you check a page's facts.

## Preview locally

Any static server works. With Python:

```
python -m http.server 8000
```

Then open http://localhost:8000/ — root-relative links (`/css/site.css`) require serving from the project root, not opening files directly.

## Deploy

Static host of your choice (GitHub Pages, Cloudflare Pages, Netlify). `CNAME` is set for GitHub Pages. Point the domain's DNS at the host; see the deploy notes in the project conversation or the host's docs.

## License

Text CC BY 4.0. Artwork images © Earth Innovation Hub Corp. Code public domain.
