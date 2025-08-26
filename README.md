# (unofficial) Johns Hopkins University PhD Dissertation/MS Thesis Template for LaTeX/Overleaf 
### Author: Dylan C. Gaeta (2025)

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
   - `frontmatter/cover.tex`: Title, author, degree, and date
   - `frontmatter/abstract.tex`: Your abstract
   - `frontmatter/readers.tex`: Your readers/committee 
   - `frontmatter/acknowledgments.tex`: Your acknowledgments
   - `frontmatter/dedication.tex`: Your dedication

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
├── main.tex                   # Main document orchestrator
├── preamble.sty               # All formatting & package definitions
├── figures/                   # Image files (clock.jpg, beach.jpg, hospital.jpg, etc.)
├── frontmatter/
│   ├── cover.tex              # Title page
│   ├── abstract.tex           # Abstract (≤350 words) 
│   ├── readers.tex            # Thesis/reading committee (optional)
│   ├── acknowledgments.tex    # Acknowledgments page (optional) 
│   ├── dedication.tex         # Dedication page (optional)
│   └── toc.tex                # Table of contents generation
├── introduction/
│   └── introduction.tex       # Introduction chapter
├── chapter1/, chapter2/, chapter3/
│   └── chapter*.tex           # Main content chapters
├── conclusion/
│   └── conclusion.tex         # Conclusions chapter
├── backmatter/
│   └── references.tex         # References chapter
│   ├── appendix/
│   │   ├── appendixA/appendixA.tex
│   │   ├── appendixB/appendixB.tex
│   │   └── appendixC/appendixC.tex
│   ├── dissertation.bib       # Bibliography database
│   └── cv.pdf                 # CV (optional) 
```

## Key Features

### JHU Compliance
- **Frontmatter Order**: Title page → Abstract → Readers → Dedication/Acknowledgments (Preface) → Table of Contents → Lists of Figures/Tables 
- **Page Numbering**: Roman numerals for frontmatter, Arabic for main text, centered at bottom
- **Margins**: 1 inch on all sides (option for 1.5 inch left margins for physical print copy submission) 
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

## Support

For JHU-specific formatting questions, consult:
- [JHU Sheridan Libraries ETD Guidelines](https://www.library.jhu.edu/library-services/electronic-theses-dissertations/formatting-requirements/)
- [JHU Homewood Graduate Board Requirements](https://homewoodgrad.jhu.edu/graduate-board/)

For LaTeX technical issues, refer to comprehensive LaTeX documentation or TeX Stack Exchange.

---

*This template was created in August 2025 and reflects current JHU dissertation requirements. Always verify with the latest official guidelines before submission.*
