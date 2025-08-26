# (unofficial) Johns Hopkins University PhD Dissertation/Thesis Template for LaTeX/Overleaf 
## Author: Dylan C. Gaeta (2025)

A complete LaTeX template for PhD dissertations and M.S. theses that meets Johns Hopkins University Sheridan Libraries formatting requirements (as of August 2025).

## Overview

This template provides a structured, modular approach to dissertation writing with compliance to JHU formatting standards, including PDF/A compliance via Overleaf. 

## Getting Started

### Option 1: Use with Overleaf (RECOMMENDED)

**Overleaf requires a ZIP file upload. Here's the easiest way:**

1. **Download ZIP from GitHub:**
   - Click the green "Code" button above
   - Select "Download ZIP"
   - Save `HopkinsDissertation-main.zip` to your computer

2. **Upload to Overleaf:**
   - Go to [Overleaf.com](https://www.overleaf.com/)
   - Click "New Project" → "Upload Project"
   - Select the downloaded `HopkinsDissertation-main.zip` file
   - Overleaf will automatically extract and set up your project

3. **Start editing:**
   - The main document is `main.tex`
   - Edit files in the Overleaf editor
   - Compile by clicking the "Recompile" button

**Note:** Overleaf automatically handles LaTeX compilation, so you don't need to run manual commands.

### Option 2: Download for Local Use

1. **Download the template:**
   - Click the green "Code" button → "Download ZIP"
   - Extract to your desired location

2. **Edit core files:**
   - `frontmatter/cover.tex`: Title, author, degree, and date
   - `frontmatter/abstract.tex`: Your abstract 
   - `frontmatter/dedication.tex`: Your dedication
   - `frontmatter/acknowledgments.tex`: Your acknowledgments

3. **Add your content:**
   - `introduction/introduction.tex`: Introduction chapter
   - `chapter*/chapter*.tex`: Main chapters (currently 3 provided)
   - `conclusion/conclusion.tex`: Conclusions chapter
   - `appendix/appendix*/appendix*.tex`: Appendices
   - `backmatter/dissertation.bib`: Bibliography entries

4. **Compile:**
   ```bash
   pdflatex main.tex
   bibtex main
   pdflatex main.tex  
   pdflatex main.tex
   ```

## Template Structure

```
HopkinsDissertation/
├── main.tex                    # Main document orchestrator
├── preamble.sty               # All formatting & package definitions
├── figures/                   # Image files (beach.jpg, hospital.jpg, etc.)
├── frontmatter/
│   ├── cover.tex             # Title page
│   ├── abstract.tex          # Abstract (≤350 words)
│   ├── dedication.tex        # Dedication page
│   ├── acknowledgments.tex   # Acknowledgments page
│   ├── committee.tex         # Thesis committee (optional)
│   └── toc.tex              # Table of contents generation
├── introduction/
│   └── introduction.tex      # Introduction chapter
├── chapter1/, chapter2/, chapter3/
│   └── chapter*.tex         # Main content chapters
├── conclusion/
│   └── conclusion.tex       # Conclusions chapter
├── references/
│   └── references.tex       # Unified References chapter
├── appendix/
│   ├── appendix1/appendix1.tex
│   └── appendix2/appendix2.tex
└── backmatter/
    ├── dissertation.bib     # Bibliography database
    └── cv.pdf              # Optional CV
```

## Key Features

### JHU Compliance
- **Frontmatter Order**: Title page → Abstract → Dedication/Acknowledgments (Preface) → Table of Contents → Lists
- **Page Numbering**: Roman numerals for frontmatter, Arabic for main text, centered at bottom
- **Margins**: 1 inch on all sides
- **Font**: Compatible with both serif and sans serif fonts
- **Spacing**: Double-spaced main text and abstract
- **References Structure**: Unified chapter containing appendices and bibliography

### Technical Features
- **PDF/A Format**: Full compliance for dissertation submission
- **Modular Design**: Each chapter in separate file for easy management  
- **Bibliography Management**: natbib package with flexible citation styles
- **Figure/Table Support**: Pre-configured formatting for academic figures
- **Mathematical Notation**: Full LaTeX math support with appropriate spacing

## Johns Hopkins University Formatting Requirements (August 2025)

Based on official requirements from [JHU Sheridan Libraries](https://www.library.jhu.edu/library-services/electronic-theses-dissertations/formatting-requirements/):

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
3. ✅ Preface (includes Dedication and Acknowledgments)
4. ✅ Table of Contents
5. ✅ List of Tables (if applicable)
6. ✅ List of Figures (if applicable)
7. ✅ List of Plates (if applicable)

### Content Requirements
- ✅ **Abstract**: Maximum 350 words, double-spaced
- ✅ **Bibliography**: Properly formatted academic citations
- ✅ **PDF/A Format**: Ensures long-term digital preservation
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
2. Add `chapter4/chapter4.tex` with content
3. Include in `main.tex`: `\input{chapter4/chapter4}`

### Modifying Bibliography Style
Edit the bibliography section in `references/references.tex` to change citation styles or add multiple bibliographies.

## Compilation Notes

- Use `pdflatex` for best PDF/A compatibility
- Run `bibtex` between LaTeX runs for bibliography updates
- Three LaTeX runs typically needed for cross-references and TOC
- Ensure all `.tex` files are UTF-8 encoded

## Support

For JHU-specific formatting questions, consult:
- [JHU Sheridan Libraries ETD Guidelines](https://www.library.jhu.edu/library-services/electronic-theses-dissertations/formatting-requirements/)
- [JHU Graduate Board Requirements](https://graduate.jhu.edu/dissertation/)

For LaTeX technical issues, refer to comprehensive LaTeX documentation or TeX Stack Exchange.

---

*This template was created in August 2025 and reflects current JHU dissertation requirements. Always verify with the latest official guidelines before submission.*
