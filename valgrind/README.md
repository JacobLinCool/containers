# Valgrind

A valgrind image for fast debugging.

## Variants

### `ghcr.io/jacoblincool/valgrind`

Simply compile a C source file with `gcc` and run it with `valgrind`:

```sh
docker run --rm -v "$(pwd):/home" ghcr.io/jacoblincool/valgrind <source.c>
```

Use `make` to compile and run the new executable:

```sh
docker run --rm -v "$(pwd):/home" ghcr.io/jacoblincool/valgrind make
```
