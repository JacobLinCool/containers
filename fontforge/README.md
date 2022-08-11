# FontForge

Alpine based FontForge docker images.

## Variants

### `ghcr.io/jacoblincool/fontforge`

Just a basic image with `fontforge` installed.

```sh
docker run --rm -v "$(pwd):/data" ghcr.io/jacoblincool/fontforge -c 'Open($1); Generate($2)' in.ttf out.woff
```

### `ghcr.io/jacoblincool/fontforge-convert`

This image convert font to `otf`, `ttf`, `woff`, `woff2`, and `svg` format in parallel.

It will detect the input format and convert it to the other formats.

```sh
# otf -> ttf, woff, woff2, svg
docker run --rm -v "$(pwd):/data" ghcr.io/jacoblincool/fontforge-convert in.otf

# ttf -> otf, woff, woff2, svg
docker run --rm -v "$(pwd):/data" ghcr.io/jacoblincool/fontforge-convert in.ttf
```
