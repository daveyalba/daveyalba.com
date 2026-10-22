# daveyalba.com

Plain HTML/CSS site hosted free on GitHub Pages. No build step: edit a file, commit, and it's live a minute later.

```
index.html            About Me (home)
clips/index.html      Clips
resume/index.html     Resume
secure/index.html     Secure Contact (Signal; username is encoded, revealed on click)
pgp/index.html        redirect from the old PGP page to /secure/
heat-wave/            2012 Columbia piece
fiber-optics/         2012 Columbia piece
assets/style.css      all styling
images/               photos (filled by download-assets.sh)
s/                    PDFs   (filled by download-assets.sh; same /s/ paths as the old site)
CNAME                 tells GitHub Pages the domain is www.daveyalba.com
```

## Moving off Squarespace — in this order

Keep Squarespace running until step 5 is done, so the site never goes dark.

### 1. Grab the photos and PDFs (while Squarespace is still up)
In Terminal, from this folder:
```
bash download-assets.sh
```
You should get 3 files in `images/` and 3 in `s/`.

### 2. Put the site on GitHub
1. Sign in at github.com and create a **new public repository** (any name, e.g. `daveyalba.com`). Don't add a README.
2. On the empty repo page, click **uploading an existing file**, drag in everything in this folder (including the `images` and `s` folders), and commit.
   *(Or with git: `git init && git add . && git commit -m "Initial site" && git branch -M main && git remote add origin <repo URL> && git push -u origin main`)*
3. Repo **Settings → Pages**: Source = *Deploy from a branch*, Branch = `main`, folder = `/ (root)`. Save.
4. Still on that page, **Custom domain** should already show `www.daveyalba.com` (from the CNAME file). Leave it.
5. Check the preview at `https://<your-username>.github.io/<repo-name>/` — everything should work there.

### 3. Point the domain at GitHub
Go to wherever the domain is registered (if you bought it through Squarespace, that's **Squarespace → Domains → daveyalba.com → DNS**). Delete the existing Squarespace records, then add:

| Type  | Host | Value |
|-------|------|-------|
| A     | @    | 185.199.108.153 |
| A     | @    | 185.199.109.153 |
| A     | @    | 185.199.110.153 |
| A     | @    | 185.199.111.153 |
| AAAA  | @    | 2606:50c0:8000::153 |
| AAAA  | @    | 2606:50c0:8001::153 |
| AAAA  | @    | 2606:50c0:8002::153 |
| AAAA  | @    | 2606:50c0:8003::153 |
| CNAME | www  | `<your-username>.github.io` |

**Leave any MX / email records alone** if you get email at this domain.

### 4. Turn on HTTPS
Back in GitHub **Settings → Pages**, wait for the DNS check to go green (minutes to a few hours), then tick **Enforce HTTPS**.

### 5. Cancel the Squarespace *website* plan
Once https://www.daveyalba.com loads the new site, cancel the website subscription.
**Don't let the domain lapse.** The domain registration is billed separately from the website plan. You can either keep it at Squarespace Domains or transfer it to a cheaper registrar (Cloudflare, Porkbun, Namecheap) — if you transfer, recreate the DNS records above at the new registrar.

## Editing later
- Add a clip: open `clips/index.html` on github.com, click the pencil, copy an existing `<li>…</li>` line, change the link/title/date, commit.
- Change the bio: same, in `index.html`.
