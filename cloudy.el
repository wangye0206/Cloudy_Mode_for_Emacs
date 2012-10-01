;; Dumbly Define Syntax Types
(defvar cloudy-model-settings
  '("absolute" "abundance" "abundances" "age" "alophaox" "angle" "aperture" "atom"
    "background" "blackbody" "bolometric" "bremsstrahlung"
    "cextra" "chemistry" "clumping" "CMB" "collisions" "column" "cooling" "constant" "continuum" "covergence" "coronal" "cosmic" "Cosmic" "covering" "cylinder"
    "dark" "deplete" "density" "depth" "destribution" "dilution" "dissipate" "distance" "dlaw"
    "element" "energy" "equilibrium" "equipartition" "extinguish"
    "factor" "failures" "field" "filling" "fluctuations" "frequency" "f(nu)" "F(nu)"
    "gbar" "globule" "grains" "gravity"
    "hden" "heating" "hextra"
    "illumination" "intensity" "interpolate" "ionization" "iterate"
    "laser" "levels" "limit" "linear" "lines" "log" "low" "luminosity" "L(nu)" "l(nu)"
    "magnetic" "magnitude" "matrix" "metals"
    "nchrg" "noise" "nuF(nu)" "nuf(nu)" "nuL(nu)" "nul(nu)"
    "opacity" "optical" "overview"
    "phi(H)" "parameter" "power" "law"
    "Q(H)" "q(H)"
    "radians" "radius" "range" "ratio" "rays" "read" "redistribution" "redshift" "reevaluate" "reset" "resolution"
    "scale" "set" "simulate" "slow" "sphere" "SS" "STE"
    "table" "temperature" "thermal" "thickness" "time" "total" "trace" "turbulence" "turbulent"
    "vlaw"
    "xi")
  "Cloudy Model Settings")

(defvar cloudy-outputs
  '("compile" "monitor" "plot" "print" "save")
  "Cloudy Outputs")

(defvar cloudy-modifiers
  '("break" "dex" "grid" "hash" "last" "no" "off" "on" "stop" "units")
  "Cloudy Modifiers")

(defvar cloudy-units
  '("angstroms" "K" "microns" "Ryd" "parsecs")
  "Cloudy Units")

(defvar cloudy-other-keywords
   '("at" "continue" "end" "from" "to" "zone")
   "Cloudy Other Keywords")

(defvar cloudy-element-names
    '("H" "h" "Hydrogen" "hydrogen" "He" "he" "Helium" "helium" "Li" "li" "Lithium" "lithium" "Be" "be" "Beryllium" "beryllium" "B" "b" "Boron" "boron" "C" "c" "Carbon" "carbon" "N" "n" "Nitrogen" "nitrogen" "O" "o" "Oxygen" "oxygen" "F" "f" "Fluorine" "fluorine" "Ne" "ne" "Neon" "neon" "Na" "na" "Sodium" "sodium" "Mg" "mg" "Magnesium" "magnesium" "Al" "al" "Aluminium" "aluminium" "Si" "si" "Silicon" "silicon" "P" "p" "Phosphor" "phosphor" "S" "s" "Sulphur" "sulphur" "Cl" "cl" "Chlorine" "chlorine" "Ar" "ar" "Argon" "argon" "K" "k" "Potassium" "potassium" "Ca" "ca" "Calcium" "calcium" "Sc" "sc" "Scandium" "scandium" "Ti" "ti" "Titanium" "titanium" "V" "v" "Vanadium" "vanadium" "Cr" "cr" "Chromium" "chromium" "Mn" "mn" "Manganese" "manganese" "Fe" "fe" "Iron" "iron" "Co" "co" "Cobalt" "cobalt" "Ni" "ni" "Nickel" "nickel" "Cu" "cu" "Copper" "copper" "Zn" "zn" "Zinc""zinc")
    "Cloudy Element Names")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; make regexps of the types (faster and less memory)
(defvar cloudy-model-settings-regexp
  (regexp-opt cloudy-model-settings 'words))

(defvar cloudy-outputs-regexp
  (regexp-opt cloudy-outputs 'words))

(defvar cloudy-modifiers-regexp
  (regexp-opt cloudy-modifiers 'words))

(defvar cloudy-units-regexp
  (regexp-opt cloudy-units 'words))

(defvar cloudy-other-keywords-regexp
  (regexp-opt cloudy-other-keywords 'words))

(defvar cloudy-element-names-regexp
  (regexp-opt cloudy-element-names 'words))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; apply font lock commands
(setq cloudy-font-lock-keywords
      `(
        (,cloudy-model-settings-regexp . font-lock-function-name-face)
        (,cloudy-outputs-regexp . font-lock-function-name-face)
        (,cloudy-modifiers-regexp . font-lock-type-face)
        (,cloudy-units-regexp . font-lock-constant-face)
        (,cloudy-other-keywords-regexp . font-lock-type-face)
        (,cloudy-element-names-regexp . font-lock-constant-face)
        ("\$[0-9]+" . font-lock-string-face)                     ; columns
        ("\\[\\([^]]+\\)\\]" 1 font-lock-string-face)))          ; brackets


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; define the mode
(define-derived-mode cloudy-mode fundamental-mode
  "Cloudy Mode"
  "Major mode for editing cloudy input files"
  ;;(set (make-local-variable 'comment-start) "//")
  ;;(set (make-local-variable 'comment-start) "c")
  ;;(set (make-local-variable 'comment-end) "")
  ;;(set (make-local-variable 'comment-column) 32)
  ;;(set (make-local-variable 'comment-start-skip) "#[ \t]*")

  ;; font lock
  (setq font-lock-defaults '((cloudy-font-lock-keywords)))
  ;;(setq show-trailing-whitespace t)

  ;; clear variables to save memory
  (setq cloudy-model-settings nil)
  (setq cloudy-outputs nil)
  (setq cloudy-modifiers nil)
  (setq cloudy-units nil)
  (setq cloudy-other-keywords nil)
  (setq cloudy-element-names nil)

  ;; apply keybindings
  ;; coming soon


  ;;other settings
  (setq require-final-newline t)

  (define-key cloudy-mode-map [remap comment-dwim] 'cloudy-comment-dwim)
  )
;;;;;;;;;;;;;

(provide 'cloudy)
