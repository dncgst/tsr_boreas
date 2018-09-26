(TeX-add-style-hook
 "tsr_rr"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("elsarticle" "review" "times" "authoryear")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("babel" "english") ("hyperref" "colorlinks")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "elsarticle"
    "elsarticle10"
    "fontenc"
    "inputenc"
    "babel"
    "natbib"
    "hyperref"
    "lineno"
    "textcomp"
    "amsmath"
    "rotating")
   (LaTeX-add-labels
    "fig:1"
    "fig:pics"
    "fig:log"
    "fig:map"
    "tab:1"
    "fig:fabric"
    "fig:gstat"
    "fig:wave"
    "fig:ppp"
    "fig:ams"
    "fig:fauna"
    "fig:micro")
   (LaTeX-add-bibliographies))
 :latex)

