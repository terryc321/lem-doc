# missing features 

no shell in lem no M-x shell 

# deprecated 

screenshots show use of display-buffer in code 

display-buffer is deprecated replaced with pop-to-buffer

this was only discovered by looking into the git logs

> git log -S "display-buffer"

we found this git log message , atleast now we know
========================================================
commit c91db8cfa98b9eba8d87dd8f4f13abf6c6aa2433
Author: cxxxr <g23tlm@gmail.com>
Date:   Thu Jul 6 00:44:43 2023 +0900

    Replace calls to display-buffer with pop-to-buffer
========================================================

ideally we should scan each library in the lem source code extract lines
(defcommand XXX ...)

## defcommand extractor

grep -rnwi '/home/terry/code/lem' -e 'define-command'

```
grep --color=auto -rnwi '/home/terry/code/lem' -e 'define-command'
grep: /home/terry/code/lem/lem: binary file matches
/home/terry/code/lem/contrib/fbar/fbar.lisp:75:(define-command fbar-select () ()
/home/terry/code/lem/contrib/fbar/fbar.lisp:110:  (define-command fbar-on () ()
/home/terry/code/lem/contrib/fbar/fbar.lisp:129:  (define-command fbar-off () ()
/home/terry/code/lem/contrib/calc-mode/main.lisp:34:(define-command calc () ()
/home/terry/code/lem/contrib/calc-mode/main.lisp:38:(define-command calc-eval-line () ()
/home/terry/code/lem/contrib/migemo/main.lisp:11:(define-command isearch-forward-migemo (&optional prompt) ()
/home/terry/code/lem/contrib/migemo/main.lisp:18:(define-command isearch-backward-migemo (&optional prompt) ()
/home/terry/code/lem/contrib/bracket-paren-mode/bracket-paren-mode.lisp:19:(define-command insert-closed-paren () ()
/home/terry/code/lem/contrib/selection-mode/selection-mode.lisp:64:(define-command (selection-next-line (:advice-classes selection-advice)) (&optional n) (:universal)
/home/terry/code/lem/contrib/selection-mode/selection-mode.lisp:66:(define-command (selection-backward-char (:advice-classes selection-advice)) (&optional n) (:universal)
/home/terry/code/lem/contrib/selection-mode/selection-mode.lisp:68:(define-command (selection-forward-char (:advice-classes selection-advice)) (&optional n) (:universal)
/home/terry/code/lem/contrib/selection-mode/selection-mode.lisp:70:(define-command (selection-previous-line (:advice-classes selection-advice)) (&optional n) (:universal)
/home/terry/code/lem/contrib/selection-mode/selection-mode.lisp:72:(define-command (selection-copy (:advice-classes selection-advice)) (&optional n) (:universal)
/home/terry/code/lem/contrib/selection-mode/selection-mode.lisp:78:(define-command (selection-cut (:advice-classes selection-advice)) (&optional n) (:universal)
/home/terry/code/lem/contrib/selection-mode/selection-mode.lisp:86:(define-command (selection-paste (:advice-classes selection-advice))
/home/terry/code/lem/contrib/google-translate/main.lisp:6:(define-command popup-google-translate (start end) (:region)
/home/terry/code/lem/contrib/version-up/version.lisp:78:(lem:define-command !version-up () ()
/home/terry/code/lem/contrib/ollama/ollama.lisp:24:(define-command ollama-close () ()
/home/terry/code/lem/contrib/ollama/ollama.lisp:72:(define-command ollama-prompt (prompt) ((:string "Prompt: "))
/home/terry/code/lem/contrib/ollama/listener.lisp:48:(define-command run-ollama () ()
/home/terry/code/lem/contrib/tetris/tetris.lisp:258:(define-command tetris-move-left () ()
/home/terry/code/lem/contrib/tetris/tetris.lisp:264:(define-command tetris-move-right () ()
/home/terry/code/lem/contrib/tetris/tetris.lisp:270:(define-command tetris-move-down () ()
/home/terry/code/lem/contrib/tetris/tetris.lisp:276:(define-command tetris-hard-drop () ()
/home/terry/code/lem/contrib/tetris/tetris.lisp:283:(define-command tetris-rotate () ()
/home/terry/code/lem/contrib/tetris/tetris.lisp:288:(define-command tetris-quit () ()
/home/terry/code/lem/contrib/tetris/tetris.lisp:309:(define-command tetris () ()
/home/terry/code/lem/tests/interp.lisp:7:(lem:define-command $test-command-flag () ()
/home/terry/code/lem/src/color-theme.lisp:89:(define-command load-theme (name &optional (save-theme t))
/home/terry/code/lem/src/commands/window.lisp:71:        `(define-command ,(intern (format nil "~a-NEXT-WINDOW"
/home/terry/code/lem/src/commands/window.lisp:87:  (define-command select-buffer (name) ((:other-buffer "Use Buffer: "))
/home/terry/code/lem/src/commands/window.lisp:95:(define-command kill-buffer (buffer-or-name) ((:buffer "Kill buffer: "))
/home/terry/code/lem/src/commands/window.lisp:104:(define-command previous-buffer () ()
/home/terry/code/lem/src/commands/window.lisp:114:(define-command next-buffer () ()
/home/terry/code/lem/src/commands/window.lisp:120:(define-command recenter (p) (:universal-nil)
/home/terry/code/lem/src/commands/window.lisp:127:(define-command split-active-window-vertically (&optional n) (:universal-nil)
/home/terry/code/lem/src/commands/window.lisp:133:(define-command split-active-window-horizontally (&optional n) (:universal-nil)
/home/terry/code/lem/src/commands/window.lisp:139:(define-command next-window (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/window.lisp:151:(define-command previous-window (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/window.lisp:154:(define-command switch-to-last-focused-window () ()
/home/terry/code/lem/src/commands/window.lisp:162:(define-command window-move-down () ()
/home/terry/code/lem/src/commands/window.lisp:167:(define-command window-move-up () ()
/home/terry/code/lem/src/commands/window.lisp:172:(define-command window-move-right () ()
/home/terry/code/lem/src/commands/window.lisp:177:(define-command window-move-left () ()
/home/terry/code/lem/src/commands/window.lisp:182:(define-command delete-other-windows () ()
/home/terry/code/lem/src/commands/window.lisp:195:(define-command delete-active-window () ()
/home/terry/code/lem/src/commands/window.lisp:200:(define-command quit-active-window (&optional kill-buffer) (:universal-nil)
/home/terry/code/lem/src/commands/window.lisp:205:(define-command grow-window (n) (:universal)
/home/terry/code/lem/src/commands/window.lisp:213:(define-command shrink-window (n) (:universal)
/home/terry/code/lem/src/commands/window.lisp:221:(define-command grow-window-horizontally (n) (:universal)
/home/terry/code/lem/src/commands/window.lisp:229:(define-command shrink-window-horizontally (n) (:universal)
/home/terry/code/lem/src/commands/window.lisp:240:(define-command scroll-down (n &optional (window (current-window))) (:universal)
/home/terry/code/lem/src/commands/window.lisp:254:(define-command scroll-up (n &optional (window (current-window))) (:universal)
/home/terry/code/lem/src/commands/window.lisp:272:(define-command compare-windows (ignore-whitespace) (:universal)
/home/terry/code/lem/src/commands/window.lisp:296:(define-command toggle-line-wrap () ()
/home/terry/code/lem/src/commands/edit.lisp:73:(define-command (self-insert (:advice-classes self-insert-advice editable-advice))
/home/terry/code/lem/src/commands/edit.lisp:91:(define-command (newline (:advice-classes editable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:95:(define-command (open-line (:advice-classes editable-advice)) (n) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:99:(define-command quoted-insert (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:114:(define-command (delete-next-char (:advice-classes editable-advice)) (&optional n) (:universal-nil)
/home/terry/code/lem/src/commands/edit.lisp:137:(define-command (delete-previous-char (:advice-classes editable-advice)) (&optional n) (:universal-nil)
/home/terry/code/lem/src/commands/edit.lisp:151:(define-command copy-region (start end) (:region)
/home/terry/code/lem/src/commands/edit.lisp:157:(define-command copy-region-to-clipboard (start end) (:region)
/home/terry/code/lem/src/commands/edit.lisp:169:(define-command kill-region (start end) (:region)
/home/terry/code/lem/src/commands/edit.lisp:178:(define-command kill-region-to-clipboard (start end) (:region)
/home/terry/code/lem/src/commands/edit.lisp:183:(define-command (kill-line (:advice-classes editable-advice)) (&optional arg) (:universal-nil)
/home/terry/code/lem/src/commands/edit.lisp:215:(define-command kill-whole-line (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:242:(define-command yank (&optional arg) (:universal-nil)
/home/terry/code/lem/src/commands/edit.lisp:246:(define-command (yank-pop (:advice-classes editable-advice)) (&optional n) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:259:(define-command (yank-pop-next (:advice-classes editable-advice)) (&optional n) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:272:(define-command yank-to-clipboard (&optional arg) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:279:(define-command (paste-from-clipboard (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/commands/edit.lisp:297:(define-command (entab-line (:advice-classes editable-advice)) (n) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:303:(define-command (detab-line (:advice-classes editable-advice)) (n) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:310:(define-command (delete-blank-lines (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/commands/edit.lisp:334:(define-command (just-one-space (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/commands/edit.lisp:340:(define-command (delete-indentation (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/commands/edit.lisp:360:(define-command (transpose-characters (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/commands/edit.lisp:377:(define-command undo (n) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:384:(define-command redo (n) (:universal)
/home/terry/code/lem/src/commands/edit.lisp:403:(define-command (increment (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/commands/edit.lisp:407:(define-command (decrement (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/commands/edit.lisp:411:(define-command delete-trailing-whitespace (&optional (buffer (current-buffer))) ()
/home/terry/code/lem/src/commands/file.lisp:75:(define-command find-file (arg) (:universal)
/home/terry/code/lem/src/commands/file.lisp:218:(define-command find-file-recursively (arg) (:universal)
/home/terry/code/lem/src/commands/file.lisp:234:(define-command read-file (filename) ((:new-file "Read File: "))
/home/terry/code/lem/src/commands/file.lisp:272:(define-command save-current-buffer (&optional force-p) (:universal-nil)
/home/terry/code/lem/src/commands/file.lisp:278:(define-command write-file (filename) ((:new-file "Write File: "))
/home/terry/code/lem/src/commands/file.lisp:299:(define-command write-region-file (start end filename)
/home/terry/code/lem/src/commands/file.lisp:307:(define-command insert-file (filename) ((:file "Insert file: "))
/home/terry/code/lem/src/commands/file.lisp:313:(define-command save-some-buffers (&optional save-silently-p) (:universal-nil)
/home/terry/code/lem/src/commands/file.lisp:345:(define-command revert-buffer (does-not-ask-p) (:universal-nil)
/home/terry/code/lem/src/commands/file.lisp:378:(define-command change-directory (directory)
/home/terry/code/lem/src/commands/file.lisp:387:(define-command current-directory (&optional insert) (:universal-nil)
/home/terry/code/lem/src/commands/file.lisp:395:(define-command format-current-buffer () ()
/home/terry/code/lem/src/commands/file.lisp:426:(define-command find-history-file () ()
/home/terry/code/lem/src/commands/word.lisp:84:(define-command (forward-word (:advice-classes movable-advice)) (n) (:universal)
/home/terry/code/lem/src/commands/word.lisp:88:(define-command (previous-word (:advice-classes movable-advice)) (n) (:universal)
/home/terry/code/lem/src/commands/word.lisp:92:(define-command (delete-word (:advice-classes editable-advice)) (n) (:universal)
/home/terry/code/lem/src/commands/word.lisp:106:(define-command (backward-delete-word (:advice-classes editable-advice)) (n) (:universal)
/home/terry/code/lem/src/commands/word.lisp:137:(define-command downcase-region (start end) (:region)
/home/terry/code/lem/src/commands/word.lisp:141:(define-command uppercase-region (start end) (:region)
/home/terry/code/lem/src/commands/word.lisp:162:(define-command (capitalize-word (:advice-classes editable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/word.lisp:166:(define-command (lowercase-word (:advice-classes editable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/word.lisp:170:(define-command (uppercase-word (:advice-classes editable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/word.lisp:174:(define-command (forward-paragraph (:advice-classes movable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/word.lisp:187:(define-command (backward-paragraph (:advice-classes movable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/word.lisp:191:(define-command (kill-paragraph (:advice-classes editable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/word.lisp:207:(define-command count-words () ()
/home/terry/code/lem/src/commands/s-expression.lisp:30:(define-command (forward-sexp (:advice-classes movable-advice)) (&optional (n 1) no-errors) (:universal)
/home/terry/code/lem/src/commands/s-expression.lisp:41:(define-command (backward-sexp (:advice-classes movable-advice)) (&optional (n 1) no-errors) (:universal)
/home/terry/code/lem/src/commands/s-expression.lisp:45:(define-command (forward-list (:advice-classes movable-advice)) (&optional (n 1) no-errors) (:universal)
/home/terry/code/lem/src/commands/s-expression.lisp:49:(define-command (backward-list (:advice-classes movable-advice)) (&optional (n 1) no-errors) (:universal)
/home/terry/code/lem/src/commands/s-expression.lisp:53:(define-command (down-list (:advice-classes movable-advice)) (&optional (n 1) no-errors) (:universal)
/home/terry/code/lem/src/commands/s-expression.lisp:57:(define-command (up-list (:advice-classes movable-advice)) (&optional (n 1) no-errors) (:universal)
/home/terry/code/lem/src/commands/s-expression.lisp:62:(define-command mark-sexp () ()
/home/terry/code/lem/src/commands/s-expression.lisp:72:(define-command (kill-sexp (:advice-classes editable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/s-expression.lisp:81:(define-command (transpose-sexps (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/commands/s-expression.lisp:104:(define-command (kill-around-form (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/commands/help.lisp:14:(define-command describe-key () ()
/home/terry/code/lem/src/commands/help.lisp:43:(define-command describe-bindings () ()
/home/terry/code/lem/src/commands/help.lisp:65:(define-command list-modes () ()
/home/terry/code/lem/src/commands/help.lisp:86:(define-command describe-mode () ()
/home/terry/code/lem/src/commands/help.lisp:112:(define-command apropos-command () ()
/home/terry/code/lem/src/commands/help.lisp:123:(define-command lem-version () ()
/home/terry/code/lem/src/commands/help.lisp:128:(define-command help () ()
/home/terry/code/lem/src/commands/move.lisp:66:(define-command (next-line (:advice-classes movable-advice)) (&optional n) (:universal)
/home/terry/code/lem/src/commands/move.lisp:73:(define-command (next-logical-line (:advice-classes movable-advice)) (&optional n) (:universal)
/home/terry/code/lem/src/commands/move.lisp:80:(define-command (previous-line (:advice-classes movable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/move.lisp:84:(define-command (previous-logical-line (:advice-classes movable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/move.lisp:88:(define-command (forward-char (:advice-classes movable-advice))
/home/terry/code/lem/src/commands/move.lisp:94:(define-command (backward-char (:advice-classes movable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/move.lisp:99:(define-command (move-to-beginning-of-buffer (:advice-classes jump-cursor-advice)) () ()
/home/terry/code/lem/src/commands/move.lisp:104:(define-command (move-to-end-of-buffer (:advice-classes jump-cursor-advice)) () ()
/home/terry/code/lem/src/commands/move.lisp:109:(define-command (move-to-beginning-of-line (:advice-classes movable-advice)) () ()
/home/terry/code/lem/src/commands/move.lisp:125:(define-command (move-to-beginning-of-logical-line (:advice-classes movable-advice)) () ()
/home/terry/code/lem/src/commands/move.lisp:129:(define-command (move-to-end-of-line (:advice-classes movable-advice)) () ()
/home/terry/code/lem/src/commands/move.lisp:135:(define-command (move-to-end-of-logical-line (:advice-classes movable-advice)) () ()
/home/terry/code/lem/src/commands/move.lisp:139:(define-command (next-page (:advice-classes movable-advice)) (&optional n) (:universal-nil)
/home/terry/code/lem/src/commands/move.lisp:147:(define-command (previous-page (:advice-classes movable-advice)) (&optional n) (:universal-nil)
/home/terry/code/lem/src/commands/move.lisp:155:(define-command (next-page-char (:advice-classes movable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/move.lisp:165:(define-command (previous-page-char (:advice-classes movable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/commands/move.lisp:169:(define-command (goto-line (:advice-classes jump-cursor-advice)) (n) ((:number "Line to GOTO: "))
/home/terry/code/lem/src/commands/multiple-cursors.lisp:10:(define-command add-cursors-to-next-line () ()
/home/terry/code/lem/src/commands/buffer.lisp:17:(define-command indent-current-buffer () ()
/home/terry/code/lem/src/commands/buffer.lisp:21:(define-command toggle-read-only () ()
/home/terry/code/lem/src/commands/buffer.lisp:29:(define-command rename-buffer (name) ((:string "Rename buffer: "))
/home/terry/code/lem/src/commands/buffer.lisp:33:(define-command unmark-buffer () ()
/home/terry/code/lem/src/commands/other.lisp:24:(define-command nop-command () ()
/home/terry/code/lem/src/commands/other.lisp:27:(define-command undefined-key () ()
/home/terry/code/lem/src/commands/other.lisp:31:(define-command keyboard-quit () ()
/home/terry/code/lem/src/commands/other.lisp:35:(define-command escape () ()
/home/terry/code/lem/src/commands/other.lisp:39:(define-command exit-lem (&optional (ask t)) ()
/home/terry/code/lem/src/commands/other.lisp:52:(define-command quick-exit () ()
/home/terry/code/lem/src/commands/other.lisp:57:(define-command execute-command (arg) (:universal-nil)
/home/terry/code/lem/src/commands/other.lisp:76:(define-command show-context-menu () ()
/home/terry/code/lem/src/commands/other.lisp:82:(define-command load-library (name)
/home/terry/code/lem/src/commands/frame.lisp:8:(define-command toggle-frame-fullscreen () ()
/home/terry/code/lem/src/commands/frame.lisp:12:(define-command maximize-frame () ()
/home/terry/code/lem/src/commands/frame.lisp:16:(define-command minimize-frame () ()
/home/terry/code/lem/src/commands/mark.lisp:15:(define-command mark-set () ()
/home/terry/code/lem/src/commands/mark.lisp:21:(define-command exchange-point-mark () ()
/home/terry/code/lem/src/commands/mark.lisp:29:(define-command (mark-set-whole-buffer (:advice-classes jump-cursor-advice)) () ()
/home/terry/code/lem/src/commands/process.lisp:12:(define-command filter-buffer (cmd) ((:string "Filter buffer: "))
/home/terry/code/lem/src/commands/process.lisp:45:(define-command pipe-command (str) ((:string "Pipe command: "))
/home/terry/code/lem/src/commands/font.lisp:12:(define-command font-size-increase () ()
/home/terry/code/lem/src/commands/font.lisp:16:(define-command font-size-decrease () ()
/home/terry/code/lem/src/commands/font.lisp:20:(define-command font-size-set (size) ((:number "Size: "))
/home/terry/code/lem/src/commands/project.lisp:139:(define-command project-find-file (arg) (:universal)
/home/terry/code/lem/src/commands/project.lisp:156:(define-command project-root () ()
/home/terry/code/lem/src/commands/project.lisp:163:(define-command project-root-directory (arg) (:universal)
/home/terry/code/lem/src/commands/project.lisp:223:(define-command project-kill-buffers () ()
/home/terry/code/lem/src/commands/project.lisp:273:(define-command project-save () ()
/home/terry/code/lem/src/commands/project.lisp:277:(define-command project-save-prompt () ()
/home/terry/code/lem/src/commands/project.lisp:281:(define-command project-unsave () ()
/home/terry/code/lem/src/commands/project.lisp:299:(define-command project-switch () ()
/home/terry/code/lem/src/ui/theme-list.lisp:9:(define-command color-theme-selector-select () ()
/home/terry/code/lem/src/ui/theme-list.lisp:15:(define-command list-color-themes () ()
/home/terry/code/lem/src/internal-packages.lisp:420:   :define-command)
/home/terry/code/lem/src/typeout.lisp:98:(define-command dismiss-typeout-window () ()
/home/terry/code/lem/src/typeout.lisp:114:(define-command next-page-or-dismiss-typeout-window () ()
/home/terry/code/lem/src/mode.lisp:155:       (define-command (,major-mode (:class ,command-class-name)) () ()
/home/terry/code/lem/src/mode.lisp:209:       (define-command (,minor-mode (:class ,command-class-name)) (&optional (arg nil arg-p)) (:universal)
/home/terry/code/lem/src/mode.lisp:270:         (define-command (,mode (:class ,command-class-name)) () ()
/home/terry/code/lem/src/ext/gtags.lisp:128:(define-command gtags-definition-list () ()
/home/terry/code/lem/src/ext/link.lisp:206:(define-command link-open (&optional (point (current-point))) ()
/home/terry/code/lem/src/ext/abbrev.lisp:69:(define-command abbrev-with-pop-up-window () ()
/home/terry/code/lem/src/ext/abbrev.lisp:87:(define-command abbrev () ()
/home/terry/code/lem/src/ext/prompt-window.lisp:123:(define-command prompt-quit () ()
/home/terry/code/lem/src/ext/prompt-window.lisp:126:(define-command prompt-execute () ()
/home/terry/code/lem/src/ext/prompt-window.lisp:136:(define-command prompt-completion () ()
/home/terry/code/lem/src/ext/prompt-window.lisp:159:(define-command prompt-previous-history () ()
/home/terry/code/lem/src/ext/prompt-window.lisp:164:(define-command prompt-next-history () ()
/home/terry/code/lem/src/ext/filer.lisp:167:(define-command filer () ()
/home/terry/code/lem/src/ext/filer.lisp:174:(define-command filer-directory () ()
/home/terry/code/lem/src/ext/filer.lisp:181:(define-command filer-at-directory () ()
/home/terry/code/lem/src/ext/filer.lisp:191:(define-command filer-select () ()
/home/terry/code/lem/src/ext/rectangle.lisp:27:(define-command start-rectangle-mark-mode () ()
/home/terry/code/lem/src/ext/rectangle.lisp:34:(define-command rectangle-end () ()
/home/terry/code/lem/src/ext/rectangle.lisp:38:(define-command rectangle-self-insert () ()
/home/terry/code/lem/src/ext/rectangle.lisp:57:(define-command rectangle-copy () ()
/home/terry/code/lem/src/ext/rectangle.lisp:69:(define-command rectangle-kill () ()
/home/terry/code/lem/src/ext/rectangle.lisp:83:(define-command rectangle-open () ()
/home/terry/code/lem/src/ext/rectangle.lisp:112:(define-command rectangle-string () ()
/home/terry/code/lem/src/ext/rectangle.lisp:119:(define-command rectangle-exchange-point-mark () ()
/home/terry/code/lem/src/ext/rectangle.lisp:129:       (define-command ,rectangle-command-name (arg) (:universal)
/home/terry/code/lem/src/ext/multi-column-list.lisp:36:(define-command multi-column-list/default () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:44:(define-command multi-column-list/delete-previous-char () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:53:(define-command multi-column-list/quit () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:56:(define-command multi-column-list/down () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:59:(define-command multi-column-list/up () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:62:(define-command multi-column-list/first () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:65:(define-command multi-column-list/last () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:68:(define-command multi-column-list/select () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:71:(define-command multi-column-list/check-and-down () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:75:(define-command multi-column-list/up-and-check () ()
/home/terry/code/lem/src/ext/multi-column-list.lisp:79:(define-command multi-column-list/delete-items () ()
/home/terry/code/lem/src/ext/context-menu.lisp:76:(define-command test-context-menu () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:394:(define-command directory-mode-update-buffer () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:397:(define-command directory-mode-up-directory () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:412:(define-command directory-mode-find-file () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:415:(define-command directory-mode-read-file () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:418:(define-command directory-mode-find-file-next-window () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:426:(define-command directory-mode-next-line (p) (:universal)
/home/terry/code/lem/src/ext/directory-mode.lisp:429:(define-command directory-mode-previous-line (p) (:universal)
/home/terry/code/lem/src/ext/directory-mode.lisp:432:(define-command directory-mode-mark-and-next-line () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:436:(define-command directory-mode-unmark-and-next-line () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:440:(define-command directory-mode-unmark-and-previous-line () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:444:(define-command directory-mode-toggle-marks () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:448:(define-command directory-mode-unmark-all () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:451:(define-command directory-mode-mark-regexp (regex &optional arg) ((:string "Regex: ") :universal-nil)
/home/terry/code/lem/src/ext/directory-mode.lisp:461:(define-command directory-mode-mark-directories (&optional arg) (:universal-nil)
/home/terry/code/lem/src/ext/directory-mode.lisp:472:(define-command directory-mode-mark-links (&optional arg) (:universal-nil)
/home/terry/code/lem/src/ext/directory-mode.lisp:483:(define-command directory-mode-mark-suffix (suffix &optional arg) ((:string "Suffix: ") :universal-nil)
/home/terry/code/lem/src/ext/directory-mode.lisp:497:(define-command directory-mode-mark-extension (extension &optional arg) ((:string "Extension: ") :universal-nil)
/home/terry/code/lem/src/ext/directory-mode.lisp:507:(define-command directory-mode-next-mark (n) (:universal)
/home/terry/code/lem/src/ext/directory-mode.lisp:523:(define-command directory-mode-previous-mark (n) (:universal)
/home/terry/code/lem/src/ext/directory-mode.lisp:548:(define-command directory-mode-query-replace () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:551:(define-command directory-mode-query-replace-regexp () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:554:(define-command directory-mode-query-replace-symbol () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:557:(define-command directory-mode-delete-files () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:570:(define-command directory-mode-copy-files () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:576:(define-command directory-mode-rename-files () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:610:(define-command directory-mode-rename-file () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:630:(define-command directory-mode-sort-files () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:656:(define-command make-directory (filename) ((:new-file "Make directory: "))
/home/terry/code/lem/src/ext/directory-mode.lisp:661:(define-command find-file-directory () ()
/home/terry/code/lem/src/ext/directory-mode.lisp:675:(define-command directory-mode-kill-lines () ()
/home/terry/code/lem/src/ext/isearch.lisp:225:(define-command isearch-forward (&optional prompt) ()
/home/terry/code/lem/src/ext/isearch.lisp:233:(define-command isearch-backward (&optional prompt) ()
/home/terry/code/lem/src/ext/isearch.lisp:241:(define-command isearch-forward-regexp (&optional prompt) ()
/home/terry/code/lem/src/ext/isearch.lisp:248:(define-command isearch-backward-regexp (&optional prompt) ()
/home/terry/code/lem/src/ext/isearch.lisp:255:(define-command isearch-forward-symbol (&optional prompt) ()
/home/terry/code/lem/src/ext/isearch.lisp:262:(define-command isearch-backward-symbol (&optional prompt) ()
/home/terry/code/lem/src/ext/isearch.lisp:269:(define-command isearch-forward-symbol-at-point () ()
/home/terry/code/lem/src/ext/isearch.lisp:299:(define-command isearch-abort () ()
/home/terry/code/lem/src/ext/isearch.lisp:305:(define-command isearch-delete-char () ()
/home/terry/code/lem/src/ext/isearch.lisp:314:(define-command isearch-raw-insert () ()
/home/terry/code/lem/src/ext/isearch.lisp:345:(define-command isearch-finish () ()
/home/terry/code/lem/src/ext/isearch.lisp:353:(define-command isearch-next () ()
/home/terry/code/lem/src/ext/isearch.lisp:375:(define-command isearch-prev () ()
/home/terry/code/lem/src/ext/isearch.lisp:397:(define-command isearch-yank () ()
/home/terry/code/lem/src/ext/isearch.lisp:414:(define-command isearch-self-insert () ()
/home/terry/code/lem/src/ext/isearch.lisp:421:(define-command isearch-replace-highlight () ()
/home/terry/code/lem/src/ext/isearch.lisp:457:(define-command isearch-next-highlight (n) (:universal)
/home/terry/code/lem/src/ext/isearch.lisp:462:(define-command isearch-prev-highlight (n) (:universal)
/home/terry/code/lem/src/ext/isearch.lisp:465:(define-command isearch-toggle-highlighting () ()
/home/terry/code/lem/src/ext/isearch.lisp:472:(define-command isearch-add-cursor-to-next-match () ()
/home/terry/code/lem/src/ext/isearch.lisp:565:(define-command query-replace (before after)
/home/terry/code/lem/src/ext/isearch.lisp:573:(define-command query-replace-regexp (before after)
/home/terry/code/lem/src/ext/isearch.lisp:581:(define-command query-replace-symbol (before after)
/home/terry/code/lem/src/ext/tabbar.lisp:114:(define-command toggle-tabbar () ()
/home/terry/code/lem/src/ext/tabbar.lisp:121:(define-command tabbar-next (n) (:universal)
/home/terry/code/lem/src/ext/tabbar.lisp:131:(define-command tabbar-prev (n) (:universal)
/home/terry/code/lem/src/ext/universal-argument.lisp:71:(define-command universal-argument () ()
/home/terry/code/lem/src/ext/universal-argument.lisp:75:(define-command universal-argument-default () ()
/home/terry/code/lem/src/ext/universal-argument.lisp:85:(define-command universal-argument-abort () ()
/home/terry/code/lem/src/ext/universal-argument.lisp:89:(define-command universal-argument-repeat () ()
/home/terry/code/lem/src/ext/universal-argument.lisp:95:(define-command universal-argument-minus () ()
/home/terry/code/lem/src/ext/universal-argument.lisp:109:  `(define-command ,(alexandria:symbolicate (format nil "UNIVERSAL-ARGUMENT-~D" n)) () ()
/home/terry/code/lem/src/ext/showparen.lisp:69:(define-command toggle-show-paren () ()
/home/terry/code/lem/src/ext/completion-mode.lisp:181:(define-command completion-self-insert () ()
/home/terry/code/lem/src/ext/completion-mode.lisp:188:(define-command completion-delete-previous-char (n) (:universal)
/home/terry/code/lem/src/ext/completion-mode.lisp:192:(define-command completion-backward-delete-word (n) (:universal)
/home/terry/code/lem/src/ext/completion-mode.lisp:196:(define-command completion-next-line () ()
/home/terry/code/lem/src/ext/completion-mode.lisp:200:(define-command completion-previous-line () ()
/home/terry/code/lem/src/ext/completion-mode.lisp:204:(define-command completion-end-of-buffer () ()
/home/terry/code/lem/src/ext/completion-mode.lisp:208:(define-command completion-beginning-of-buffer () ()
/home/terry/code/lem/src/ext/completion-mode.lisp:212:(define-command completion-select () ()
/home/terry/code/lem/src/ext/completion-mode.lisp:215:(define-command completion-insert-space-and-cancel () ()
/home/terry/code/lem/src/ext/completion-mode.lisp:266:(define-command completion-narrowing-down-or-next-line () ()
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:343:(define-command (toggle-frame-multiplexer (:advice-classes frame-multiplexer-advice)) () ()
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:347:(define-command (frame-multiplexer-normalize-ids (:advice-classes frame-multiplexer-advice))
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:368:(define-command (frame-multiplexer-create-with-new-buffer-list
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:381:(define-command (frame-multiplexer-create-with-previous-buffer
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:398:(define-command (frame-multiplexer-delete (:advice-classes frame-multiplexer-advice))
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:416:(define-command (frame-multiplexer-prev (:advice-classes frame-multiplexer-advice))
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:429:(define-command (frame-multiplexer-next (:advice-classes frame-multiplexer-advice))
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:442:(define-command (frame-multiplexer-switch (:advice-classes frame-multiplexer-advice))
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:458:             `(define-command (,command-name (:advice-classes frame-multiplexer-advice))
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:472:(define-command (frame-multiplexer-recent (:advice-classes frame-multiplexer-advice))
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:494:(define-command (frame-multiplexer-rename (:advice-classes frame-multiplexer-advice))
/home/terry/code/lem/src/ext/frame-multiplexer.lisp:520:(define-command frame-multiplexer-test () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:134:(define-command listener-return () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:173:(define-command listener-previous-startswith-input () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:192:(define-command listener-next-startswith-input () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:214:(define-command listener-previous-input () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:221:(define-command listener-next-input () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:229:(define-command listener-previous-matching-input (regexp)
/home/terry/code/lem/src/ext/listener-mode.lisp:246:(define-command listener-clear-buffer () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:249:(define-command listener-clear-input () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:320:(define-command listener-isearch-history-previous () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:331:(define-command listener-isearch-history-next () ()
/home/terry/code/lem/src/ext/listener-mode.lisp:342:(define-command listener-isearch-history () ()
/home/terry/code/lem/src/ext/detective.lisp:288:(define-command detective-next () ()
/home/terry/code/lem/src/ext/detective.lisp:293:(define-command detective-previous () ()
/home/terry/code/lem/src/ext/detective.lisp:298:(define-command detective-function () ()
/home/terry/code/lem/src/ext/detective.lisp:304:(define-command detective-macro () ()
/home/terry/code/lem/src/ext/detective.lisp:310:(define-command detective-class () ()
/home/terry/code/lem/src/ext/detective.lisp:316:(define-command detective-package () ()
/home/terry/code/lem/src/ext/detective.lisp:322:(define-command detective-variable () ()
/home/terry/code/lem/src/ext/detective.lisp:328:(define-command detective-all () ()
/home/terry/code/lem/src/ext/peek-source.lisp:207:(define-command peek-source-select () ()
/home/terry/code/lem/src/ext/peek-source.lisp:215:(define-command peek-source-next () ()
/home/terry/code/lem/src/ext/peek-source.lisp:218:(define-command peek-source-previous () ()
/home/terry/code/lem/src/ext/peek-source.lisp:221:(define-command peek-source-quit () ()
/home/terry/code/lem/src/ext/auto-save.lisp:70:(define-command toggle-auto-save () ()
/home/terry/code/lem/src/ext/deepl.lisp:50:(define-command deepl-translate-region (start end &optional is-replace) (:region :universal-nil)
/home/terry/code/lem/src/ext/thingatp.lisp:31:(define-command open-at-point () ()
/home/terry/code/lem/src/ext/language-mode.lisp:102:(define-command (beginning-of-defun (:advice-classes movable-advice)) (n) (:universal)
/home/terry/code/lem/src/ext/language-mode.lisp:107:(define-command (end-of-defun (:advice-classes movable-advice)) (n) (:universal)
/home/terry/code/lem/src/ext/language-mode.lisp:114:(define-command (indent (:advice-classes editable-advice)) (&optional (n 1)) (:universal)
/home/terry/code/lem/src/ext/language-mode.lisp:126:(define-command (newline-and-indent (:advice-classes editable-advice)) (n) (:universal)
/home/terry/code/lem/src/ext/language-mode.lisp:131:(define-command indent-region (start end) (:region)
/home/terry/code/lem/src/ext/language-mode.lisp:152:(define-command (comment-or-uncomment-region (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/ext/language-mode.lisp:178:(define-command (comment-region (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/ext/language-mode.lisp:206:(define-command (uncomment-region (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/ext/language-mode.lisp:384:(define-command find-definitions (&optional (point (current-point))) ()
/home/terry/code/lem/src/ext/language-mode.lisp:421:(define-command find-references () ()
/home/terry/code/lem/src/ext/language-mode.lisp:444:(define-command pop-definition-stack () ()
/home/terry/code/lem/src/ext/language-mode.lisp:458:(define-command complete-symbol () ()
/home/terry/code/lem/src/ext/language-mode.lisp:462:(define-command indent-line-and-complete-symbol () ()
/home/terry/code/lem/src/ext/language-mode.lisp:474:(define-command (insert-\(\)-or-wrap (:advice-classes editable-advice)) () ()
/home/terry/code/lem/src/ext/language-mode.lisp:508:(define-command (move-over-\)-or-wrap (:advice-classes movable-advice editable-advice)) () ()
/home/terry/code/lem/src/ext/grep.lisp:79:(define-command grep (query &optional (directory (buffer-directory)))
/home/terry/code/lem/src/ext/grep.lisp:108:(define-command project-grep () ()
/home/terry/code/lem/src/ext/grep.lisp:116:(define-command grep-move-to-content-start () ()
/home/terry/code/lem/src/ext/grep.lisp:128:(define-command grep-help () ()
/home/terry/code/lem/src/ext/kbdmacro.lisp:16:(define-command kbdmacro-start () ()
/home/terry/code/lem/src/ext/kbdmacro.lisp:24:(define-command kbdmacro-end () ()
/home/terry/code/lem/src/ext/kbdmacro.lisp:32:(define-command kbdmacro-execute (n) (:universal)
/home/terry/code/lem/src/ext/kbdmacro.lisp:46:(define-command apply-macro-to-region-lines (start-point end-point) (:region)
/home/terry/code/lem/src/ext/line-numbers.lisp:46:(define-command toggle-line-numbers (&optional relative) (:universal-nil)
/home/terry/code/lem/src/ext/go-back.lisp:56:(define-command select-go-back () ()
/home/terry/code/lem/src/ext/go-back.lisp:107:(define-command go-back-global (n) (:universal)
/home/terry/code/lem/src/ext/go-back.lisp:110:(define-command go-back (n) (:universal)
/home/terry/code/lem/src/ext/list-buffers.lisp:26:(define-command list-buffers () ()
/home/terry/code/lem/src/mouse.lisp:347:(define-command <mouse-event> () ()
/home/terry/code/lem/src/mouse.lisp:350:(define-command <mouse-motion-event> () ()
/home/terry/code/lem/src/site-init.lisp:72:(define-command site-init-add-dependency (symbols)
/home/terry/code/lem/src/site-init.lisp:86:(define-command site-init-remove-dependency (symbols) ((:string "Package:"))
/home/terry/code/lem/src/defcommand.lisp:11:    "Parse arg descriptors given to define-command.
/home/terry/code/lem/src/defcommand.lisp:31:                                            (editor-warning "define-command: Deprecated expression (~A) is used for arg-descriptor" arg-descriptor)
/home/terry/code/lem/src/defcommand.lisp:111:(defmacro define-command (name-and-options params (&rest arg-descriptors) &body body)
/home/terry/code/lem/src/defcommand.lisp:116:(define-command write-hello () ()
/home/terry/code/lem/src/defcommand.lisp:123:(define-command write-hellos (n) (:universal)
/home/terry/code/lem/src/defcommand.lisp:193:(define-command (foo-1 (:advice-classes foo-advice)) (p) ("p")
/home/terry/code/lem/src/defcommand.lisp:196:(define-command (foo-2 (:advice-classes foo-advice)) (s) ("sInput: ")
/home/terry/code/lem/extensions/documentation-mode/documentation-mode.lisp:19:(define-command documentation-select () ()
/home/terry/code/lem/extensions/documentation-mode/documentation-mode.lisp:23:(define-command documentation-describe-bindings () ()
/home/terry/code/lem/extensions/elisp-mode/elisp-mode.lisp:217:(define-command elisp-connect () ()
/home/terry/code/lem/extensions/elisp-mode/run-elisp.lisp:78:(define-command elisp-eval-region (start end) (:region)
/home/terry/code/lem/extensions/elisp-mode/run-elisp.lisp:85:(define-command elisp-eval-defun () ()
/home/terry/code/lem/extensions/elisp-mode/run-elisp.lisp:97:(define-command elisp-load-file (filename)
/home/terry/code/lem/extensions/elisp-mode/run-elisp.lisp:112:(define-command run-elisp () ()
/home/terry/code/lem/extensions/elixir-mode/run-elixir.lisp:75:(define-command elixir-eval-region (start end) (:region)
/home/terry/code/lem/extensions/elixir-mode/run-elixir.lisp:80:(define-command run-elixir () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:270:(define-command lsp-sync-buffer () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:766:(define-command lsp-document-diagnostics () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:845:(define-command lsp-hover () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1063:(define-command lsp-signature-help () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1167:(define-command lsp-type-definition () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1192:(define-command lsp-implementation () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1320:(define-command lsp-document-highlight () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1556:(define-command lsp-document-symbol () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1634:(define-command lsp-code-action () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1661:(define-command lsp-organize-imports () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1693:(define-command lsp-document-format () ()
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1722:(define-command lsp-document-range-format (start end) (:region)
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1775:(define-command lsp-rename (new-name) ((:string "New name: "))
/home/terry/code/lem/extensions/lsp-mode/lsp-mode.lisp:1780:(define-command lsp-restart-server () ()
/home/terry/code/lem/extensions/vi-mode/commands/utils.lisp:105:  `(define-command (,name (:advice-classes vi-motion)
/home/terry/code/lem/extensions/vi-mode/commands/utils.lisp:246:  `(define-command (,name (:advice-classes vi-operator)
/home/terry/code/lem/extensions/vi-mode/commands/utils.lisp:281:  `(define-command (,name (:advice-classes vi-text-object)) ,arg-list
/home/terry/code/lem/extensions/vi-mode/states.lisp:54:(define-command return-last-read-char () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:171:(define-command vi-move-to-beginning-of-line/universal-argument-0 () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:176:(define-command vi-forward-char (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:182:(define-command vi-backward-char (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:229:(define-command vi-forward-word-begin (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:257:(define-command vi-backward-word-begin (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:266:(define-command vi-forward-word-begin-broad (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:270:(define-command vi-backward-word-begin-broad (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:279:(define-command vi-backward-word-end (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:283:(define-command vi-backward-word-end-broad (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:287:(define-command vi-move-to-beginning-of-line () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:296:(define-command vi-move-to-end-of-line (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:300:(define-command vi-move-to-last-nonblank () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:322:(define-command vi-scroll-line-to-center (&optional n) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:326:(define-command vi-scroll-line-to-center-back-to-indentation (&optional n) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:332:(define-command vi-scroll-line-to-top (&optional n) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:336:(define-command vi-scroll-line-to-top-back-to-indentation (&optional n) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:342:(define-command vi-scroll-line-to-bottom (&optional n) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:346:(define-command vi-scroll-line-to-bottom-back-to-indentation (&optional n) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:352:(define-command vi-scroll-bottom-line-to-top (&optional n) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:357:(define-command vi-scroll-top-line-to-bottom (&optional n) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:365:(define-command vi-back-to-indentation () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:546:(define-command vi-paste-after (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:571:(define-command vi-paste-before (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:662:(define-command vi-swapcase-and-forward-char () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:669:(define-command vi-undo (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:672:(define-command vi-redo (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:688:(define-command vi-record-macro (register) ((if (key-recording-p)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:716:(define-command vi-execute-macro (n macro) (:universal (read-register))
/home/terry/code/lem/extensions/vi-mode/commands.lisp:733:(define-command vi-execute-last-recorded-macro (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:800:(define-command vi-search-forward () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:825:(define-command vi-search-backward () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:851:(define-command vi-search-next (n) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:856:(define-command vi-search-previous (n) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:861:(define-command vi-search-forward-symbol-at-point (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:875:(define-command vi-search-backward-symbol-at-point (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:915:(define-command vi-return (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:981:(define-command vi-write () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:984:(define-command vi-quit (&optional (ask t)) ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:989:(define-command vi-write-quit () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:993:(define-command vi-close (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:999:(define-command vi-end-insert () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1003:(define-command vi-insert () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1006:(define-command vi-insert-line () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1011:(define-command vi-append () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1018:(define-command vi-append-line () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1022:(define-command vi-open-below () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1029:(define-command vi-open-above () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1039:(define-command vi-jumps () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1044:(define-command vi-jump-back (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1048:(define-command vi-jump-next (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1056:(define-command vi-repeat (n) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1104:(define-command vi-normal () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1107:(define-command vi-keyboard-quit () ()
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1113:(define-command vi-window-move-left (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1117:(define-command vi-window-move-down (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1121:(define-command vi-window-move-up (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1125:(define-command vi-window-move-right (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1129:(define-command vi-window-split-horizontally (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1135:(define-command vi-window-split-vertically (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1141:(define-command vi-switch-to-buffer (&optional (filename nil)) (:universal-nil)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1147:(define-command vi-window-split-horizontally-new (&optional (n 1) (filename nil)) (:universal)
/home/terry/code/lem/extensions/vi-mode/commands.lisp:1153:(define-command vi-window-split-vertically-new (&optional (n 1) (filename nil)) (:universal)
/home/terry/code/lem/extensions/vi-mode/ex.lisp:23:(define-command vi-ex () ()
/home/terry/code/lem/extensions/vi-mode/visual.lisp:117:(define-command vi-visual-end () ()
/home/terry/code/lem/extensions/vi-mode/visual.lisp:136:(define-command vi-visual-char () ()
/home/terry/code/lem/extensions/vi-mode/visual.lisp:139:(define-command vi-visual-line () ()
/home/terry/code/lem/extensions/vi-mode/visual.lisp:142:(define-command vi-visual-block () ()
/home/terry/code/lem/extensions/vi-mode/visual.lisp:210:(define-command vi-visual-append () ()
/home/terry/code/lem/extensions/vi-mode/visual.lisp:227:(define-command vi-visual-insert () ()
/home/terry/code/lem/extensions/vi-mode/visual.lisp:236:(define-command vi-visual-swap-points () ()
/home/terry/code/lem/extensions/vi-mode/visual.lisp:241:(define-command vi-visual-opposite-side () ()
/home/terry/code/lem/extensions/erlang-mode/run-erlang.lisp:76:(define-command erlang-eval-region (start end) (:region)
/home/terry/code/lem/extensions/erlang-mode/run-erlang.lisp:81:(define-command run-erlang () ()
/home/terry/code/lem/extensions/scheme-mode/eval.lisp:55:(define-command scheme-kill-process () ()
/home/terry/code/lem/extensions/scheme-mode/repl.lisp:58:(define-command start-scheme-repl () ()
/home/terry/code/lem/extensions/scheme-mode/repl.lisp:68:(define-command scheme-switch-to-repl-buffer () ()
/home/terry/code/lem/extensions/scheme-mode/repl.lisp:74:(define-command scheme-eval-or-newline () ()
/home/terry/code/lem/extensions/scheme-mode/repl.lisp:100:(define-command scheme-eval-last-expression (p) (:universal-nil)
/home/terry/code/lem/extensions/scheme-mode/repl.lisp:124:(define-command scheme-eval-region (start end) (:region)
/home/terry/code/lem/extensions/scheme-mode/repl.lisp:140:(define-command scheme-load-file (filename)
/home/terry/code/lem/extensions/scheme-mode/repl.lisp:189:(define-command scheme-repl-interrupt () ()
/home/terry/code/lem/extensions/scheme-mode/repl.lisp:208:(define-command scheme-repl-shortcut (n) (:universal)
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:66:(define-command scheme-connection-list () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:281:;(define-command scheme-set-package (package-name) ((list (read-package-name)))
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:282:(define-command scheme-set-library (package-name) ((read-package-name))
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:298:(define-command scheme-interrupt () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:312:(define-command scheme-eval-string (string)
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:317:;;(define-command scheme-eval-defun () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:318:(define-command scheme-eval-define () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:333:(define-command scheme-eval-buffer (&optional (buffer (current-buffer))) ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:343:(define-command scheme-echo-arglist () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:395:(define-command scheme-autodoc-with-typeout () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:405:(define-command scheme-autodoc () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:409:(define-command scheme-insert-space-and-autodoc (n) (:universal)
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:494:(define-command scheme-remove-notes () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:498:(define-command scheme-compile-and-load-file () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:512:(define-command scheme-compile-region (start end) (:region)
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:527:;;(define-command scheme-compile-defun () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:528:(define-command scheme-compile-define () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:588:(define-command scheme-macroexpand () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:595:(define-command scheme-macroexpand-all () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:729:(define-command scheme-describe-symbol () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:778:(define-command scheme-slime-connect (hostname port &optional (start-repl t))
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:1047:;(define-command scheme-slime (&optional ask-impl) ("P")
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:1050:(define-command scheme-slime () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:1054:(define-command scheme-slime-quit () ()
/home/terry/code/lem/extensions/scheme-mode/swank-connection.lisp:1081:(define-command scheme-slime-restart () ()
/home/terry/code/lem/extensions/scheme-mode/scheme-mode.lisp:140:(define-command scheme-indent-sexp () ()
/home/terry/code/lem/extensions/scheme-mode/scheme-mode.lisp:145:(define-command scheme-scratch () ()
/home/terry/code/lem/extensions/terminal/terminal-mode.lisp:80:(define-command terminal (always-create-terminal-p) (:universal-nil)
/home/terry/code/lem/extensions/terminal/terminal-mode.lisp:92:(define-command terminal-input () ()
/home/terry/code/lem/extensions/terminal/terminal-mode.lisp:135:       (define-command ,name () ()
/home/terry/code/lem/extensions/terminal/terminal-mode.lisp:170:(define-command terminal-copy-mode-on () ()
/home/terry/code/lem/extensions/terminal/terminal-mode.lisp:173:(define-command terminal-copy-mode-off () ()
/home/terry/code/lem/extensions/terminal/terminal-mode.lisp:187:(define-command terminal-resize () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:67:(define-command paredit-forward (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:74:(define-command paredit-backward (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:147:(define-command paredit-insert-paren () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:150:(define-command paredit-insert-bracket () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:153:(define-command paredit-insert-brace () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:156:(define-command paredit-insert-doublequote () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:178:(define-command paredit-insert-vertical-line () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:187:(define-command paredit-backward-delete (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:245:(define-command paredit-forward-delete (&optional (n 1)) (:universal)
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:331:(define-command paredit-close-parenthesis () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:334:(define-command paredit-close-bracket () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:337:(define-command paredit-close-brace () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:340:(define-command paredit-kill () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:390:(define-command paredit-slurp () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:429:(define-command paredit-barf () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:462:(define-command paredit-splice () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:485:(define-command paredit-splice-backward () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:508:(define-command paredit-splice-forward () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:531:(define-command paredit-raise () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:608:(define-command paredit-wrap-round () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:611:(define-command paredit-meta-doublequote () ()
/home/terry/code/lem/extensions/paredit-mode/paredit-mode.lisp:614:(define-command paredit-vertical-line-wrap () ()
/home/terry/code/lem/extensions/rust-mode/rust-mode.lisp:148:(define-command indent-exp () ()
/home/terry/code/lem/extensions/python-mode/run-python.lisp:76:(define-command python-eval-region (start end) (:region)
/home/terry/code/lem/extensions/python-mode/run-python.lisp:81:(define-command run-python () ()
/home/terry/code/lem/extensions/markdown-mode/preview/preview.lisp:5:(define-command markdown-preview () ()
/home/terry/code/lem/extensions/markdown-mode/markdown-mode.lisp:46:(define-command markdown-insert-link () ()
/home/terry/code/lem/extensions/c-mode/c-mode.lisp:47:(define-command c-electric-brace () ()
/home/terry/code/lem/extensions/c-mode/c-mode.lisp:51:(define-command c-indent-exp () ()
/home/terry/code/lem/extensions/copilot/sign-in.lisp:43:(define-command copilot-signin () ()
/home/terry/code/lem/extensions/copilot/install.lisp:9:(define-command copilot-install-server () ()
/home/terry/code/lem/extensions/copilot/copilot.lisp:227:(define-command copilot-restart () ()
/home/terry/code/lem/extensions/copilot/copilot.lisp:397:(define-command copilot-complete () ()
/home/terry/code/lem/extensions/copilot/copilot.lisp:400:(define-command copilot-accept-suggestion () ()
/home/terry/code/lem/extensions/copilot/copilot.lisp:404:(define-command copilot-next-suggestion () ()
/home/terry/code/lem/extensions/copilot/copilot.lisp:408:(define-command copilot-previous-suggestion () ()
/home/terry/code/lem/extensions/copilot/test-commands.lisp:8:(define-command test/copilot-document () ()
/home/terry/code/lem/extensions/copilot/test-commands.lisp:16:(define-command test/copilot-log () ()
/home/terry/code/lem/extensions/asm-mode/asm-mode.lisp:64:(define-command asm-insert-tab () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:79:(define-command rebase-abort () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:86:(define-command rebase-continue () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:92:(define-command rebase-skip () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:107:(define-command rebase-mark-line-pick () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:110:(define-command rebase-mark-line-reword () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:113:(define-command rebase-mark-line-edit () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:116:(define-command rebase-mark-line-squash () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:119:(define-command rebase-mark-line-fixup () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:122:(define-command rebase-mark-line-exec () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:125:(define-command rebase-mark-line-break () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:128:(define-command rebase-mark-line-drop () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:131:(define-command rebase-mark-line-label () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:134:(define-command rebase-mark-line-reset () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:137:(define-command rebase-mark-line-merge () ()
/home/terry/code/lem/extensions/legit/legit-rebase.lisp:140:(define-command rebase-help () ()
/home/terry/code/lem/extensions/legit/legit.lisp:397:(define-command legit-stage-hunk () ()
/home/terry/code/lem/extensions/legit/legit.lisp:403:(define-command legit-unstage-hunk () ()
/home/terry/code/lem/extensions/legit/legit.lisp:409:(define-command legit-goto-next-hunk () ()
/home/terry/code/lem/extensions/legit/legit.lisp:419:(define-command legit-goto-previous-hunk () ()
/home/terry/code/lem/extensions/legit/legit.lisp:432:(define-command legit-jump-to-hunk () ()
/home/terry/code/lem/extensions/legit/legit.lisp:470:(define-command legit-commit () ()
/home/terry/code/lem/extensions/legit/legit.lisp:508:(define-command legit-status () ()
/home/terry/code/lem/extensions/legit/legit.lisp:651:(define-command legit () ()
/home/terry/code/lem/extensions/legit/legit.lisp:669:(define-command legit-branch-checkout () ()
/home/terry/code/lem/extensions/legit/legit.lisp:683:(define-command legit-branch-create () ()
/home/terry/code/lem/extensions/legit/legit.lisp:695:(define-command legit-pull () ()
/home/terry/code/lem/extensions/legit/legit.lisp:700:(define-command legit-push () ()
/home/terry/code/lem/extensions/legit/legit.lisp:707:(define-command legit-rebase-interactive () ()
/home/terry/code/lem/extensions/legit/legit.lisp:729:(define-command legit-next-header () ()
/home/terry/code/lem/extensions/legit/legit.lisp:733:(define-command legit-previous-header () ()
/home/terry/code/lem/extensions/legit/legit.lisp:737:(define-command legit-commits-log () ()
/home/terry/code/lem/extensions/legit/legit.lisp:779:(define-command legit-commits-log-next-page () ()
/home/terry/code/lem/extensions/legit/legit.lisp:792:(define-command legit-commits-log-previous-page () ()
/home/terry/code/lem/extensions/legit/legit.lisp:800:(define-command legit-commits-log-first-page () ()
/home/terry/code/lem/extensions/legit/legit.lisp:805:(define-command legit-commits-log-last-page () ()
/home/terry/code/lem/extensions/legit/legit.lisp:813:(define-command legit-stash-push () ()
/home/terry/code/lem/extensions/legit/legit.lisp:820:(define-command legit-stash-pop () ()
/home/terry/code/lem/extensions/legit/legit.lisp:828:(define-command legit-quit () ()
/home/terry/code/lem/extensions/legit/legit.lisp:835:(define-command legit-help () ()
/home/terry/code/lem/extensions/legit/legit.lisp:870:(define-command legit-logs-help () ()
/home/terry/code/lem/extensions/legit/legit-commit.lisp:87:(define-command commit-continue () ()
/home/terry/code/lem/extensions/legit/legit-commit.lisp:110:(define-command commit-abort () ()
/home/terry/code/lem/extensions/legit/legit-commit.lisp:116:(define-command commit-help () ()
/home/terry/code/lem/extensions/legit/peek-legit.lisp:369:(define-command peek-legit-select () ()
/home/terry/code/lem/extensions/legit/peek-legit.lisp:390:(define-command peek-legit-next () ()
/home/terry/code/lem/extensions/legit/peek-legit.lisp:396:(define-command peek-legit-next-header () ()
/home/terry/code/lem/extensions/legit/peek-legit.lisp:399:(define-command peek-legit-previous-header () ()
/home/terry/code/lem/extensions/legit/peek-legit.lisp:402:(define-command peek-legit-previous () ()
/home/terry/code/lem/extensions/legit/peek-legit.lisp:405:(define-command peek-legit-stage-file () ()
/home/terry/code/lem/extensions/legit/peek-legit.lisp:414:(define-command peek-legit-unstage-file () ()
/home/terry/code/lem/extensions/legit/peek-legit.lisp:423:(define-command peek-legit-discard-file () ()
/home/terry/code/lem/extensions/shell-mode/shell-mode.lisp:118:(define-command run-shell () ()
/home/terry/code/lem/extensions/lisp-mode/repl.lisp:133:(define-command lisp-repl-interrupt () ()
/home/terry/code/lem/extensions/lisp-mode/repl.lisp:325:(define-command start-lisp-repl (&optional (use-this-window nil)) (:universal-nil)
/home/terry/code/lem/extensions/lisp-mode/repl.lisp:329:(define-command lisp-switch-to-repl-buffer () ()
/home/terry/code/lem/extensions/lisp-mode/repl.lisp:345:(define-command lisp-repl-copy-down () ()
/home/terry/code/lem/extensions/lisp-mode/repl.lisp:513:(define-command backward-prompt () ()
/home/terry/code/lem/extensions/lisp-mode/repl.lisp:518:(define-command forward-prompt () ()
/home/terry/code/lem/extensions/lisp-mode/repl.lisp:551:(define-command lisp-repl-shortcut (n) (:universal)
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:382:(define-command lisp-disassemble () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:445:(define-command lisp-indent-sexp () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:468:(define-command lisp-set-package (package-name) ((read-package-name))
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:479:(define-command lisp-listen-in-current-package () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:497:(define-command lisp-current-directory () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:501:(define-command lisp-set-directory (&key directory) ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:509:(define-command lisp-interrupt () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:523:(define-command lisp-eval-string (string)
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:547:(define-command lisp-eval-defun () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:561:(define-command lisp-load-file (filename)
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:704:(define-command lisp-remove-notes () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:711:(define-command lisp-next-compilation-notes () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:714:(define-command lisp-previous-compilation-notes () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:717:(define-command lisp-compile-and-load-file () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:731:(define-command lisp-compile-region (start end) (:region)
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:746:(define-command lisp-compile-defun () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:755:(define-command lisp-eval-expression-in-repl () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:773:(define-command lisp-quickload (system-name)
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:887:(define-command lisp-describe-symbol () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:959:(define-command slime-connect (hostname port &optional (start-repl t))
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:1158:(define-command slime (&optional ask-command) (:universal-nil)
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:1173:(define-command slime-quit () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:1200:(define-command slime-restart () ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:1208:(define-command slime-self-connect (&optional (start-repl t)) ()
/home/terry/code/lem/extensions/lisp-mode/lisp-mode.lisp:1241:(define-command lisp-scratch () ()
/home/terry/code/lem/extensions/lisp-mode/ext/defstruct-to-defclass.lisp:5:(define-command lisp-defstruct-to-defclass () ()
/home/terry/code/lem/extensions/lisp-mode/ext/quickdocs.lisp:14:(define-command lisp-quickdocs-at-point  (point) ((current-point))
/home/terry/code/lem/extensions/lisp-mode/ext/exporter.lisp:71:(define-command lisp-add-export (symbol-name)
/home/terry/code/lem/extensions/lisp-mode/ext/eval.lisp:173:(define-command lisp-eval-at-point () ()
/home/terry/code/lem/extensions/lisp-mode/ext/eval.lisp:182:(define-command lisp-eval-interrupt-at-point () ()
/home/terry/code/lem/extensions/lisp-mode/ext/eval.lisp:200:(define-command lisp-eval-copy-down-to-repl () ()
/home/terry/code/lem/extensions/lisp-mode/ext/eval.lisp:204:(define-command lisp-eval-clear () ()
/home/terry/code/lem/extensions/lisp-mode/ext/eval.lisp:234:(define-command lisp-eval-last-expression-and-insert () ()
/home/terry/code/lem/extensions/lisp-mode/ext/eval.lisp:244:(define-command lisp-eval-region (start end) (:region)
/home/terry/code/lem/extensions/lisp-mode/ext/eval.lisp:251:(define-command lisp-eval-buffer () ()
/home/terry/code/lem/extensions/lisp-mode/ext/connection-list.lisp:33:(define-command lisp-connection-list () ()
/home/terry/code/lem/extensions/lisp-mode/ext/autodoc.lisp:48:(define-command lisp-autodoc () ()
/home/terry/code/lem/extensions/lisp-mode/ext/hyperspec.lisp:1014:(define-command hyperspec-at-point (point) ((current-point))
/home/terry/code/lem/extensions/lisp-mode/ext/hyperspec.lisp:1021:(define-command hyperspec-lookup () ()
/home/terry/code/lem/extensions/lisp-mode/ext/highlight.lisp:43:(define-command lisp-highlight () ()
/home/terry/code/lem/extensions/lisp-mode/ext/highlight.lisp:75:(define-command experimental/lisp-toggle-highlight () ()
/home/terry/code/lem/extensions/lisp-mode/ext/paren-coloring.lisp:104:(define-command toggle-paren-coloring () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:340:(define-command sldb-down (p) ((current-point))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:346:(define-command sldb-up (p) ((current-point))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:356:(define-command sldb-details-down () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:360:(define-command sldb-details-up () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:364:(define-command sldb-quit () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:372:(define-command sldb-continue () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:381:(define-command sldb-abort () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:402:(define-command sldb-restart-frame (frame-number)
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:421:(define-command sldb-invoke-restart-0 () () (sldb-invoke-restart 0))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:422:(define-command sldb-invoke-restart-1 () () (sldb-invoke-restart 1))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:423:(define-command sldb-invoke-restart-2 () () (sldb-invoke-restart 2))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:424:(define-command sldb-invoke-restart-3 () () (sldb-invoke-restart 3))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:425:(define-command sldb-invoke-restart-4 () () (sldb-invoke-restart 4))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:426:(define-command sldb-invoke-restart-5 () () (sldb-invoke-restart 5))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:427:(define-command sldb-invoke-restart-6 () () (sldb-invoke-restart 6))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:428:(define-command sldb-invoke-restart-7 () () (sldb-invoke-restart 7))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:429:(define-command sldb-invoke-restart-8 () () (sldb-invoke-restart 8))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:430:(define-command sldb-invoke-restart-9 () () (sldb-invoke-restart 9))
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:432:(define-command sldb-invoke-restart-by-name (restart-name)
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:446:(define-command sldb-show-frame-source (frame-number)
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:459:(define-command sldb-eval-in-frame (frame string package)
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:465:(define-command sldb-pprint-eval-in-frame (frame string package)
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:470:(define-command sldb-inspect-in-frame (string)
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:476:(define-command sldb-step () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:479:(define-command sldb-next () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:482:(define-command sldb-out () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:485:(define-command sldb-break-on-return (name)
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:491:(define-command sldb-inspect-condition () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:495:(define-command sldb-print-condition () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:508:(define-command sldb-recompile-in-frame-source () ()
/home/terry/code/lem/extensions/lisp-mode/ext/sldb.lisp:518:(define-command sldb-copy-down-to-repl () ()
/home/terry/code/lem/extensions/lisp-mode/ext/class-browser.lisp:10:(define-command lisp-browse-class-as-tree () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:192:(define-command (lisp-macrostep-quit (:advice-classes macrostep-advice)) () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:195:(define-command (lisp-macrostep-next (:advice-classes macrostep-advice)) () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:199:(define-command (lisp-macrostep-previous (:advice-classes macrostep-advice)) () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:203:(define-command (lisp-macrostep-expand-next (:advice-classes macrostep-advice)) () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:208:(define-command (lisp-macrostep-undo (:advice-classes macrostep-advice)) () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:216:(define-command lisp-macrostep-disable-help () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:219:(define-command lisp-macrostep-expand () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:259:(define-command lisp-macroexpand-in-place () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:269:(define-command lisp-macroexpand () ()
/home/terry/code/lem/extensions/lisp-mode/ext/macroexpand.lisp:273:(define-command lisp-macroexpand-all () ()
/home/terry/code/lem/extensions/lisp-mode/ext/test-runner.lisp:87:(define-command lisp-test-runner-run-current () ()
/home/terry/code/lem/extensions/lisp-mode/ext/test-runner.lisp:93:(define-command lisp-test-runner-run-buffer () ()
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:63:(define-command lisp-inspect (string &key (self-evaluation nil) (focus t))
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:167:(define-command lisp-inspector-pop () ()
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:175:(define-command lisp-inspector-next () ()
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:183:(define-command lisp-inspector-quit () ()
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:194:(define-command lisp-inspector-describe () ()
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:203:(define-command lisp-inspector-pprint (part)
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:207:(define-command lisp-inspector-eval (string)
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:211:(define-command lisp-inspector-history () ()
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:214:(define-command lisp-inspector-show-source (part)
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:219:(define-command lisp-inspector-reinspect () ()
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:225:(define-command lisp-inspector-toggle-verbose () ()
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:237:(define-command lisp-inspector-fetch-all () ()
/home/terry/code/lem/extensions/lisp-mode/ext/inspector.lisp:290:(define-command lisp-inspector-copy-down-to-repl () ()
/home/terry/code/lem/extensions/lisp-mode/ext/organize-imports.lisp:126:(define-command lisp-organize-imports (buffer) ((current-buffer))
/home/terry/code/lem/extensions/lisp-mode/ext/trace.lisp:21:(define-command lisp-trace-list () ()
/home/terry/code/lem/extensions/lisp-mode/ext/trace.lisp:44:(define-command lisp-toggle-trace (name)
/home/terry/code/lem/extensions/lisp-mode/v2/lsp-config.lisp:76:(define-command lisp/new-workspace () ()
/home/terry/code/lem/extensions/lisp-mode/apropos-mode.lisp:51:(define-command lisp-apropos (&optional arg) (:universal-nil)
/home/terry/code/lem/extensions/lisp-mode/apropos-mode.lisp:68:(define-command lisp-apropos-all () ()
/home/terry/code/lem/extensions/lisp-mode/apropos-mode.lisp:73:(define-command lisp-apropos-package (internal) (:universal-nil)
/home/terry/code/lem/extensions/lisp-mode/apropos-mode.lisp:107:(define-command lisp-search-symbol () ()
/home/terry/code/lem/extensions/lisp-mode/apropos-mode.lisp:115:(define-command lisp-search-asdf-definition () ()
/home/terry/code/lem/extensions/lisp-mode/ui-mode.lisp:23:(define-command lisp-ui-default-action () ()
/home/terry/code/lem/extensions/lisp-mode/ui-mode.lisp:27:(define-command lisp-ui-forward-button () ()
/home/terry/code/lem/extensions/js-mode/eslint.lisp:26:(define-command eslint () ()
/home/terry/code/lem/extensions/lem-dashboard/dashboard-items.lisp:99:(define-command dashboard-move-to-recent-projects () ()
/home/terry/code/lem/extensions/lem-dashboard/dashboard-items.lisp:136:(define-command dashboard-move-to-recent-files () ()
/home/terry/code/lem/extensions/lem-dashboard/default-dashboard.lisp:61:(define-command open-lem-docs () ()
/home/terry/code/lem/extensions/lem-dashboard/default-dashboard.lisp:64:(define-command open-lem-github () ()
/home/terry/code/lem/extensions/lem-dashboard/lem-dashboard.lisp:62:(define-command dashboard-open-selected-item () ()
/home/terry/code/lem/extensions/lem-dashboard/lem-dashboard.lisp:103:(define-command open-dashboard () ()
/home/terry/code/lem/extensions/go-mode/go-mode.lisp:141:(define-command go-electric-close (n) (:universal)
/home/terry/code/lem/extensions/go-mode/go-mode.lisp:145:(define-command godoc (command)
/home/terry/code/lem/extensions/go-mode/go-mode.lisp:220:(define-command godef-describe () ()
/home/terry/code/lem/extensions/go-mode/go-mode.lisp:285:(define-command goflymake (buffer)
/home/terry/code/lem/extensions/go-mode/go-mode.lisp:312:(define-command goflymake-message () ()
/home/terry/code/lem/extensions/go-mode/go-mode.lisp:320:(define-command go-remove-notes () ()
/home/terry/code/lem/extensions/dart-mode/dart-mode.lisp:185:(define-command dart-insert-indent (n) (:universal)
/home/terry/code/lem/STYLEGUIDE.md:60:Write thorough docstrings to interactive commands (`define-command`),
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/pkgdcl.lisp:14:   #:define-command
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/parse.lisp:353:(defmacro define-command (name args pre-help post-help &rest body)
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/parse.lisp:356:The `define-command' macro may be used to simultaneously define the
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/parse.lisp:359:following invocation of `define-command' on FOO results in:
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/parse.lisp:361:    (define-command foo (noun verb &spec +command-line-spec+ &aux scratch)
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/parse.lisp:374:    The docstring passed to `define-command' becomes the help text
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/parse.lisp:376:    argument to `define-command' is printed after the options.
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/parse.lisp:384::   The &BODY passed to `define-command' becomes the body of the FOO
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/README.md:48:The `define-command` macro may be used to simultaneously define the
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/README.md:51:following invocation of `define-command` on `FOO` results in:
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/README.md:53:    (define-command foo (noun verb &spec +command-line-spec+ &aux scratch)
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/README.md:67:    The docstring passed to `define-command` becomes the help text
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/README.md:69:    argument to `define-command` is printed after the options.
/home/terry/code/lem/.qlot/dists/quicklisp/software/command-line-arguments-20210807-git/README.md:77::   The `&body` passed to `define-command` becomes the body of the FOO
/home/terry/code/lem/frontends/sdl2/color-picker.lisp:349:(lem:define-command color-picker-quit () ()
/home/terry/code/lem/frontends/sdl2/color-picker.lisp:365:(lem:define-command test-color-picker () ()
/home/terry/code/lem/frontends/sdl2/image-buffer.lisp:130:(define-command image-zoom-in () ()
/home/terry/code/lem/frontends/sdl2/image-buffer.lisp:133:(define-command image-zoom-out () ()
/home/terry/code/lem/frontends/sdl2/image-buffer.lisp:136:(define-command image-zoom-reset () ()
/home/terry/code/lem/frontends/sdl2/image-buffer.lisp:140:(define-command image-fit-to-width () ()
/home/terry/code/lem/frontends/sdl2/image-buffer.lisp:144:(define-command image-fit-to-height () ()
/home/terry/code/lem/frontends/sdl2/image-buffer.lisp:148:(define-command image-fit-to-screen () ()
/home/terry/code/lem/frontends/sdl2/image-buffer.lisp:177:(define-command image-zoom-help () ()
/home/terry/code/lem/frontends/sdl2/tree.lisp:259:(define-command tree-view-scroll-right (n) (:universal)
/home/terry/code/lem/frontends/sdl2/tree.lisp:264:(define-command tree-view-scroll-left (n) (:universal)
/home/terry/code/lem/frontends/sdl2/tree.lisp:269:(define-command tree-view-scroll-horizontally-start () ()
/home/terry/code/lem/frontends/sdl2/tree.lisp:272:(define-command tree-view-scroll-down (n) (:universal)
/home/terry/code/lem/frontends/sdl2/tree.lisp:277:(define-command tree-view-scroll-up (n) (:universal)
/home/terry/code/lem/frontends/sdl2/tree.lisp:285:(define-command tree-view-scroll-pagedown () ()
/home/terry/code/lem/frontends/sdl2/tree.lisp:288:(define-command tree-view-scroll-pageup () ()
/home/terry/code/lem/frontends/sdl2/tree.lisp:291:(define-command tree-view-scroll-bottom () ()
/home/terry/code/lem/frontends/sdl2/tree.lisp:296:(define-command tree-view-scroll-top () ()

Grep finished with 765 matches found at Mon Jan  6 03:15:47
```




# bindings


```
M-x describe-bindings 

M-x documentation-describe-bindings


Move
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   next-line                           C-n, Down                         Move the cursor to next line.                                                                                                                                                                                           
   next-logical-line                                                     Move the cursor to the next logical line.                                                                                                                                                                               
   previous-line                       C-p, Up                           Move the cursor to the previous line.                                                                                                                                                                                   
   previous-logical-line                                                 Move the cursor to the previous logical line.                                                                                                                                                                           
   forward-char                        C-f, Right                        Move the cursor to the next character.                                                                                                                                                                                  
   backward-char                       C-b, Left                         Move the cursor to the previous character.                                                                                                                                                                              
   move-to-beginning-of-buffer         M-<, C-Home                       Move the cursor to the beginning of the buffer.                                                                                                                                                                         
   move-to-end-of-buffer               M->, C-End                        Move the cursor to the end of the buffer.                                                                                                                                                                               
   move-to-beginning-of-line           C-a, Home                         Move the cursor to the beginning of the line.                                                                                                                                                                           
   move-to-beginning-of-logical-line                                     Move the cursor to the beginning of the logical line.                                                                                                                                                                   
   move-to-end-of-line                 C-e, End                          Move the cursor to the end of the line.                                                                                                                                                                                 
   move-to-end-of-logical-line                                           Move the cursor to the end of the logical line.                                                                                                                                                                         
   next-page                           C-v, PageDown                     Move the cursor to the next page by one page.                                                                                                                                                                           
   previous-page                       M-v, PageUp                       Move the cursor to the previous page by one page.                                                                                                                                                                       
   next-page-char                      C-x ]                             Move the cursor to the next page character (^L).                                                                                                                                                                        
   previous-page-char                  C-x [                             Move the cursor to the previous page character (^L).                                                                                                                                                                    
   goto-line                           M-g                               Move the cursor to the specified line number.                                                                                                                                                                           

Edit
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   self-insert                                                           Processes the key entered.                                                                                                                                                                                              
   newline                             Return                            Insert a new line.                                                                                                                                                                                                      
   open-line                           C-o                               Insert a new line without moving the cursor position.                                                                                                                                                                   
   quoted-insert                       C-q                               Insert the next entered key (including control characters).                                                                                                                                                             
   delete-next-char                    C-d, Delete                       Delete the next character.                                                                                                                                                                                              
   delete-previous-char                C-h, Backspace                    Delete the previous character.                                                                                                                                                                                          
   copy-region                         M-w                               Copy the text of region.                                                                                                                                                                                                
   copy-region-to-clipboard                                              Copy the selected text to the clipboard.                                                                                                                                                                                
   kill-region                         C-w                               Kill the text of region.                                                                                                                                                                                                
   kill-region-to-clipboard                                              Kill the text of region and copy to the clipboard.                                                                                                                                                                      
   kill-line                           C-k                               Kill from the current cursor position to the end of the line.                                                                                                                                                           
   kill-whole-line                     C-Shift-Backspace                 If n is positive, kill n whole lines forward starting at the
beginning of the current line.  If n is 0, do nothing.  And if n
is negative, kill n lines above without deleting anything on the 
current line.                                                                                                                                                                                                                                                                                    
   yank                                C-y                               Paste the copied text.                                                                                                                                                                                                  
   yank-pop                            M-y                               Replaces the immediately pasted text with the next text in the killring.                                                                                                                                                
   yank-pop-next                                                         Replaces the immediately preceding yank-pop text with the text before the kill ring.                                                                                                                                    
   yank-to-clipboard                                                     Copy the text of the killring to the clipboard.                                                                                                                                                                         
   paste-from-clipboard                                                  Inserts text from the clipboard.                                                                                                                                                                                        
   entab-line                                                            Replaces the indent of the current line from space to tab.                                                                                                                                                              
   detab-line                                                            Replaces the indent of the current line from tab to space.                                                                                                                                                              
   delete-blank-lines                  C-x C-o                           Delete blank lines before and after the cursor.                                                                                                                                                                         
   just-one-space                      M-Space                           Combines consecutive whitespace before and after the cursor into one.                                                                                                                                                   
   delete-indentation                  M-^                               Merge the current line with the previous line.                                                                                                                                                                          
   transpose-characters                C-t                               Swaps the characters before and after the cursor.                                                                                                                                                                       
   undo                                C-\                               Undo.                                                                                                                                                                                                                   
   redo                                C-_, C-/                          Redo.                                                                                                                                                                                                                   
   delete-trailing-whitespace                                            Removes all end-of-line and end-of-buffer whitespace from the current buffer.                                                                                                                                           

Mark
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   mark-set                            C-@, C-Space                      Sets a mark at the current cursor position.                                                                                                                                                                             
   exchange-point-mark                 C-x C-x                           Exchange the current cursor position with the marked position.                                                                                                                                                          
   mark-set-whole-buffer               C-x h                             Select the whole buffer as a region.                                                                                                                                                                                    

Word
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   forward-word                        M-f, C-Right                      Move to cursor to next word.                                                                                                                                                                                            
   previous-word                       M-b, C-Left                       Move to cursor to previous word                                                                                                                                                                                         
   delete-word                         M-d, C-Delete                     Delete the next word.                                                                                                                                                                                                   
   backward-delete-word                M-C-h, M-Backspace, C-Backspace   Delete the previous word.                                                                                                                                                                                               
   downcase-region                     C-x C-l                           Replaces the selected region with a downcase.                                                                                                                                                                           
   uppercase-region                    C-x C-u                           Replaces the selected region with a uppercase.                                                                                                                                                                          
   capitalize-word                     M-c                               Replace the following word with capital-case.                                                                                                                                                                           
   lowercase-word                      M-l                               Replace the following word with lowercase.                                                                                                                                                                              
   uppercase-word                      M-u                               Replace the following word with uppercase.                                                                                                                                                                              
   forward-paragraph                   M-}                               Move cursor to forward paragraph.                                                                                                                                                                                       
   backward-paragraph                  M-{                               Move cursor to backward paragraph.                                                                                                                                                                                      
   kill-paragraph                      M-k                               Kill the forward paragraph.                                                                                                                                                                                             
   count-words                         M-=                               Count the number of lines/words/characters in the buffer.                                                                                                                                                               

S-Expression
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   forward-sexp                        M-C-f                             Move the cursor to the forward expression.                                                                                                                                                                              
   backward-sexp                       M-C-b                             Move the cursor to the backward expression.                                                                                                                                                                             
   forward-list                        M-C-n                             Move the cursor to the forward list.                                                                                                                                                                                    
   backward-list                       M-C-p                             Move the cursor to the backward list.                                                                                                                                                                                   
   down-list                           M-C-d                             Move the cursor to the inner expression.                                                                                                                                                                                
   up-list                             M-C-u                             Move the cursor to the outer expression.                                                                                                                                                                                
   mark-sexp                           M-C-@, M-C-Space                  Select the forward expression as a region.                                                                                                                                                                              
   kill-sexp                           M-C-k                             Kill the forward expression as a region.                                                                                                                                                                                
   transpose-sexps                     M-C-t                             Swaps the expression before and after the cursor.                                                                                                                                                                       

File
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   find-file                           C-x C-f                           Open the file.                                                                                                                                                                                                          
   find-file-recursively                                                 Open a file, from the list of all files present under the buffer's directory, recursively.                                                                                                                              
   read-file                           C-x C-r                           Open the file as a read-only.                                                                                                                                                                                           
   save-current-buffer                 C-x C-s                           Saves the current buffer text to a file                                                                                                                                                                                 
   write-file                          C-x C-w                           Saves the text in the current buffer to the specified file                                                                                                                                                              
   write-region-file                                                     Saves the region of text to the specified file                                                                                                                                                                          
   insert-file                         C-x Tab                           Inserts the contents of the file into the current buffer.                                                                                                                                                               
   save-some-buffers                   C-x s                             Save some files in the open buffer.                                                                                                                                                                                     
   revert-buffer                                                         Restores the buffer. Normally this command will cause the contents of the file to be reflected in the buffer.                                                                                                           
   change-directory                                                      Change directories associated with the buffer.                                                                                                                                                                          
   current-directory                                                     Display the directory of the active buffer.
With prefix argument INSERT, insert the directory of the active buffer at point.                                                                                                                                                                                                                 
   format-current-buffer                                                 Save changes and try to format the current buffer.

Supported modes include: c-mode with clang-format, go-mode with gofmt, js-mode and json-mode with prettier, and lisp-mode. Additionally rust-mode uses rustfmt.                                                                                                                                  
   find-history-file                   C-x C-h                           Prompt for a file from the file history and open it.                                                                                                                                                                    

Project
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   project-find-file                   C-x p f                           Open a file, from the list of all files in this project.                                                                                                                                                                
   project-root                                                          Display this buffer's project directory.                                                                                                                                                                                
   project-root-directory              C-x p d                           Open this project's root directory.                                                                                                                                                                                     
   project-kill-buffers                C-x p K                           Delete all this project's buffers, except:

  - if *delete-repl-buffer* is non t, we don't delete the REPL buffer.
  - if *delete-last-buffer* is non nil, we will delete the last buffer. This would cause Lem to exit.                                                                                                                                                                                            
   project-save                        C-x p s                           Remember the current project to the projects list.                                                                                                                                                                      
   project-save-prompt                                                   Prompts for a directory to save to the projects list.                                                                                                                                                                   
   project-unsave                      C-x p u                           Prompt for a project and remove it from the list of saved projects.                                                                                                                                                     
   project-switch                      C-x p p                           Prompt for a saved project and find a file in this project.                                                                                                                                                             

Buffer
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   indent-current-buffer                                                 Indent the current buffer.                                                                                                                                                                                              
   toggle-read-only                    C-x C-q                           Toggle the buffer read-only.                                                                                                                                                                                            
   rename-buffer                                                         Rename the buffer.                                                                                                                                                                                                      
   unmark-buffer                       M-~                               Remove the mark where the buffer was changed.                                                                                                                                                                           

Window
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   select-buffer                       C-x b                             Switches to the selected buffer.                                                                                                                                                                                        
   kill-buffer                         C-x k                             Delete buffer.                                                                                                                                                                                                          
   previous-buffer                     C-x Left                          Switches to the previous buffer.                                                                                                                                                                                        
   next-buffer                         C-x Right                         Switches to the next buffer.                                                                                                                                                                                            
   recenter                            C-l                               Scroll so that the cursor is in the middle.                                                                                                                                                                             
   split-active-window-vertically      C-x 2                             Split the current window vertically.                                                                                                                                                                                    
   split-active-window-horizontally    C-x 3                             Split the current window horizontally.                                                                                                                                                                                  
   next-window                         C-x o, M-o                        Go to the next window.                                                                                                                                                                                                  
   previous-window                     M-O                                                                                                                                                                                                                                                       
   switch-to-last-focused-window                                         Go to the window that was last in focus.                                                                                                                                                                                
   window-move-down                                                      Go to the window on the down.                                                                                                                                                                                           
   window-move-up                                                        Go to the window on the up.                                                                                                                                                                                             
   window-move-right                                                     Go to the window on the right.                                                                                                                                                                                          
   window-move-left                                                      Go to the window on the left.                                                                                                                                                                                           
   delete-other-windows                C-x 1                             Delete all other windows.                                                                                                                                                                                               
   delete-active-window                C-x 0, M-q                        Delete the active window.                                                                                                                                                                                               
   quit-active-window                                                    Quit the active window. This is a command for a popped-up window.                                                                                                                                                       
   grow-window                         C-x ^                             Grow the window's height.                                                                                                                                                                                               
   shrink-window                       C-x C-z                           Shrink the window's height.                                                                                                                                                                                             
   grow-window-horizontally            C-x }                             Grow the window's width.                                                                                                                                                                                                
   shrink-window-horizontally          C-x {                             Shrink the window's width.                                                                                                                                                                                              
   scroll-down                         C-Down, M-Down                    Scroll down.                                                                                                                                                                                                            
   scroll-up                           C-Up, M-Up                        Scroll up.                                                                                                                                                                                                              
   find-file-next-window               C-x 4 f                           Open a file in another window. Split the screen vertically if needed.                                                                                                                                                   
   read-file-next-window               C-x 4 r                           Read a file in another window.                                                                                                                                                                                          
   select-buffer-next-window           C-x 4 b                           Select a buffer in another window.                                                                                                                                                                                      
   compare-windows                                                                                                                                                                                                                                                                               

Multiple-Cursors
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   add-cursors-to-next-line            M-C                               Duplicates the cursor under the currently existing cursors.                                                                                                                                                             

Process
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   filter-buffer                       C-x #                             Replaces the contents of the buffer with the result of executing the command entered.                                                                                                                                   
   pipe-command                        C-x @                             Run a command and displays the output.                                                                                                                                                                                  

Help
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   describe-key                        C-x ?                             Tell what is the command associated to a keybinding.                                                                                                                                                                    
   describe-bindings                                                     Describe the bindings of the buffer's current major mode.                                                                                                                                                               
   list-modes                                                            Output all available major and minor modes.                                                                                                                                                                             
   apropos-command                                                       Find all symbols in the running Lisp image whose names match a given string.                                                                                                                                            
   lem-version                                                           Display Lem's version.                                                                                                                                                                                                  

Font
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   font-size-increase                  C-+                               Make the font larger (this currently only works with SDL2 frontend)                                                                                                                                                     
   font-size-decrease                  C--                               Make the font smaller (this currently only works with SDL2 frontend)                                                                                                                                                    

Other
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   nop-command                         NopKey                                                                                                                                                                                                                                                    
   undefined-key                                                         Signal undefined key error.                                                                                                                                                                                             
   keyboard-quit                       C-g                               Signal a `quit` condition.                                                                                                                                                                                              
   escape                              Escape                            Signal a `quit` condition silently.                                                                                                                                                                                     
   exit-lem                            C-x C-c                           Ask for modified buffers before exiting lem.                                                                                                                                                                            
   quick-exit                                                            Exit the lem job and kill it.                                                                                                                                                                                           
   execute-command                     M-x                               Read a command name, then read the ARG and call the command.                                                                                                                                                            
   show-context-menu                   Shift-F10, M-h                                                                                                                                                                                                                                            
   load-library                                                          Load the Lisp library named NAME.                                                                                                                                                                                       

Frame
  Command                             Key bindings                      Documentation                                                                                                                                                                                                           
   toggle-frame-fullscreen                                               Toggles fullscreen.                                                                                                                                                                                                     
```


# frame 

wood outside that holds the window 

# window

what user "sees" on the screen

window can be dragged up and down by mouse but not horizontally

## window
quit-active-window


## window grows

(lem:grow-window (current-window))
grow-window-horizontally 

shrink-window
shrink-window-horizontally

## window moves

move the point from one window to next

window-move-left
window-move-right
window-move-up
window-move-down

# lem documentation project

```
problem in a nutshell: 
 given an electronic book that presents a logical argument , 
 have some confidence that the conclusion follows from the assumptions .
 
timeless : 
 arguments presented once true are forever true 
 mathematical purity is extremely valuable 
 world class reasoning
 
robust :
 works easily on different hardware 
 boot strappable , does not require special compiler 
 
 
hurdles :
 operating system compromised
 hardware compromised
 solar storms affect electronics causing wrong bit to be placed in wrong address
 compiler errors such as c compiler 
 
difficulty: 
 computer math numericals is hard , overflow underflow etc..
 multiplying wildly different sized numbers floating point is a headache
 math algorithms need to be ensured correctness ?
 
computation order:
 results do not affect computations 
 
 a = 1 
 b = 2 
 c = a + b 
 
 result : c = 3
 
 c must always be 3 
 there is no situation where we can intercept c , change a to 2 , then find c to be 4
 
 in jupyter
 a = 1
 b = 2
  < revisit here and set a = 2 internally but visually looks like a = 1 >
 c = a + b 
 
 result : c = 4 
 
 this is because bad habits of imperative programming have been allowed a toxic spill into 
 logical world
 BAD
  

development : 
much like development of a proof may write things down in different orders
front to back
back to front
middle to end
lemmas , 
assumptions - what are the assumptions 


correctness :
correctness is more important than efficiency

efficiency : 
efficiency is important also , we can do a quick and dirty computation to achieve a result.
but that result must then be subject to interogation to assertain the correctness.
once correctness is established 

trying to present a cogent logic argument to human reader, going to need to represent
graphs , formulas , arguments and conclusions. 
There will be many many steps in the manuscript some require different software packages and 
different software languages.
some results may come from foreign sources such as books or other computations done on other 
computers.
may want to check computation of your own computer to ensure nothing un to ward has occured

so really looking at global scope of how do i trust what i see on the computer as the result.

gerald sussman from mit calls it trace-ability , given a result -
 what does the result rely on 
 where did those values plugged into formulae come from
  where did those formulae come from
   where did those formulae of formulae come from etc..
    
looking at computer verification isabelle/hol and coq theorem prover also for the code we are
writing a simple functional stack machine 

static verified typing with no type inference is idea from mathius felleisen racket scheme indiana university .

really what want is a system allows editing a manuscript


lem is inherently unstable , if something goes wrong the text editor ide crashes
so cannot be running the lem editor and write about using the lem editor because a 
crash loses all the work thats been done 
```

# mvp minimal viable product
```
a collection of buffers - simple as an array

buffer is a representation of 
buffer can be created from a file - 

some way to list known buffers - just the collection
close a buffer
open a buffer

buffer point - where is the cursor
insert text into a buffer at point
remove text from a buffer at point

insert text into a buffer region
remove text from a buffer region


frames vs window 

similar to model view controller 
visual presentation of buffer on a screen - 
split buffer visually - so can see two buffers on screen at any one time
switch between buffers visually 

visual presentation of buffer to allow scroll up down left right 



```

# init file
```
~/.lem/init.lisp

lem text editor uses this similar to emacs ~/.emacs.d/init.el 
any examples of stuff can do like change background color on startup 
silence the welcome screen ?

```

# strategy

start by comprehending a file in contrib/tetris/tetris.lisp

defconstant
(defconstant +pi+  3)
can visually see pi is a constant variable

defvar
(defvar *title* "main title")

defparameter 
(defparameter *title* "main title")

definition defvar / defparameter 
these define a global variable 

defpackage 
(defpackage )

(current-point)
(current-buffer)


