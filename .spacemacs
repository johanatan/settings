;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."

  ;; temporary hack to pin cider et al
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

  (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
  (add-to-list 'package-pinned-packages '(clj-refactor . "melpa-stable") t)
  (add-to-list 'package-pinned-packages '(cljr-helm . "melpa-stable") t)

  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(python
     octave
     csv
     ;; python
     haskell
     yaml
     sql
     html
     go
     osx
     javascript
     (clojure :variables
              clojure-enable-sayid t
              clojure-enable-clj-refactor t
              clojure-enable-linters 'clj-kondo)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     emacs-lisp
     git
     markdown
     org
     finance
     react
     restclient
     rust
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     syntax-checking
     tern
     (tree-sitter :variables
                  spacemacs-tree-sitter-hl-black-list '(js2-mode rjsx-mode)
                  tree-sitter-syntax-highlight-enable t
                  tree-sitter-fold-enable t
                  tree-sitter-fold-indicators-enable nil)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      beacon
                                      (copilot :location (recipe
                                                          :fetcher github
                                                          :repo "zerolfx/copilot.el"
                                                          :files ("*.el" "dist")))
                                      dash
                                      dash-functional
                                      exec-path-from-shell
                                      fstar-mode
                                      general
                                      hy-mode
                                      paredit
                                      paxedit
                                      tree-edit
                                      evil-tree-edit
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco"
                               :size 10
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before closing parenthesis.
   ;; (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun brace-replace ()
  (interactive)
  (if (memq (char-after) '(?\( ?\[ ?<))
    (evil-surround-change (char-after))
    (call-interactively 'evil-replace)))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun clojure-maybe-compile-and-load-file ()
  (when (eq major-mode 'clojure-mode)
    (cider-load-buffer)))

(defun setup-frames (ignored)
  (when (window-system)
    (let ((frames (frame-list))
          (set-size (lambda (frame)
                      (set-frame-width frame 240)
                      (set-frame-height frame 125)))
          (set-pos (lambda (frame x y) (set-frame-position frame x y))))
      (-map-indexed (lambda (index frame)
                      (funcall set-size frame)
                      (funcall set-pos frame (- 1545 (* index 1457)) 25)) (reverse frames)))))

(defun define-last-sexp-eval-as-previous-sexp ()
  (interactive)
  (save-excursion
    (let ((rhs (cider-last-sexp))
          (_ (clojure-backward-logical-sexp 1))
          (lhs (cider-last-sexp)))
      (spacemacs//cider-eval-in-repl-no-focus
       (concat "(def " lhs rhs ")")))))

(defun do-file-action-at (filename line column action)
  (with-temp-file filename
    (insert-file-contents filename)
    (save-excursion
      (evil-goto-line line)
      (evil-goto-column (- column 1))
      (funcall action))))

(defun delete-sexp ()
  (interactive)
  (delete-region (point) (save-excursion (forward-sexp) (point))))

(defun delete-file-form-at (filename line column)
  (do-file-action-at filename line column 'delete-sexp))

(defun symbol-at-point ()
  (interactive)
  (message (thing-at-point 'symbol 'no-properties)))

(defun list-at-point ()
  (interactive)
  (message (thing-at-point 'list 'no-properties)))

(defun sexp-at-point ()
  (interactive)
  (message (thing-at-point 'sexp 'no-properties)))

(defun word-at-point ()
  (interactive)
  (message (thing-at-point 'word 'no-properties)))

(defun sentence-at-point ()
  (interactive)
  (message (thing-at-point 'sentence 'no-properties)))

(defun line-at-point ()
  (interactive)
  (message (thing-at-point 'line 'no-properties)))

(defun defun-at-point ()
  (interactive)
  (message (thing-at-point 'defun 'no-properties)))

(defun skip-whitespace ()
  (skip-chars-forward " \t\n"))

(defun next-thing (thing)
  (save-excursion
    (evil-forward-word-begin)
    (thing-at-point thing 'no-properties)))

(defun sexp-word-at-point? (brace word)
  (let ((nxt-sexp (next-thing 'sexp)))
    (and (string-prefix-p brace (thing-at-point 'sexp 'no-properties))
         (string= nxt-sexp word))))

(defun is-let-binding? ()
  (save-excursion
    (paxedit-backward-up 2)
    (sexp-word-at-point? "(" "let")))

(defun is-function-arg-binding? ()
  (save-excursion
    (paxedit-backward-up 2)
    (or (sexp-word-at-point? "(" "defn")
        (sexp-word-at-point? "(" "defn-")
        (sexp-word-at-point? "(" "s/defn"))))

(defun is-func-literal-binding? ()
  (save-excursion
    (paxedit-backward-up 2)
    (sexp-word-at-point? "(" "fn")))

(defun is-keys-destructure-binding? ()
  (save-excursion
    (paxedit-backward-up 2)
    (or
     (sexp-word-at-point? "{" ":keys")   ; inconsistent behavior between editor &
     (sexp-word-at-point? "{" "keys")))) ;  temp-file buffer.

(defun is-as-binding? ()
  (save-excursion
    (evil-backward-word-begin)
    (or (string= ":as" (thing-at-point 'sexp 'no-properties))
        (string= "as" (thing-at-point 'sexp 'no-properties)))))

(defun delete-binding ()
  (interactive)
  (cond ((is-let-binding?)
         (delete-sexp)
         (delete-sexp))
        ((or (is-func-literal-binding?) (is-keys-destructure-binding?))
         (delete-sexp))
        ((is-function-arg-binding?)
         (delete-sexp)
         (when (string= ":-" (next-thing 'sexp))
           (delete-sexp)
           (delete-sexp)))))

(defun throwaway-binding ()
  (interactive)
  (cond ((or (is-func-literal-binding?) (is-let-binding?) (is-function-arg-binding?))
         (delete-sexp)
         (insert "_"))
        ((is-keys-destructure-binding?)
         (delete-sexp))
        ((is-as-binding?)
         (evil-backward-word-begin)
         (evil-backward-char 1) ; to get the : in ':as'
         (delete-sexp)
         (delete-sexp))))

(defun normalize-catch-all ()
  (interactive)
  (paxedit-symbol-kill)
  (insert ":else "))

(defun delete-file-binding-at (filename line column)
  (do-file-action-at filename line column 'delete-binding))

(defun throwaway-file-binding-at (filename line column)
  (do-file-action-at filename line column 'throwaway-binding))

(defun normalize-file-catch-all-at (filename line column)
  (do-file-action-at filename line column 'normalize-catch-all))

(defun join-to-previous (prefix)
  (interactive "p")
  (save-excursion
    (evil-previous-line prefix)
    (dotimes (var prefix)
      (join-line 1))))

(defun sp-sexp-opening-brace ()
  (save-excursion
    (sp-end-of-sexp)
    (evil-jump-item)
    (point)))

(defun sp-sexp-closing-brace ()
  (save-excursion
    (paxedit-backward-up 1)
    (evil-jump-item)
    (point)))

(defvar sp-op-transient-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "b") 'sp-forward-barf-sexp-and-move-point)
    (define-key map (kbd "s") 'sp-forward-slurp-sexp-and-move-point)
    (define-key map (kbd "B") 'sp-backward-barf-sexp-and-move-point)
    (define-key map (kbd "S") 'sp-backward-slurp-sexp-and-move-point)
    map))

(defun num-leading-spaces (line)
  (length (seq-take-while (lambda (c) (= c ?\s)) line)))

(defun num-leading-braces (line)
  (let ((remainder (substring line (num-leading-spaces line))))
    (length (seq-take-while (lambda (c) (memq c '(?\( ?\{ ?\[))) remainder))))

(defun get-line (line)
  (save-excursion
    (goto-line line)
    (thing-at-point 'line 'no-properties)))

(defun sp-forward-op-sexp-and-move-point (f &optional n)
  (interactive "p")
  (let ((open (sp-sexp-opening-brace)))
    (funcall f n)
    (goto-char open)
    (evil-jump-item)
    (set-transient-map sp-op-transient-map)))

(defun sp-sexp-backward-empty-wrapper? ()
  (string=
   (format "(%s)"
     (save-excursion (paxedit-backward-up 1)
       (thing-at-point 'sexp 'no-properties)))
   (save-excursion
     (paxedit-backward-up 2)
     (thing-at-point 'sexp 'no-properties))))

(defun sp-backward-op-sexp-and-move-point (slurp? &optional n)
  (interactive "p")
  (let* ((f (if slurp? 'sp-backward-slurp-sexp 'sp-backward-barf-sexp))
         (opening-line (line-number-at-pos (sp-sexp-opening-brace)))
         (closing (sp-sexp-closing-brace))
         (closing-line (line-number-at-pos closing))
         (closing-line-str (get-line closing-line))
         (indent (num-leading-spaces closing-line-str))
         (closing-brace-count (num-leading-braces closing-line-str))
         (column (save-excursion (goto-char closing) (current-column))))
    (funcall f n)
    (let* ((closing-line-str (get-line closing-line))
           (new-indent (num-leading-spaces closing-line-str))
           (new-closing-brace-count (num-leading-braces closing-line-str))
           (indentation-change (- new-indent indent))
           (brace-change (- new-closing-brace-count closing-brace-count))
           (adjustment
            (cond ((= closing-line opening-line) 0)
                  (t (+ indentation-change brace-change)))))
      (with-no-warnings (goto-line closing-line))
      (evil-beginning-of-line)
      (evil-forward-char (+ column adjustment))
      (sp-beginning-of-sexp)
      (if (and (not slurp?) (looking-at "[])}]"))
        (sp-unwrap-sexp)
        (when (and slurp? (sp-sexp-backward-empty-wrapper?))
          (sp-backward-unwrap-sexp))
        (set-transient-map sp-op-transient-map)))))

(defun sp-forward-barf-sexp-and-move-point (&optional n)
  (interactive "p")
  (sp-forward-op-sexp-and-move-point 'sp-forward-barf-sexp n))

(defun sp-forward-slurp-sexp-and-move-point (&optional n)
  (interactive "p")
  (sp-forward-op-sexp-and-move-point 'sp-forward-slurp-sexp n))

(defun sp-backward-barf-sexp-and-move-point (&optional n)
  (interactive "p")
  (sp-backward-op-sexp-and-move-point nil n))

(defun sp-backward-slurp-sexp-and-move-point (&optional n)
  (interactive "p")
  (sp-backward-op-sexp-and-move-point t n))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'evil-surround)
  (add-to-list 'auto-mode-alist '("\\.fst\\'" . fstar-mode))
  ;; use non-spaced pairs when surrounding with an opening brace
  (evil-add-to-alist
   'evil-surround-pairs-alist
   ?\( '("(" . ")")
   ?\[ '("[" . "]")
   ?\{ '("{" . "}")
   ?\) '("( " . " )")
   ?\] '("[ " . " ]")
   ?\} '("{ " . " }"))

  (if nil (with-eval-after-load 'clojure-mode
            (dolist (c (string-to-list ":_-?!#*"))
              (modify-syntax-entry c "w" clojure-mode-syntax-table))))

  (if nil
      (add-hook 'clojure-mode-hook #'(lambda ()
                                       (modify-syntax-entry ?\: "w")
                                       (modify-syntax-entry ?\_ "w")
                                       (modify-syntax-entry ?\@ "w")
                                       ;;(modify-syntax-entry ?\" "w")
                                       ;;(modify-syntax-entry ?\- "w")
                                       (modify-syntax-entry ?\? "w")
                                       (modify-syntax-entry ?\! "w")
                                       (modify-syntax-entry ?\# "w")
                                       (modify-syntax-entry ?\* "w"))))

  (define-key evil-normal-state-map (kbd "r") 'brace-replace)
  (define-key evil-normal-state-map (kbd "K") 'join-to-previous)
  (define-key evil-normal-state-map (kbd "gg") 'beginning-of-buffer)

  (setq-default
    js2-basic-offset 2
    js-indent-level 2
    beacon-blink-when-point-moves-vertically 1
    beacon-blink-when-window-scrolls t
    beacon-blink-when-window-changes t
    beacon-blink-when-buffer-changes t
    beacon-blink-when-focused t
    beacon-dont-blink-commands '()
    beacon-color "#d4f931"
    web-mode-markup-indent-offset 2
    projectile-indexing-method 'hybrid
    shell-file-name "/bin/sh"
    nrepl-use-ssh-fallback-for-remote-hosts t)

  (beacon-mode 1)

  (add-hook 'prog-mode-hook #'spacemacs-whitespace-cleanup-mode)

  (customize-set-variable 'helm-ff-lynx-style-map t)

  ; paxedit bindings
  (define-key evil-motion-state-map (kbd "M-<right>") 'paxedit-transpose-forward)
  (define-key evil-motion-state-map (kbd "M-[ 3 C") 'paxedit-transpose-forward)

  (define-key evil-motion-state-map (kbd "M-<left>") 'paxedit-transpose-backward)
  (define-key evil-motion-state-map (kbd "M-[ 3 D") 'paxedit-transpose-backward)

  (define-key evil-motion-state-map (kbd "M-<up>") 'paxedit-backward-up)
  (define-key evil-motion-state-map (kbd "M-[ 3 A") 'paxedit-backward-up)

  (define-key evil-motion-state-map (kbd "M-<down>") 'paxedit-backward-end)
  (define-key evil-motion-state-map (kbd "M-[ 3 B") 'paxedit-backward-end)

  (define-key evil-motion-state-map (kbd "<backspace>") 'paxedit-delete)
  (define-key evil-motion-state-map (kbd "M-<backspace>") 'paxedit-backward-kill)
  (define-key evil-motion-state-map (kbd "C-c C-k") 'paxedit-symbol-kill)

  (require 'evil-lisp-state)
  (define-key evil-lisp-state-map (kbd "K") 'paxedit-kill)
  (define-key evil-lisp-state-map (kbd "m") 'paxedit-compress)
  (define-key evil-lisp-state-map (kbd "f") 'paxedit-dissolve)
  (define-key evil-lisp-state-map (kbd "b") 'sp-forward-barf-sexp-and-move-point)
  (define-key evil-lisp-state-map (kbd "s") 'sp-forward-slurp-sexp-and-move-point)
  (define-key evil-lisp-state-map (kbd "B") 'sp-backward-barf-sexp-and-move-point)
  (define-key evil-lisp-state-map (kbd "S") 'sp-backward-slurp-sexp-and-move-point)

  ;; enable company globally
  (global-company-mode)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)

  ;; enable flycheck globally
  (global-flycheck-mode)

  (with-eval-after-load 'company
    ;; disable inline previews
    (delq 'company-preview-if-just-one-frontend company-frontends))

  (add-hook 'prog-mode-hook 'copilot-mode)
  (define-key evil-insert-state-map (kbd "M-<right>") 'copilot-accept-completion-by-line)
  (define-key evil-insert-state-map (kbd "M-<return>") 'copilot-accept-completion)
  (define-key evil-insert-state-map (kbd "M-<tab>") 'copilot-next-completion)

  (add-hook 'c-mode-hook 'evil-tree-edit-mode)
  (add-hook 'java-mode-hook 'evil-tree-edit-mode)
  (add-hook 'python-mode-hook 'evil-tree-edit-mode)

  (add-to-list 'after-make-frame-functions #'setup-frames)

  (defadvice projectile-project-root (around ignore-remote first activate)
    (unless (file-remote-p default-directory) ad-do-it))

  (setup-frames nil)

  (unless window-system
    (setq mouse-wheel-follow-mouse 't)
    (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
    (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))

  (global-smartparens-mode 1)
)

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(evil-tree-edit tree-edit reazon beacon undo-tree spinner queue flycheck-rust flycheck-pos-tip flycheck-ledger flycheck-haskell flycheck-clj-kondo parseedn parseclj a lv transient powerline org-category-capture alert log4e gntp org-plus-contrib skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode projectile request haml-mode gitignore-mode company-quickhelp flycheck quick-peek pos-tip flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg sbt-mode web-completion-data dash-functional tern restclient know-your-http-well go-mode ghc haskell-mode company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider sesman pkg-info clojure-mode epl markdown-mode rust-mode bind-map bind-key yasnippet packed anaconda-mode pythonic helm avy helm-core async auto-complete popup f s dash cider-spy csv-mode yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org tagedit sql-indent spaceline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restclient-helm restart-emacs rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el pbcopy paxedit paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file ob-restclient ob-http noflet neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode ledger-mode launchctl json-mode js2-refactor js-doc intero indent-guide hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio go-guru go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy fstar-mode flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump diminish cython-mode company-web company-tern company-statistics company-restclient company-go company-ghci company-ghc company-cabal company-anaconda column-enforce-mode coffee-mode cmm-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu cargo auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(beacon undo-tree spinner queue flycheck-rust flycheck-pos-tip flycheck-ledger flycheck-haskell flycheck-clj-kondo parseedn parseclj a lv transient powerline org-category-capture alert log4e gntp org-plus-contrib skewer-mode simple-httpd json-snatcher json-reformat js2-mode parent-mode projectile request haml-mode gitignore-mode company-quickhelp flycheck quick-peek pos-tip flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg sbt-mode web-completion-data dash-functional tern restclient know-your-http-well go-mode ghc haskell-mode company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider sesman pkg-info clojure-mode epl markdown-mode rust-mode bind-map bind-key yasnippet packed anaconda-mode pythonic helm avy helm-core async auto-complete popup f s dash cider-spy csv-mode yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org tagedit sql-indent spaceline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restclient-helm restart-emacs rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el pbcopy paxedit paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file ob-restclient ob-http noflet neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode ledger-mode launchctl json-mode js2-refactor js-doc intero indent-guide hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio go-guru go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy fstar-mode flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump diminish cython-mode company-web company-tern company-statistics company-restclient company-go company-ghci company-ghc company-cabal company-anaconda column-enforce-mode coffee-mode cmm-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu cargo auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
