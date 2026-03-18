# (unofficial) Johns Hopkins University PhD Dissertation/MS Thesis Template for LaTeX/Overleaf
### Author: Dylan C. Gaeta (2026)

## Overview

An easily customizable LaTeX template for PhD dissertations and M.S. theses (or GBO/DQE/thesis proposals) that meets Johns Hopkins University Sheridan Libraries formatting requirements.
This template provides a structured, modular approach to dissertation writing in LaTeX/Overleaf with compliance to JHU formatting standards as of the Fall 2025 term.

## Getting Started

### Option 1: Use with Overleaf 🌱 (RECOMMENDED)

**Overleaf requires a ZIP file upload. Here's the easiest way:**

1. **Download ZIP from GitHub:**
   - Click the green "Code" button above
   - Select "Download ZIP"
   - Save `JHU-thesis-LaTeX-main.zip` to your computer

2. **Upload to Overleaf:**
   - Go to [Overleaf.com](https://www.overleaf.com/)
   - Click "New Project" → "Upload Project"
   - Select the downloaded `JHU-thesis-LaTeX-main.zip` file
   - Overleaf will automatically extract and set up your project

3. **Start editing:**
   - The main document is `main.tex`
   - Edit files in the Overleaf editor
   - Compile by clicking the "Recompile" button

**Note:** Overleaf automatically handles LaTeX compilation, so you don't need to run manual commands.

### Option 2: Download for Local Use 💻

1. **Download the template:**
   - Click the green "Code" button → "Download ZIP"
   - Extract to your desired location

2. **Edit core files:**
   - `output.xmpdata`: Your title, name, subject, and keywords for PDF/A metadata
   - `frontmatter/cover.tex`: Title, author, degree, and date
   - `frontmatter/abstract.tex`: Your abstract
   - `frontmatter/readers.tex`: Your readers/committee
   - `frontmatter/acknowledgments.tex`: Your acknowledgments
   - `frontmatter/quote.tex`: Optional epigraph/quotation page

3. **Add your content:**
   - `introduction/introduction.tex`: Introduction chapter
   - `chapter*/chapter*.tex`: Main chapters (currently 3 provided)
   - `conclusion/conclusion.tex`: Conclusions chapter
   - `appendix/appendix*/appendix*.tex`: Appendices (currently 3 provided)
   - `backmatter/dissertation.bib`: Bibliography entries

4. **Compile:**
   ```bash
   pdflatex main.tex
   bibtex main
   pdflatex main.tex
   pdflatex main.tex
   ```
## Compilation Notes

- Use `pdflatex` for best PDF/A compatibility
- Run `bibtex` between LaTeX runs for bibliography updates
- Three LaTeX runs typically needed for cross-references and TOC
- Ensure all `.tex` files are UTF-8 encoded

**Note:** These commands are for compiling LaTeX on your local device. You do NOT need to worry about this if you use Overleaf.

## Template Structure

```
JHU-thesis-LaTeX/
├── main.tex                        # Document body and chapter ordering
├── preamble.sty                    # All packages, PDF/A compliance, and formatting
├── output.xmpdata                  # ⚠️ PDF/A metadata — UPDATE WITH YOUR INFO
├── .gitignore                      # Excludes build artifacts from version control
├── sRGB_IEC61966-2-1_black_scaled.icc  # ICC color profile for PDF/A-1b
├── latexmkrc.txt                   # latexmk configuration (optional)
├── figures/                        # Introduction figures
│   └── badwater-basin.JPG
├── frontmatter/
│   ├── cover.tex                   # Title page
│   ├── abstract.tex                # Abstract (≤350 words)
│   ├── readers.tex                 # Thesis/reading committee (optional)
│   ├── acknowledgments.tex         # Acknowledgments page (optional)
│   ├── quote.tex                   # Epigraph/quotation page (optional)
│   └── toc.tex                     # Table of contents generation
├── introduction/
│   └── introduction.tex            # Introduction chapter
├── chapter1/
│   ├── chapter1.tex                # Chapter 1 content
│   └── figures/                    # Chapter 1 figures
├── chapter2/
│   ├── chapter2.tex                # Chapter 2 content
│   └── figures/                    # Chapter 2 figures
├── chapter3/
│   ├── chapter3.tex                # Chapter 3 content
│   └── figures/                    # Chapter 3 figures
├── conclusion/
│   └── conclusion.tex              # Conclusions chapter
├── appendix/
│   ├── appendixA/
│   │   ├── appendixA.tex           # Appendix A content
│   │   └── figures/                # Appendix A figures
│   ├── appendixB/
│   │   ├── appendixB.tex           # Appendix B content
│   │   └── figures/                # Appendix B figures
│   └── appendixC/
│       ├── appendixC.tex           # Appendix C content
│       └── figures/                # Appendix C figures
└── backmatter/
    ├── references.tex              # References chapter
    └── dissertation.bib            # Bibliography database
```

## Key Features

### JHU Compliance
- **Frontmatter Order**: Title page → Abstract → Readers → Acknowledgments (Preface) → Table of Contents → Lists of Figures/Tables
- **Page Numbering**: Roman numerals for frontmatter, Arabic for main text, centered at bottom
- **Margins**: 1 inch on all sides (option for 1.5 inch left margins for physical print copy submission)
- **Font**: Compatible with both serif and sans serif fonts
- **Spacing**: Double-spaced main text and abstract
- **References Structure**: Unified chapter containing appendices and bibliography

### Technical Features
- **PDF/A-1b Format**: Full compliance for dissertation submission with embedded ICC color profile
- **Modular Design**: Each chapter in separate directory with its own `figures/` folder for easy management
- **Bibliography Management**: natbib package with flexible citation styles
- **Figure/Table Support**: Pre-configured formatting with automatic numbering (Figure X.Y / Table X.Y)
- **Mathematical Notation**: Full LaTeX math support with appropriate spacing
- **Graphics Path Resolution**: Automatic figure lookup across all chapter directories via `\graphicspath`

## Johns Hopkins University Formatting Requirements (August 2025)

Based on official requirements from [https://www.library.jhu.edu/library-services/electronic-theses-dissertations/formatting-requirements/](https://www.library.jhu.edu/library-services/electronic-theses-dissertations/formatting-requirements/):

### Title Page Requirements
- ✅ Content centered within margins
- ✅ Page number hidden
- ✅ Title in ALL CAPITAL LETTERS
- ✅ Required statement: "A dissertation submitted to Johns Hopkins University in conformity with the requirements for the degree of [doctoral degree]"
- ✅ Location: "Baltimore, Maryland"
- ✅ Date in "Month Year" format
- ✅ Optional copyright notice at bottom

### General Layout Requirements
- ✅ **Margins**: 1 inch on all sides
- ✅ **Fonts**: Sans serif recommended (Arial, Calibri, Helvetica) - template supports both serif and sans serif
- ✅ **Font Size**: 10pt minimum (template uses 12pt)
- ✅ **Spacing**: Double-spaced main text and abstract
- ✅ **Page Numbers**: Centered at bottom of page
- ✅ **Format**: Must be submitted as PDF/A

### Page Numbering Requirements
- ✅ Title page: Hidden page number
- ✅ Front matter: Roman numerals (ii, iii, iv, etc.)
- ✅ Main content: Arabic numerals (1, 2, 3, etc.)
- ✅ Position: Centered at bottom of page

### Required Front Matter Order
1. ✅ Title Page
2. ✅ Abstract (350 words maximum)
3. ✅ Preface (includes Acknowledgments)
4. ✅ Table of Contents
5. ✅ List of Tables (if applicable)
6. ✅ List of Figures (if applicable)

### Content Requirements
- ✅ **Abstract**: Maximum 350 words, double-spaced
- ✅ **Bibliography**: Properly formatted academic citations
- ✅ **PDF/A-1b Format**: Ensures long-term digital preservation
- ✅ **Accessibility**: Proper document structure for screen readers

## Customization

### Changing Fonts
To use sans serif fonts (JHU recommended), modify `preamble.sty`:
```latex
\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
```

### Adding Chapters
1. Create new directory: `chapter4/`
2. Create `chapter4/figures/` for chapter-specific images
3. Add `chapter4/chapter4.tex` with content
4. Add the graphics path in `preamble.sty`: `{chapter4/figures/}%`
5. Include in `main.tex`: `\input{chapter4/chapter4}`

### Adding Figures
Place figures in the appropriate `figures/` directory:
- Introduction figures → `figures/`
- Chapter figures → `chapter*/figures/`
- Appendix figures → `appendix/appendix*/figures/`

Use descriptive, hyphenated filenames (e.g., `badwater-basin.JPG`, `alabama-hills.JPG`).

**⚠️ PDF/A-1b Image Compliance:** All figures must use the **sRGB color profile** to match this template's output intent. Images from iPhones, newer Macs, and many digital cameras often use Display P3 or Adobe RGB, which can cause PDF/A validation failures or color shifts. Before adding your figures, ensure they meet these requirements:
- **Color space**: sRGB IEC61966-2.1 (not Display P3, Adobe RGB, or ProPhoto RGB)
- **Embedded ICC profile**: sRGB profile must be embedded in the image file
- **Format**: JPG or PNG (JPG recommended for photographs)

To convert images without altering scientific print quality, you can use [Claude](https://claude.ai) (ask it to batch-convert your figures from Display P3 to sRGB using Python/Pillow with perceptual rendering intent), or use ImageMagick from the command line:
```bash
magick input.jpg -profile sRGB.icc -quality 95 output.jpg
```
The sample figures included in this template have already been converted to sRGB at 300 DPI print resolution.

### Modifying Bibliography Style
Edit the bibliography section in `preamble.sty` to change citation styles, or modify `backmatter/references.tex` to add multiple bibliographies.

### PDF/A Metadata (REQUIRED)
Before compiling your final submission, you **must** update `output.xmpdata` with your personal information. This file controls the XMP metadata embedded in the PDF/A-1b output. Replace the placeholder values:
```latex
\Title{Your Actual Dissertation Title}
\Author{Your Full Name}
\Subject{Your Degree/Subject Topic}
\Keywords{keyword1 \sep keyword2 \sep keyword3}
\Copyright{Copyright \copyright\ 2026 by Your Full Name}
```
The `\Publisher` and `\Org` fields are pre-set to Johns Hopkins University and should not need changes. If this file is not updated, your PDF metadata will contain placeholder text, which may cause issues during the Sheridan Libraries submission review.

## Support

For JHU-specific formatting questions, consult:
- [JHU Sheridan Libraries ETD Guidelines](https://www.library.jhu.edu/library-services/electronic-theses-dissertations/formatting-requirements/)
- [JHU Homewood Graduate Board Requirements](https://homewoodgrad.jhu.edu/graduate-board/)

For LaTeX technical issues, refer to comprehensive LaTeX documentation or TeX Stack Exchange.

---

*This template was created in March 2026 and reflects current JHU dissertation requirements. Always verify with the latest official guidelines before submission.*
