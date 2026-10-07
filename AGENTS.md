# AGENTS.md

## What this is

Jekyll-based GitHub Pages portfolio site (Academic Pages template, forked from Minimal Mistakes). Ruby + Node.js toolchain. No test suite, no linter, no CI workflows in this repo.

## Local development

```bash
bundle install          # install Ruby deps (delete Gemfile.lock if it fails)
bundle exec jekyll serve -l -H localhost   # serves at localhost:4000
```

`_config.yml` changes require restarting Jekyll (not auto-reloaded).

JS build (only needed if editing JS):
```bash
npm install
npm run build:js        # uglifies JS into assets/js/main.min.js
```

Docker alternative: `docker compose up` (uses `_config_docker.yml` overrides).

VS Code Dev Container is also available (`.devcontainer/devcontainer.json`).

## Content structure

| Directory       | What it holds          | Layout    |
|-----------------|------------------------|-----------|
| `_posts/`       | Blog posts             | `single`  |
| `_pages/`       | Static pages (About, CV)| `single`  |
| `_publications/`| Academic papers        | `single`  |
| `_talks/`       | Talk entries           | `talk`    |
| `_teaching/`    | Teaching entries       | `single`  |
| `_portfolio/`   | Portfolio items        | `single`  |
| `files/`        | Uploaded PDFs, etc.    | served as-is |

All collection items use YAML front matter. Layout defaults are set in `_config.yml` under `defaults`.

## Key config facts

- Site URL: `https://mridg.github.io`, baseurl: `""`
- Permalink pattern: `/:categories/:title/`
- Markdown: kramdown with GFM input
- Collections with `output: true`: teaching, publications, portfolio
- `talks` collection has `output: false`
- `Gemfile.lock` is gitignored — regenerate on clone
- `future: true` — posts with future dates will render
- Theme controlled by `site_theme` in `_config.yml` (options: default, air, sunrise, mint, dirt, contrast)

## CV data pipeline

The CV page pulls structured data from `_data/cv.json`. To update it from the markdown CV:

```bash
bash scripts/update_cv_json.sh
```

This runs `scripts/cv_markdown_to_json.py`, which parses `_pages/cv.md` + `_config.yml` + collection directories and writes `_data/cv.json`. You need Python 3 with `pyyaml` installed.

## CI

One GitHub Actions workflow: `.github/workflows/scrape_talks.yml`. Triggers on pushes to `_talks/` or `talkmap.ipynb`. Runs the Jupyter notebook `talkmap.ipynb` to geocode talk locations and auto-commits results. Needs Python 3.9, jupyter, geopy, getorg.

## Gotchas

- `Gemfile.lock` is gitignored. If `bundle install` fails, delete it and retry.
- JS minification bundles jQuery + plotly + plugins into `main.min.js`. If you edit `_main.js` or plugins, re-run `npm run build:js`.
- `_config_docker.yml` is loaded only in Docker and overrides settings from `_config.yml` (sets `url: ""`).
- `_plugins/compat.rb` patches Ruby 3.2+ incompatibility with Jekyll 3.x (`tainted?` method removal). Don't remove it.
- The `markdown_generator/` folder contains TSV-to-markdown scripts (Jupyter + Python) for bulk-adding publications/talks — optional, not part of the build.
