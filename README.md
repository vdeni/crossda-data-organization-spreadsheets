<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

## Opće informacije

Kod za izlaganje "Rad s tabličnim podacima".
Prezentacija je rađena koristeći LaTeX-ovu `beamer` klasu. Sadržaj se većinom
temelji na radu Broman, K. W., & Woo, K. H. (2018). Data organization in
spreadsheets. *The American Statistician, 72*(1), 2-10.

Dio informacija i inspiracije je preuzet iz CESSDA Training Team (2020).
*CESSDA Data Management Expert Guide*. Bergen, Norway: CESSDA ERIC. doi:
`10.5281/zenodo.3820472`.

## Struktura direktorija

Folder `presentation` sadrži `.tex` dokument korišten za stvaranje
prezentacije. `presentation/images` sadrži slike korištene u prezentaciji.

`scripts` sadrži skripte korištene za izradu umjetnog seta podataka:
- `01-helper-functions.R` su nespecifične funkcije korištene u izradi
simuliranog seta podataka
- `02-party-name-generator.R` je jednostavna skripta korištena za generiranje
umjetnih imena stranaka za simulirani set podataka
- `03-simulate-data.R` stvara simulirani set podataka i u njega unosi missing
vrijednosti

## Vanjski resursi

U skriptama je korišten *Registar političkih stranaka Republike Hrvatske*
preuzet s
http://data.gov.hr/dataset/registar-politickih-stranaka-republike-hrvatske
12. studenog 2020.

`.here` je prazna datoteka koja pomaže `R` paketu `{here}` da odredi root folder.

## Verzije softvera

`LaTeX` verzija

```
pdfTeX 3.14159265-2.6-1.40.21 (TeX Live 2020/Arch Linux)
kpathsea version 6.3.2
Copyright 2020 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.37; using libpng 1.6.37
Compiled with zlib 1.2.11; using zlib 1.2.11
Compiled with poppler version 20.10.0
```

`R` verzija:

```
R version 4.0.3 (2020-10-10) -- "Bunny-Wunnies Freak Out"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
```
