# svgfont

Extract and add glyphs to SVG font files.

## Description

`svgfont` is a Python utility for working with SVG font files. It can extract glyphs from an SVG font file into individual SVG files, or add SVG files as glyphs to an existing SVG font file.

## Features

- Extract all glyphs from an SVG font file into individual SVG files
- Add SVG files as glyphs to an existing SVG font file
- Automatic glyph name detection from filenames
- Duplicate glyph detection and skipping
- Verbose and quiet modes for different output levels
- Custom output directory support
- Bash completion support
- Comprehensive manual page

## Installation

### From Source

```bash
make install
```

This will install to `$(DESTDIR)$(PREFIX)` (default: `/usr/local`).

### Development Installation (Symlinks)

For development, you can install symlinks to the project directory:

```bash
sudo make install-symlinks
```

This creates symlinks in `/usr` pointing to files in the project directory.

### Debian Package

Build and install the Debian package:

```bash
dpkg-buildpackage -b
sudo dpkg -i ../svgfont_*.deb
```

## Usage

### Extract Glyphs

Extract all glyphs from an SVG font file:

```bash
svgfont -u materialdesignicons-webfont.svg
```

This creates a directory with individual SVG files for each glyph. By default, if the input file is `foo/bar.svg`, the output will be in `foo/bar/`.

### Extract to Custom Directory

Specify a custom output directory:

```bash
svgfont -u font.svg -o output/
```

### Add Glyphs

Add SVG files as glyphs to a font SVG file:

```bash
svgfont -a font.svg icon1.svg icon2.svg icon3.svg
```

This adds the specified SVG files as glyphs to the font file. The glyph name is derived from the filename (without extension). If a glyph with the same name already exists, it will be skipped.

### Verbose Mode

Enable verbose output to see debug messages:

```bash
svgfont -v -u font.svg
```

### Quiet Mode

Only show error messages:

```bash
svgfont -q -u font.svg
```

## Options

- `-u, --extract` - Extract font glyphs from SVG font file
- `-a, --add FONTSVG` - Add SVG files as font glyphs to the font SVG file
- `-o, --outdir DIR` - Output directory for extracted glyphs (default: directory beside the SVG file)
- `-v, --verbose` - Verbose mode (show debug messages)
- `-q, --quiet` - Quiet mode (only show errors)
- `-h, --help` - Show help message

## Requirements

- Python 3
- bash-completion (optional, for tab completion)

## Examples

Extract glyphs from a font file:

```bash
svgfont -u materialdesignicons-webfont.svg
```

Extract to a specific directory:

```bash
svgfont -u font.svg -o glyphs/
```

Add multiple icons to a font:

```bash
svgfont -a myfont.svg home.svg user.svg settings.svg
```

Extract with verbose output:

```bash
svgfont -v -u font.svg
```

## Files

- `svgfont` - Main Python script
- `svgfont.1` - Manual page
- `bash-completion/svgfont` - Bash completion script
- `debian/` - Debian packaging files

## Author

Lenik (谢继雷) <lenik@bodz.net>

## License

Copyright (c) 2026 Lenik

Licensed under the GNU General Public License, version 3 or later.

## See Also

- [SVG Font Specification](https://www.w3.org/TR/SVG11/fonts.html)

