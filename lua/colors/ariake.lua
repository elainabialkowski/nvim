vim.cmd [[

" Name:     Ariake vim colorschem
" Author:   James Best <me@jamesbest.tech>
"
" URL:
" License:  OSI approved MIT license (see end of this file)
" Created:  In neon dreams
" Modified: 2020 Feb 10
"
" https://styles.ulysses.app/themes/ariake-dark-LJr
" https://github.com/arcticicestudio/nord-vim/blob/develop/colors/nord.vim
" https://github.com/sainnhe/edge/blob/master/colors/edge.vim
"
" TODO add citylights icon support via https://github.com/ryanoasis/vim-devicons
" !IMPORTANT: Much of the syntax used is taken from [vim polyglot](). You should
" install it if you intend to use the theme
" ---------------------------------------------------------------------
" COLOR VALUES
" ---------------------------------------------------------------------
"
" Hex values are canonical at the moment (because it's what's provided by YG)
"
" ARIAKE     HEX      XTERM/HEX   HSB         NAME*
" ---------- -------  ----------- ----------- ----------
" base04     #fafafa   235 #262626 208  34  17 black
" base03     #2a2c37   235 #262626 208  34  17 black
" base02     #666973   237 #3a3a3a 201  21  29 brblack
" base01     #9fa4ab   239 #4e4e4e 209  31  37
" base00     #d9e1ff   244 #767676 210  13  83 brwhite
" base0      #f3faff   254 #e4e4e4 206  30  63 white
" cyan       #7ef1ea                           cyan
" blue       #4f71ff                           blue
" purpledk   #504f84
" purple     #7f7ce3                           red
" pinkdk     #986da9
" pink       #e89dfc
" bluedk     #79829f
" yellow     #85b1df                           orangelt
" orange     #fbdf00
" green      #69f0ad                           green
" red        #f5331d
" git green  #1bf777

" *these are the names of the first 16 ANSI colors terminals allow you to change

" Colorscheme initialization
" " ---------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "ariake"

let background = "dark"
" GUI & CSApprox hexadecimal palettes
" ---------------------------------------------------------------------
"
" Set both gui and terminal color values in separate conditional statements
" Due to possibility that CSApprox is running
let s:none = "NONE"

" Prefer neovim termguicolors, but support gui_running
if (has('termguicolors') && &termguicolors) || has('gui_running')
  let s:vmode = "gui"
  let s:base04    = "#fafafa"
  let s:base03    = "#292d36"
  let s:base02    = "#666973"
  let s:base01    = "#0f1a3121"
  let s:base00    = "#f1f1f1"
  let s:base0     = "#f3faff"
  let s:cyan      = "#7ef1ea"
  let s:blue      = "#4f71ff"
  let s:bluelt    = "#85b1df"
  let s:purpledk  = "#504f84"
  let s:purple    = "#7f7ce3"
  let s:pinkdk    = "#a96fed"
  let s:pink      = "#e89dfc"
  let s:bluedk    = "#79829f"
  let s:yellow    = "#85b1df"
  let s:orange    = "#fbdf00"
  let s:green     = "#48afa7"
  let s:red       = "#f5331d"
  let s:greenlt   = "#1bf777"

else " 256 xterm colors as backup
  let s:vmode     = "cterm"
  let s:base03    = "235"
  let s:base02    = "237"
  let s:base01    = "239"
  let s:base00    = "244"
  let s:base0     = "254"
endif

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#292d36" " black
  let g:terminal_color_1 =  "#7f7ce3" " red
  let g:terminal_color_2 =  "#48afa7" " green
  let g:terminal_color_3 =  "#e89dfc" " orangelt
  let g:terminal_color_4 =  "#4f71ff" " blue
  let g:terminal_color_5 =  "#7f7ce3" " reddk
  let g:terminal_color_6 =  "#7ef1ea" " cyan
  let g:terminal_color_7 =  "#f3faff" " white
  let g:terminal_color_8 =  "#666973" " brblack
  let g:terminal_color_9 =  "#7f7ce3" " brred
  let g:terminal_color_10 = "#48afa7" " brgreen
  let g:terminal_color_11 = "#e89dfc" " brorangelt
  let g:terminal_color_12 = "#4f71ff" " brblue
  let g:terminal_color_13 = "#986da9" " brreddk
  let g:terminal_color_14 = "#70E1E8" " brcyan
  let g:terminal_color_15 = "#d9e1ff" " brwhite
  let g:terminal_color_16 = "#f5331d" " red
  let g:terminal_color_17 = "#1bf777" " greenlt
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_15
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_15
    let g:terminal_color_foreground = g:terminal_color_8
  endif
elseif has('terminal')
  let g:terminal_ansi_colors = [
        \"#2a2c37",
        \"#7f7ce3",
        \"#7ef1ea",
        \"#e89dfc",
        \"#4f71ff",
        \"#7f7ce3",
        \"#7ef1ea",
        \"#f3faff",
        \"#666973",
        \"#7f7ce3",
        \"#48afa7",
        \"#e89dfc",
        \"#4f71ff",
        \"#7f7ce3",
        \"#70E1E8",
        \"#B7C5D3",
        \"#fbdf00"
        \ ]
endif

" Formatting options and null values for passthrough effect "
" ---------------------------------------------------------------------
    let s:back            = '#141322'
    if &background == "light"
      let s:back            = s:base04
    endif
    let s:none            = "NONE"
    let s:t_none          = "NONE"
    let s:n               = "NONE"
    let s:c               = ",undercurl"
    let s:r               = ",reverse"
    let s:s               = ",standout"
    let s:b               = ",bold"
    let s:u               = ",underline"
    let s:i               = ",italic"

" Highlighting primitives"
" TODO convert primitives to color
" You'll note the use of exe in this section to use all the variables
" we've developed
" ---------------------------------------------------------------------
exe "let s:bg_none      = ' ".s:vmode."bg=".s:none        ."'"
exe "let s:bg_back      = ' ".s:vmode."bg=".s:back        ."'"
exe "let s:bg_base03    = ' ".s:vmode."bg=".s:base03      ."'"
exe "let s:bg_base02    = ' ".s:vmode."bg=".s:base02      ."'"
exe "let s:bg_base01    = ' ".s:vmode."bg=".s:base01      ."'"
exe "let s:bg_base00    = ' ".s:vmode."bg=".s:base00      ."'"
exe "let s:bg_base0     = ' ".s:vmode."bg=".s:base0       ."'"
exe "let s:bg_cyan      = ' ".s:vmode."bg=".s:cyan        ."'"
exe "let s:bg_blue      = ' ".s:vmode."bg=".s:blue        ."'"
exe "let s:bg_bluelt    = ' ".s:vmode."bg=".s:bluelt      ."'"
exe "let s:bg_purpledk  = ' ".s:vmode."bg=".s:purpledk    ."'"
exe "let s:bg_purple    = ' ".s:vmode."bg=".s:purple      ."'"
exe "let s:bg_pinkdk    = ' ".s:vmode."bg=".s:pinkdk      ."'"
exe "let s:bg_pink      = ' ".s:vmode."bg=".s:pink        ."'"
exe "let s:bg_bluedk    = ' ".s:vmode."bg=".s:bluedk      ."'"
exe "let s:bg_yellow    = ' ".s:vmode."bg=".s:yellow      ."'"
exe "let s:bg_orange    = ' ".s:vmode."bg=".s:orange      ."'"
exe "let s:bg_green     = ' ".s:vmode."bg=".s:green       ."'"
exe "let s:bg_red       = ' ".s:vmode."bg=".s:red         ."'"
exe "let s:bg_greenlt   = ' ".s:vmode."bg=".s:greenlt     ."'"

exe "let s:fg_none      = ' ".s:vmode."fg=".s:none        ."'"
exe "let s:fg_back      = ' ".s:vmode."fg=".s:back        ."'"
exe "let s:fg_base03    = ' ".s:vmode."fg=".s:base03      ."'"
exe "let s:fg_base02    = ' ".s:vmode."fg=".s:base02      ."'"
exe "let s:fg_base01    = ' ".s:vmode."fg=".s:base01      ."'"
exe "let s:fg_base00    = ' ".s:vmode."fg=".s:base00      ."'"
exe "let s:fg_base0     = ' ".s:vmode."fg=".s:base0       ."'"
exe "let s:fg_cyan      = ' ".s:vmode."fg=".s:cyan        ."'"
exe "let s:fg_blue      = ' ".s:vmode."fg=".s:blue        ."'"
exe "let s:fg_bluelt    = ' ".s:vmode."fg=".s:bluelt      ."'"
exe "let s:fg_purpledk  = ' ".s:vmode."fg=".s:purpledk    ."'"
exe "let s:fg_purple    = ' ".s:vmode."fg=".s:purple      ."'"
exe "let s:fg_pinkdk    = ' ".s:vmode."fg=".s:pinkdk      ."'"
exe "let s:fg_pink      = ' ".s:vmode."fg=".s:pink        ."'"
exe "let s:fg_bluedk    = ' ".s:vmode."fg=".s:bluedk      ."'"
exe "let s:fg_yellow    = ' ".s:vmode."fg=".s:yellow      ."'"
exe "let s:fg_orange    = ' ".s:vmode."fg=".s:orange      ."'"
exe "let s:fg_green     = ' ".s:vmode."fg=".s:green       ."'"
exe "let s:fg_red       = ' ".s:vmode."fg=".s:red         ."'"
exe "let s:fg_greenlt   = ' ".s:vmode."fg=".s:greenlt     ."'"

if &background == "light"
  exe "let s:fg_base00    = ' ".s:vmode."fg=".s:pink      ."'"
  exe "let s:fg_base0     = ' ".s:vmode."fg=".s:bluelt       ."'"
endif

exe "let s:fmt_none     = ' ".s:vmode."=NONE".          " term=NONE".    "'"
exe "let s:fmt_bold     = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b."'"
exe "let s:fmt_bldi     = ' ".s:vmode."=NONE".s:b.s:i.  " term=NONE".s:b.s:i."'"
exe "let s:fmt_undr     = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u."'"
exe "let s:fmt_undb     = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi     = ' ".s:vmode."=NONE".s:u.s:i.  " term=NONE".s:u.s:i."'"
exe "let s:fmt_curl     = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c."'"
exe "let s:fmt_ital     = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i."'"
exe "let s:fmt_stnd     = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s."'"
exe "let s:fmt_revr     = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r."'"
exe "let s:fmt_revb     = ' ".s:vmode."=NONE".s:r.s:b. " term=NONE".s:r.s:b."'"

if has("gui_running")
  exe "let s:sp_none      = ' guisp=".s:none        ."'"
  exe "let s:sp_back      = ' guisp=".s:back        ."'"
  exe "let s:sp_base03    = ' guisp=".s:base03      ."'"
  exe "let s:sp_base02    = ' guisp=".s:base02      ."'"
  exe "let s:sp_base01    = ' guisp=".s:base01      ."'"
  exe "let s:sp_base00    = ' guisp=".s:base00      ."'"
  exe "let s:sp_base0     = ' guisp=".s:base0       ."'"
  exe "let s:sp_cyan      = ' guisp=".s:cyan        ."'"
  exe "let s:sp_blue      = ' guisp=".s:blue        ."'"
  exe "let s:sp_bluelt    = ' guisp=".s:bluelt      ."'"
  exe "let s:sp_purpledk  = ' guisp=".s:purpledk    ."'"
  exe "let s:sp_purple    = ' guisp=".s:purple      ."'"
  exe "let s:sp_pinkdk    = ' guisp=".s:pinkdk      ."'"
  exe "let s:sp_pink      = ' guisp=".s:pink        ."'"
  exe "let s:sp_bluedk    = ' guisp=".s:bluedk      ."'"
  exe "let s:sp_yellow    = ' guisp=".s:yellow      ."'"
  exe "let s:sp_orange    = ' guisp=".s:orange      ."'"
  exe "let s:sp_green     = ' guisp=".s:green       ."'"
  exe "let s:sp_red       = ' guisp=".s:red         ."'"
else
  let s:sp_none       = ""
  let s:sp_back       = ""
  let s:sp_base03     = ""
  let s:sp_base02     = ""
  let s:sp_base01     = ""
  let s:sp_base00     = ""
  let s:sp_base0      = ""
  let s:sp_cyan       = ""
  let s:sp_blue       = ""
  let s:sp_bluelt     = ""
  let s:sp_purpledk   = ""
  let s:sp_purple     = ""
  let s:sp_pinkdk     = ""
  let s:sp_pink       = ""
  let s:sp_bluedk     = ""
  let s:sp_yellow     = ""
  let s:sp_orange     = ""
  let s:sp_green      = ""
endif

" Basic highlighting"{{{
" TODO match highlighting to Agreco's conversion
" ---------------------------------------------------------------------
" note that link syntax, to avoid duplicate configuration, doesn't work with the
" exe compiled formats

exe "hi! Normal"         .s:fmt_none   .s:fg_bluelt  .s:bg_back

exe "hi! Comment"        .s:fmt_ital   .s:fg_base02 .s:bg_none
"       *Comment         any comment

exe "hi! Constant"       .s:fmt_ital   .s:fg_none   .s:bg_none
"       *Constant        this groups is overwritten by type
"        Character       a character constant: 'c', '\n'
exe "hi! String"         .s:fmt_none   .s:fg_cyan .s:bg_none
"        String          a string constant: "this is a string"
exe "hi! Number"         .s:fmt_none    .s:fg_pink .s:bg_none
"        Number          a number constant: 234, 0xff
hi! link Boolean Number
"        Boolean         a boolean constant: TRUE, false
hi! link Float Number
"        Float           a floating point constant: 2.3e10

exe "hi! Identifier"     .s:fmt_none   .s:fg_purple   .s:bg_none
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
exe "hi! Statement"      .s:fmt_none   .s:fg_base00  .s:bg_none
"       *Statement       any statement - function
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe "hi! PreProc"        .s:fmt_none   .s:fg_base0 .s:bg_none
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe "hi! Type"           .s:fmt_none   .s:fg_none .s:bg_none
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe "hi! Special"        .s:fmt_none   .s:fg_purple    .s:bg_none
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

exe "hi! Underlined"     .s:fmt_undr   .s:fg_none .s:bg_none
"       *Underlined      text that stands out, HTML links

exe "hi! Ignore"         .s:fmt_none   .s:fg_none   .s:bg_none
"       *Ignore          left blank, hidden  |hl-Ignore|

exe "hi! Error"          .s:fmt_curl   .s:fg_pink    .s:bg_none
"       *Error           any erroneous construct

exe "hi! Todo"           .s:fmt_revb   .s:fg_base01 .s:bg_none
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
"
"}}}

" Extended highlighting "{{{
" ---------------------------------------------------------------------
"  TODO Missing or Noncanonical: SpecialKey, Nontext, Statusline, ErrorMsg, MoreMsg, Modemsg, LineNr, Question, VertSplit, VerticalNOS, WarningMsg, WildMenu, FoldColumn, SignColumn, Conceal, Spell*, PmenuSel, PmenuSBar, PmenuThumb, Tab*, Cursor*, ColorColumn,
if &background == "light"
  exe "let s:bg_base03    = ' ".s:vmode."bg=".s:base04      ."'"
endif
"  TODO Improve diff settings
exe "hi! ColorColumn"    .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! Conceal"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! Cursor"         .s:fmt_none   .s:fg_base03 .s:bg_cyan
hi! link lCursor Cursor
exe "hi! CursorColumn"   .s:fmt_none   .s:fg_blue   .s:bg_cyan
exe "hi! CursorLine"     .s:fmt_undr   .s:fg_none   .s:bg_green
exe "hi! CursorLineNR"   .s:fmt_none   .s:fg_base00 .s:bg_base03
exe "hi! DiffAdd"        .s:fmt_none   .s:fg_none  .s:bg_none
exe "hi! DiffChange"     .s:fmt_bold   .s:fg_none    .s:bg_none
exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_base01  .s:bg_none
exe "hi! DiffText"       .s:fmt_bold   .s:fg_base01  .s:bg_none
exe "hi! Directory"      .s:fmt_none   .s:fg_base0  .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_revr   .s:fg_pinkdk  .s:bg_none
exe "hi! FoldColumn"     .s:fmt_none   .s:fg_base0   .s:bg_base02
exe "hi! Folded"         .s:fmt_undb   .s:fg_cyan  .s:bg_yellow  .s:sp_base03
exe "hi! IncSearch"      .s:fmt_stnd   .s:fg_base03 .s:bg_bluedk
exe "hi! LineNr"         .s:fmt_none   .s:fg_base01 .s:bg_base03
exe "hi! MatchParen"     .s:fmt_undr   .s:fg_bluelt    .s:bg_none
exe "hi! ModeMsg"        .s:fmt_none   .s:fg_purple   .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none   .s:fg_purple   .s:bg_none
exe "hi! NonText"        .s:fmt_none   .s:fg_base01 .s:bg_none
exe "hi! Pmenu"          .s:fmt_none   .s:fg_none   .s:bg_none
exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base02  .s:bg_base0
exe "hi! PmenuSel"       .s:fmt_undr   .s:fg_none   .s:bg_base03
exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base0  .s:bg_base03
exe "hi! Question"       .s:fmt_bold   .s:fg_cyan   .s:bg_none
exe "hi! Search"         .s:fmt_undr   .s:fg_none .s:bg_none
exe "hi! SignColumn"     .s:fmt_none   .s:fg_base0 .s:bg_base03
exe "hi! SpecialKey"     .s:fmt_none   .s:fg_base01 .s:bg_none
exe "hi! SpellBad"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! SpellCap"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! SpellLocal"     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! SpellRare"      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! StatusLine"     .s:fmt_none   .s:fg_base0  .s:bg_purple
exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base0 .s:bg_yellow .s:fmt_none
exe "hi! TabLine"        .s:fmt_undr   .s:fg_base0  .s:bg_base03
exe "hi! TabLineFill"    .s:fmt_undr   .s:fg_base0  .s:bg_base03
exe "hi! TabLineSel"     .s:fmt_undr   .s:fg_blue   .s:bg_base03
exe "hi! Title"          .s:fmt_bold   .s:fg_base0   .s:bg_none
exe "hi! VertSplit"      .s:fmt_revb  .s:fg_none .s:bg_purple
exe "hi! Visual"         .s:fmt_none   .s:fg_none   .s:bg_base02 .s:fmt_none
exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none    .s:bg_base02 .s:fmt_revb
exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_cyan     .s:bg_none
exe "hi! WildMenu"       .s:fmt_none   .s:fg_base01  .s:bg_base02 .s:fmt_revb

if &background == "light"
  exe "hi! CursorLine"     .s:fmt_undr   .s:fg_none   .s:bg_cyan
  exe "hi! Comment"        .s:fmt_ital   .s:fg_base01 .s:bg_none
  exe "hi! String"         .s:fmt_none   .s:fg_green .s:bg_none
  exe "hi! StatusLine"     .s:fmt_none   .s:fg_base0  .s:bg_cyan
  exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base0 .s:bg_blue .s:fmt_none
endif

" vim syntax highlighting
" ---------------------------------------------------------------------
exe "hi! vimCommand"     .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! vimFunc"        .s:fmt_none   .s:fg_blue     .s:bg_none
exe "hi! vimFuncName"    .s:fmt_none   .s:fg_blue     .s:bg_none
exe "hi! vimHighlight"   .s:fmt_none   .s:fg_base0    .s:bg_none
exe "hi! vimHiBang"      .s:fmt_none   .s:fg_bluedk   .s:bg_none
exe "hi! vimHiGroup"     .s:fmt_none   .s:fg_base00   .s:bg_none
exe "hi! vimHiClear"     .s:fmt_none   .s:fg_base00   .s:bg_none
exe "hi! vimLet"         .s:fmt_none   .s:fg_purple   .s:bg_none
exe "hi! vimNotFunc"     .s:fmt_none   .s:fg_blue     .s:bg_none
exe "hi! vimSynType"     .s:fmt_none   .s:fg_base00   .s:bg_none
exe "hi! vimVar"         .s:fmt_none   .s:fg_base0    .s:bg_none

" html syntax highlighting
" ---------------------------------------------------------------------
exe "hi! htmlArg"        .s:fmt_none   .s:fg_cyan      .s:bg_none
exe "hi! htmlEndTag"     .s:fmt_none   .s:fg_base0    .s:bg_none
exe "hi! htmlH2"         .s:fmt_none   .s:fg_base00    .s:bg_none
exe "hi! htmlTag"        .s:fmt_none   .s:fg_base0    .s:bg_none
exe "hi! htmlTagName"    .s:fmt_none   .s:fg_cyan    .s:bg_none

if &background == "light"
  exe "hi! htmlEndTag"     .s:fmt_none   .s:fg_pink    .s:bg_none
  exe "hi! htmlTag"        .s:fmt_none   .s:fg_pink    .s:bg_none
endif

" javascript syntax highlighting
" ---------------------------------------------------------------------
exe "hi! jsStorageClass"    .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsVariableDef"     .s:fmt_none   .s:fg_yellow     .s:bg_none
exe "hi! jsOperatorKeyword" .s:fmt_ital   .s:fg_base0     .s:bg_none
exe "hi! jsOperator"        .s:fmt_none   .s:fg_yellow     .s:bg_none
exe "hi! jsBooleanTrue"     .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! jsBooleanFalse"     .s:fmt_none   .s:fg_pink     .s:bg_none

exe "hi! jsImport"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsExport"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsExportDefault"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsFrom"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsCommentTodo"     .s:fmt_ital   .s:fg_pink     .s:bg_none

exe "hi! jsString"     .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! jsTemplateString"     .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! jsTaggedTemplate"     .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! jsNumber"     .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! jsFloat"     .s:fmt_none   .s:fg_pink     .s:bg_none

exe "hi! jsObjectShorthandProp"     .s:fmt_none   .s:fg_yellow     .s:bg_none
exe "hi! jsObjectKey"     .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! jsObjectKeyString"     .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! jsObjectKeyString"     .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! jsObjectSeparator"     .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! jsObjectValue"     .s:fmt_none   .s:fg_yellow     .s:bg_none

exe "hi! jsConditional"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsSwitchCase"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsTry"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsFinally"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsCatch"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsException"     .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! jsAsyncKeyword"     .s:fmt_ital   .s:fg_purple     .s:bg_none

exe "hi! jsBrackets"     .s:fmt_none   .s:fg_orange     .s:bg_none
exe "hi! jsParens"     .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! jsParensIfElse"     .s:fmt_none   .s:fg_orange     .s:bg_none
exe "hi! jsBraces"     .s:fmt_none   .s:fg_orange     .s:bg_none
exe "hi! jsTryCatchBraces"     .s:fmt_none   .s:fg_pink     .s:bg_none

if &background == "light"
  exe "hi! jsOperatorKeyword" .s:fmt_ital   .s:fg_pink     .s:bg_none
  exe "hi! jsObjectKey"     .s:fmt_none   .s:fg_pink     .s:bg_none
  exe "hi! jsObjectSeparator"     .s:fmt_none   .s:fg_pink     .s:bg_none
  exe "hi! jsString"     .s:fmt_none   .s:fg_green     .s:bg_none
  exe "hi! jsTemplateString"     .s:fmt_none   .s:fg_green     .s:bg_none
  exe "hi! jsTaggedTemplate"     .s:fmt_none   .s:fg_green     .s:bg_none
  exe "hi! jsObjectKeyString"     .s:fmt_none   .s:fg_green     .s:bg_none
  exe "hi! jsObjectKeyString"     .s:fmt_none   .s:fg_green     .s:bg_none
endif

" typescript syntax highlighting
" ---------------------------------------------------------------------
exe "hi! typescriptAssertType"        .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! typescriptAliasKeyword"      .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! typescriptInterfaceName"     .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! typescriptInterfaceKeyword"  .s:fmt_ital   .s:fg_purple   .s:bg_none
exe "hi! typescriptType"              .s:fmt_ital   .s:fg_purple   .s:bg_none
exe "hi! typescriptDocParamName"      .s:fmt_ital   .s:fg_green   .s:bg_none

exe "hi! typescriptAsyncFuncKeyword"  .s:fmt_ital   .s:fg_purple   .s:bg_none
exe "hi! typescriptFuncKeyword"       .s:fmt_ital   .s:fg_purple   .s:bg_none
exe "hi! typescriptFuncName"          .s:fmt_none   .s:fg_base0   .s:bg_none
exe "hi! typescriptArrowFuncArg"      .s:fmt_none   .s:fg_base0   .s:bg_none
exe "hi! typescriptArrowFunc"         .s:fmt_none   .s:fg_base0   .s:bg_none

exe "hi! typescriptBraces"            .s:fmt_none   .s:fg_purple   .s:bg_none
exe "hi! typescriptSymbols"           .s:fmt_none   .s:fg_cyan   .s:bg_none
exe "hi! typescriptParens"            .s:fmt_none   .s:fg_orange   .s:bg_none
exe "hi! typescriptCommentTodo"       .s:fmt_none   .s:fg_pink   .s:bg_none
exe "hi! typescriptTemplate"          .s:fmt_none   .s:fg_cyan   .s:bg_none
exe "hi! typescriptIdentifier"        .s:fmt_none   .s:fg_cyan   .s:bg_none
exe "hi! typescriptVariable"          .s:fmt_ital   .s:fg_purple   .s:bg_none
exe "hi! typescriptStatementKeyword"  .s:fmt_ital   .s:fg_purple   .s:bg_none
exe "hi! typescriptOperator"          .s:fmt_ital   .s:fg_green   .s:bg_none
exe "hi! typescriptExport"            .s:fmt_ital   .s:fg_purple   .s:bg_none

if &background == "light"
  exe "hi! typescriptFuncName"          .s:fmt_none   .s:fg_pink   .s:bg_none
  exe "hi! typescriptArrowFuncArg"      .s:fmt_none   .s:fg_pink   .s:bg_none
  exe "hi! typescriptArrowFunc"         .s:fmt_none   .s:fg_pink   .s:bg_none
  exe "hi! typescriptParens"            .s:fmt_none   .s:fg_blue   .s:bg_none
endif

highlight def link tsxTag htmlTag
highlight def link tsxTagName Function
highlight def link tsxIntrinsicTagName htmlTagName
highlight def link tsxString String
highlight def link tsxNameSpace Function
highlight def link tsxCommentInvalid Error
highlight def link tsxBlockComment Comment
highlight def link tsxLineComment Comment
highlight def link tsxAttrib Type
highlight def link tsxEscJs tsxEscapeJs
highlight def link tsxCloseTag htmlTag
highlight def link tsxCloseString Identifier

" json syntax highlighting
" ---------------------------------------------------------------------
exe "hi! jsonString"                  .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! jsonNumber"                  .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! jsonBraces"                  .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! jsonNull"                    .s:fmt_none   .s:fg_purple   .s:bg_none
exe "hi! jsonBoolean"                 .s:fmt_none   .s:fg_purple   .s:bg_none
exe "hi! jsonKeyword"                 .s:fmt_none   .s:fg_yellow   .s:bg_none


" html syntax highlighting
" ---------------------------------------------------------------------
exe "hi! htmlTagName"                 .s:fmt_none   .s:fg_bluelt   .s:bg_none
exe "hi! htmlArg"                     .s:fmt_ital   .s:fg_pink     .s:bg_none
"
" ALE
" ---------------------------------------------------------------------
exe "hi! ALEError"                 .s:fmt_none   .s:fg_orange   .s:bg_none
exe "hi! ALEWarning"               .s:fmt_none   .s:fg_bluelt   .s:bg_none
exe "hi! ALEErrorSign"             .s:fmt_none   .s:fg_orange   .s:bg_none
exe "hi! ALEWarningSign"           .s:fmt_none   .s:fg_bluelt   .s:bg_none

" BarBar
" ---------------------------------------------------------------------
exe "hi! BufferCurrent"                     .s:fmt_none   .s:fg_green     .s:bg_none
exe "hi! BufferCurrentMod"                  .s:fmt_ital   .s:fg_cyan     .s:bg_none
exe "hi! BufferCurrentSign"                 .s:fmt_none   .s:fg_orange     .s:bg_none
exe "hi! BufferCurrentTarget"               .s:fmt_none   .s:fg_orange     .s:bg_none
if &background == 'light'
  exe "hi! BufferCurrent"                     .s:fmt_none   .s:fg_green     .s:bg_none
  exe "hi! BufferCurrentMod"                  .s:fmt_ital   .s:fg_cyan     .s:bg_none
  exe "hi! BufferCurrentSign"                 .s:fmt_ital   .s:fg_green     .s:bg_none
  exe "hi! BufferCurrentTarget"               .s:fmt_ital   .s:fg_green     .s:bg_none
endif
exe "hi! BufferVisible"                     .s:fmt_ital   .s:fg_pink     .s:bg_none
exe "hi! BufferVisibleMod"                  .s:fmt_bold   .s:fg_cyan     .s:bg_none
exe "hi! BufferVisibleSign"                 .s:fmt_ital   .s:fg_pink     .s:bg_none
exe "hi! BufferVisibleTarget"               .s:fmt_ital   .s:fg_pink     .s:bg_none
exe "hi! BufferInactive"                    .s:fmt_ital   .s:fg_pink     .s:bg_none
exe "hi! BufferInactiveSign"                .s:fmt_ital   .s:fg_pink     .s:bg_none
exe "hi! BufferInactiveTarget"              .s:fmt_ital   .s:fg_cyan     .s:bg_none

exe "hi! diffAdded"                   .s:fmt_none   .s:fg_greenlt    .s:bg_none
exe "hi! diffRemoved"                 .s:fmt_none   .s:fg_red      .s:bg_none
exe "hi! diffChanged"                 .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! diffOldFile"                 .s:fmt_none   .s:fg_green    .s:bg_none
exe "hi! diffNewFile"                 .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! diffFile"                    .s:fmt_none   .s:fg_yellow   .s:bg_none
exe "hi! diffLine"                    .s:fmt_none   .s:fg_base02    .s:bg_none
exe "hi! diffIndexLine"               .s:fmt_none   .s:fg_yellow   .s:bg_none

exe "hi! gitcommitSummary"            .s:fmt_none   .s:fg_base02     .s:bg_none
exe "hi! gitcommitUntracked"          .s:fmt_none   .s:fg_base02     .s:bg_none
exe "hi! gitcommitDiscarded"          .s:fmt_none   .s:fg_base02     .s:bg_none
exe "hi! gitcommitSelected"           .s:fmt_none   .s:fg_base02     .s:bg_none
exe "hi! gitCommitUnmerged"           .s:fmt_none   .s:fg_base02     .s:bg_none
exe "hi! gitcommitOnBranch"           .s:fmt_none   .s:fg_base02     .s:bg_none
exe "hi! gitcommitArrow"              .s:fmt_none   .s:fg_base02     .s:bg_none
exe "hi! gitcommitFile"               .s:fmt_none   .s:fg_base02     .s:bg_none

exe "hi! SigniftSignAdd"               .s:fmt_none   .s:fg_greenlt     .s:bg_none
exe "hi! SignifySignChange"            .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! SignifySignDelete"            .s:fmt_none   .s:fg_red     .s:bg_none
exe "hi! SignifySignChangeDelete"      .s:fmt_none   .s:fg_yellow     .s:bg_none

exe "hi! BufTabLineCurrent"            .s:fmt_none   .s:fg_base03     .s:bg_cyan
exe "hi! BufTabLineActive"             .s:fmt_none   .s:fg_yellow     .s:bg_none
exe "hi! BufTabLineHidden"             .s:fmt_none   .s:fg_yellow     .s:bg_none
exe "hi! BufTabLineFill"               .s:fmt_none   .s:fg_yellow     .s:bg_none
exe "hi! BufTabLineModifiedCurrent"    .s:fmt_none   .s:fg_yellow     .s:bg_none
exe "hi! BufTabLineModifiedActive"     .s:fmt_none   .s:fg_yellow     .s:bg_none
exe "hi! BufTabLineModifiedHidden"     .s:fmt_none   .s:fg_yellow     .s:bg_none

exe "hi! Sneak"           .s:fmt_none   .s:fg_purple     .s:bg_none
exe "hi! SneakLabel"      .s:fmt_none   .s:fg_pink     .s:bg_bluelt
exe "hi! SneakScope"      .s:fmt_none   .s:fg_yellow     .s:bg_none

" FZF plugin
exe "hi! fzf1"      .s:fmt_none   .s:fg_blue     .s:bg_none
exe "hi! fzf2"      .s:fmt_ital   .s:fg_blue     .s:bg_none
exe "hi! fzf3"      .s:fmt_none   .s:fg_orange     .s:bg_none
exe "hi! fzfNormal"      .s:fmt_none   .s:fg_purple     .s:bg_none
exe "hi! fzfFgPlus"      .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! fzfBorder"      .s:fmt_none   .s:fg_cyan     .s:bg_none

let g:fzf_colors = {
  \  'fg':      ['fg', 'fzfNormal'],
  \  'bg':      ['bg', 'Normal'],
  \  'hl':      ['fg', 'Number'],
  \  'fg+':     ['fg', 'fzfFgPlus'],
  \  'bg+':     ['bg', 'Pmenu'],
  \  'hl+':     ['fg', 'Number'],
  \  'info':    ['fg', 'String'],
  \  'border':  ['fg', 'fzfBorder'],
  \  'prompt':  ['fg', 'fzf2'],
  \  'pointer': ['fg', 'Exception'],
  \  'marker':  ['fg', 'StorageClass'],
  \  'spinner': ['fg', 'Type'],
  \  'header':  ['fg', 'CursorLineNr']
  \}

" TreeSitter stuff
" ?
exe "hi! TSAnnotation"                .s:fmt_ital   .s:fg_green     .s:bg_none
" ?
exe "hi! TSAttribute"                 .s:fmt_ital   .s:fg_green     .s:bg_none
exe "hi! TSBoolean"                   .s:fmt_ital   .s:fg_pink     .s:bg_none
" ?
exe "hi! TSCharacter"                 .s:fmt_ital   .s:fg_base0     .s:bg_none
" if statements and default
exe "hi! TSConditional"               .s:fmt_none   .s:fg_purple     .s:bg_none
" CONSTANTS
exe "hi! TSConstant"                  .s:fmt_none   .s:fg_blue     .s:bg_none
exe "hi! TSConstBuiltin"              .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! TSConstMacro"                .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSEmphasis"                  .s:fmt_none   .s:fg_base0     .s:bg_none
" ?
exe "hi! TSError"                     .s:fmt_none   .s:fg_green     .s:bg_none
"
exe "hi! TSException"                 .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSField"                     .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSFloat"                     .s:fmt_ital   .s:fg_base0     .s:bg_none
exe "hi! TSFuncBuiltin"               .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSFuncMacro"                 .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSKeywordFunction"           .s:fmt_ital   .s:fg_green     .s:bg_none
exe "hi! TSKeywordOperator"           .s:fmt_ital   .s:fg_purpledk     .s:bg_none
exe "hi! TSLiteral"                   .s:fmt_ital   .s:fg_green     .s:bg_none
exe "hi! TSNamespace"                 .s:fmt_ital   .s:fg_base0     .s:bg_none
exe "hi! TSNumber"                    .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! TSParameterReference"        .s:fmt_none   .s:fg_green     .s:bg_none
exe "hi! TSPunctSpecial"              .s:fmt_none   .s:fg_bluelt     .s:bg_none
exe "hi! TSRepeat"                    .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSString"                    .s:fmt_none   .s:fg_cyan     .s:bg_none


exe "hi! TSStringEscape"              .s:fmt_none   .s:fg_green     .s:bg_none
exe "hi! TSStringRegex"               .s:fmt_none   .s:fg_green     .s:bg_none
exe "hi! TSStrong"                    .s:fmt_none   .s:fg_orange     .s:bg_none
exe "hi! TSStructure"                 .s:fmt_none   .s:fg_green     .s:bg_none
exe "hi! TSText"                      .s:fmt_none   .s:fg_green     .s:bg_none
exe "hi! TSTitle"                     .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSTypeBuiltin"               .s:fmt_none   .s:fg_cyan     .s:bg_none
exe "hi! TSUnderline"                 .s:fmt_none   .s:fg_green     .s:bg_none
exe "hi! TSURI"                       .s:fmt_ital   .s:fg_pink     .s:bg_none
exe "hi! TSInclude"                   .s:fmt_ital   .s:fg_purple     .s:bg_none
" seems to be all {}
exe "hi! TSPunctBracket"              .s:fmt_none   .s:fg_bluelt     .s:bg_none
exe "hi! TSPunctDelimiter"            .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSParameter"                 .s:fmt_none   .s:fg_green     .s:bg_none
exe "hi! TSType"                      .s:fmt_none   .s:fg_purple     .s:bg_none
exe "hi! TSFunction"                  .s:fmt_none   .s:fg_base0     .s:bg_none
"
exe "hi! TSTagDelimiter"              .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSProperty"                  .s:fmt_none   .s:fg_base0     .s:bg_none
exe "hi! TSMethod"                    .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! TSParameter"                 .s:fmt_none   .s:fg_green     .s:bg_none
exe "hi! TSConstructor"               .s:fmt_ital   .s:fg_pinkdk     .s:bg_none
exe "hi! TSVariable"                  .s:fmt_ital   .s:fg_bluelt     .s:bg_none
exe "hi! TSOperator"                  .s:fmt_none   .s:fg_pink     .s:bg_none
exe "hi! TSKeyword"                   .s:fmt_ital   .s:fg_purple     .s:bg_none
exe "hi! TSVariableBuiltin"           .s:fmt_ital   .s:fg_bluelt     .s:bg_none
exe "hi! TSTag"                       .s:fmt_none   .s:fg_purple     .s:bg_none
exe "hi! TSLabel"                     .s:fmt_none   .s:fg_purple     .s:bg_none

if &background == "light"
  exe "hi! TSString"                    .s:fmt_none   .s:fg_green     .s:bg_none
  exe "hi! TSOperator"                  .s:fmt_none   .s:fg_purple     .s:bg_none
  exe "hi! TSPunctDelimiter"            .s:fmt_none   .s:fg_blue     .s:bg_none
  exe "hi! TSFunction"                  .s:fmt_none   .s:fg_pink     .s:bg_none
  exe "hi! TSConstant"                  .s:fmt_none   .s:fg_cyan     .s:bg_none
endif
" }}}

]]
