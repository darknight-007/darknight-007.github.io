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
serve.ps1               local preview server (no dependencies)
.nojekyll               serve the tree verbatim on GitHub Pages
CNAME                   custom domain for GitHub Pages
```

## Editing

Every page is a standalone HTML file. The nav and footer are repeated in each file by design (no templating). When adding a page, copy the nav block from any existing page and set `aria-current="page"` on the right link.

Each footer carries a **provenance line** — update the `verified` date when you check a page's facts.

## Preview locally

Root-relative links (`/css/site.css`) require a server; opening the files directly will not load the stylesheet.

```
powershell -ExecutionPolicy Bypass -File serve.ps1    # then http://localhost:8742/
python -m http.server 8000                            # if Python is installed
```

## Deploy

Hosted on GitHub Pages from [`darknight-007/darknight-007.github.io`](https://github.com/darknight-007/darknight-007.github.io), which serves at the repository root — so the root-relative links work unchanged.

```
git remote add origin https://github.com/darknight-007/darknight-007.github.io.git
git push origin master
```

`.nojekyll` tells Pages to serve the tree verbatim instead of running a Jekyll build.

`CNAME` contains `jnaneshwar.com`. While that file is present, Pages treats the custom domain as canonical and redirects `darknight-007.github.io` to it — so the domain's DNS must point at GitHub Pages first:

```
A     @     185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153
CNAME www   darknight-007.github.io.
```

Until DNS is configured, delete `CNAME` to serve at `darknight-007.github.io` directly.

## License

Text CC BY 4.0. Artwork images © Earth Innovation Hub Corp. Code public domain.
