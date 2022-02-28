;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jannis Limperg"
      user-mail-address "jannis@limperg.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "sans" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;;; Various Settings

(setq evil-escape-key-sequence "nr"
      doom-localleader-key "s"
      confirm-kill-emacs nil) ; Don't ask for confirmation on exit

(global-display-fill-column-indicator-mode)

;;; Lean 4

(after! lean4-mode
 (setq comment-start-skip nil
       comment-end-skip nil
       comment-use-syntax nil)
 (map!
  :map lean4-mode-map
  :localleader
  (:prefix ("g" . "go to")
           "g" #'lsp-find-definition
           "G" #'xref-pop-marker-stack)
  (:prefix ("t" . "toggle")
           "i" #'lean4-toggle-info)
  (:prefix ("p" . "leanpkg")
           "c" #'lean4-leanpkg-configure
           "b" #'lean4-leanpkg-build
           "t" #'lean4-leanpkg-test)
  "r" #'lean4-refresh-file-dependencies
  ))

;;; Prefer Lean 4 over Lean 3
(rassq-delete-all #'lean-mode auto-mode-alist)

;;; Non-mode-specific Keybindings

;; Note on motion state: Motion state is a special state that is used in
;; read-only modes. Key bindings for motion state are inherited by
;; normal/visual/operator modes unless overridden. Despite this, whenever we
;; define a motion-state key binding, we also explicitly define it for
;; normal/visual/operator modes. This is to prevent the default keybindings in
;; e.g. normal state overriding our motion state bindings.

;; Motion
(map!
 :nvom "h" 'evil-backward-word-begin
 :nvom "H" 'evil-backward-WORD-begin
 :nvom "g" 'evil-backward-word-end
 :nvom "G" 'evil-backward-WORD-end
 :nvom "f" 'evil-forward-word-end
 :nvom "F" 'evil-forward-WORD-end
 :nvom "q" 'evil-forward-word-begin
 :nvom "Q" 'evil-forward-WORD-begin
 :nvom "n" 'evil-backward-char
 :nvom "N" 'evil-first-non-blank
 :nvom "C-n" 'evil-first-non-blank-of-visual-line
 :nvom "C-N" 'evil-beginning-of-visual-line
 :nvom "r" 'evil-next-visual-line
 :nvom "R" 'end-of-buffer
 :nvom "C-r" 'evil-window-bottom
 :nvom "t" 'evil-previous-visual-line
 :nvom "T" 'beginning-of-buffer
 :nvom "C-t" 'evil-goto-first-line
 :nvom "d" 'evil-forward-char
 :nvom "D" 'evil-end-of-line
 :nvom "C-d" 'evil-end-of-visual-line
 :nvom "y" 'evil-ex-search-next
 :nvom "Y" 'evil-ex-search-previous
 :nvom "b" 'evil-find-char
 :nvom "B" 'evil-find-char-backward
 :nvom "m" 'evil-find-char-to
 :nvom "M" 'evil-find-char-to-backward
 :nvom "," 'evil-repeat-find-char)

;; State changes
(map!
 :nv "x" 'evil-substitute
 :nv "X" 'evil-change-whole-line
 :nv "l" 'evil-replace-state
 ;; :nv "L" 'evil-visual-replace-state ;; wrong type?!
 :nv "c" 'evil-open-below
 :nv "C" 'evil-open-above
 :nv "u" 'evil-change
 :nv "U" 'evil-change-line
 :nv "I" 'evil-replace
 :nv "a" 'evil-append
 :nv "A" 'evil-append-line
 :nv "e" 'evil-insert
 :nv "E" 'evil-insert-line
 :nv "ü" 'evil-visual-char
 :nv "Ü" 'evil-visual-line
 :nv "C-ü" 'evil-visual-block)

;; Other normal/visual commands
(map!
 :nv "v" 'evil-delete-char
 :nv "V" 'evil-delete-backward-char
 :nv "w" 'undo
 :nv "W" 'redo
 :nv "ß" 'evil-record-macro
 :nv "ẞ" 'evil-execute-macro
 :nv "o" 'evil-repeat
 :nv "C-y" 'evil-fill-and-move
 :nv "C-Y" 'fill-paragraph
 :nv "ö" 'evil-shift-left
 :nv "Ö" 'evil-shift-right
 :nv "ä" 'evil-paste-after
 :nv "Ä" 'evil-paste-before
 :nv "p" 'evil-yank
 :nv "P" 'evil-join
 :nv "<SPC> t M" 'toggle-input-method)

;; Special case: evil-surround-region in normal mode. For visual and operator
;; modes, evil-surround-mode already has appropriate key bindings, but we want
;; to have "S" in visual mode as well for consistency.
(map!
 :n "S" 'evil-surround-region)

(map!
 :map 'evil-surround-mode-map
 :v "S" 'evil-surround-region)

;; The evil-delete special case
;; i must be bound in operator state as well to enable "i i"
;; Thus, we move the "inner text objects" binding in operator state from "i"
;; to "e".
(map!
 :nvo "i" 'evil-delete
 :o "e" evil-inner-text-objects-map)

;;; ... and the same for evil-tex.
(after! evil-tex
  (evil-define-key '(visual operator) 'evil-tex-mode
    "i" nil
    "e" evil-tex-inner-text-objects-map))

;; Window manipulation
(map!
 :prefix "z"
 :nvm "h" 'evil-window-split
 :nvm "g" 'evil-window-vsplit
 :nvm "n" 'evil-window-left
 :nvm "r" 'evil-window-down
 :nvm "t" 'evil-window-up
 :nvm "d" 'evil-window-right)

;; Flycheck
(map!
 :prefix doom-leader-key
 :n "e l" 'flycheck-list-errors
 :n "e n" 'flycheck-next-error
 :n "e p" 'flycheck-previous-error)

;; Frames
(map!
 :prefix doom-leader-key
 :n "F n" 'make-frame-command)

;; Various commands under the "." prefix.
(map!
 :n "." nil)

(map!
 :prefix "."
 :n "c l" 'evilnc-comment-or-uncomment-lines
 )


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
