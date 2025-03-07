" Vim color file
" File:       iaxs-monokai.vim
" Maintainer: Iury Xavier <iuryadones@gmail.com>
" URL:        https://github.com/iuryxavier/vim-iaxs
" Version:    1.0.0


let colors_name = "iaxs-monokai"

highlight clear

syntax clear

set background=dark

if exists("syntax_on")
  syntax reset
else
  syntax on
  syntax enable
endif

if !has("gui_running") && &t_Co < 256
  if !exists("g:termcolor_16_monokai")
      let g:termcolor_16_monokai=1
  endif
else
  if !exists("g:termcolor_16_monokai")
      let g:termcolor_16_monokai=0
  endif
endif

if has('termguicolors')
    set termguicolors
endif

function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"

  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif

  let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
  let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")

  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

" Palettes
" --------

if g:termcolor_16_monokai == 0
    let s:addbg       = { "gui": "#5f875f", "cterm": "65" }
    let s:addfg       = { "gui": "#d7ffaf", "cterm": "193" }
    let s:aqua        = { "gui": "#66d9ef", "cterm": "81" }
    let s:black       = { "gui": "#272822", "cterm": "234" }
    let s:changebg    = { "gui": "#5f5f87", "cterm": "60" }
    let s:changefg    = { "gui": "#d7d7ff", "cterm": "189" }
    let s:darkblack   = { "gui": "#211F1C", "cterm": "233" }
    let s:darkgrey    = { "gui": "#64645e", "cterm": "239" }
    let s:darkred     = { "gui": "#5f0000", "cterm": "52" }
    let s:delbg       = { "gui": "#f75f5f", "cterm": "167" }
    let s:green       = { "gui": "#A6E22D", "cterm": "148" }
    let s:grey        = { "gui": "#8F908A", "cterm": "243" }
    let s:lightblack  = { "gui": "#2D2E27", "cterm": "235" }
    let s:lightblack2 = { "gui": "#383a3e", "cterm": "236" }
    let s:lightgrey   = { "gui": "#575b61", "cterm": "237" }
    let s:orange      = { "gui": "#FD9720", "cterm": "208" }
    let s:pink        = { "gui": "#F92772", "cterm": "197" }
    let s:purple      = { "gui": "#ae81ff", "cterm": "141" }
    let s:red         = { "gui": "#ff0000", "cterm": "9" }
    let s:warmgrey    = { "gui": "#75715E", "cterm": "59" }
    let s:white       = { "gui": "#E8E8E3", "cterm": "252" }
    let s:yellow      = { "gui": "#E6DB74", "cterm": "186" }
else
    let s:addbg       = { "gui": "#008000", "cterm": "2" }
    let s:addfg       = { "gui": "#00FF00", "cterm": "10" }
    let s:aqua        = { "gui": "#00FFFF", "cterm": "14" }
    let s:black       = { "gui": "#000000", "cterm": "0" }
    let s:changebg    = { "gui": "#800080", "cterm": "5" }
    let s:changefg    = { "gui": "#FF00FF", "cterm": "13" }
    let s:darkblack   = { "gui": "#000000", "cterm": "0" }
    let s:darkgrey    = { "gui": "#808080", "cterm": "8" }
    let s:darkred     = { "gui": "#800000", "cterm": "1" }
    let s:delbg       = { "gui": "#FF0000", "cterm": "9" }
    let s:green       = { "gui": "#00FF00", "cterm": "10" }
    let s:grey        = { "gui": "#808080", "cterm": "8" }
    let s:lightblack  = { "gui": "#808080", "cterm": "8" }
    let s:lightblack2 = { "gui": "#C0C0C0", "cterm": "7" }
    let s:lightgrey   = { "gui": "#000000", "cterm": "15" }
    let s:orange      = { "gui": "#808000", "cterm": "3" }
    let s:pink        = { "gui": "#FF00FF", "cterm": "13" }
    let s:purple      = { "gui": "#800080", "cterm": "5" }
    let s:red         = { "gui": "#FF0000", "cterm": "9" }
    let s:warmgrey    = { "gui": "#C0C0C0", "cterm": "7" }
    let s:white       = { "gui": "#FFFFFF", "cterm": "15" }
    let s:yellow      = { "gui": "#FFFF00", "cterm": "11" }
endif


" Highlighting 
" ------------

" editor
call s:h("Normal",        { "fg": s:white,       "bg": s:black })
call s:h("ColorColumn",   {                     "bg": s:lightblack })
call s:h("CursorColumn",  {                     "bg": s:lightblack2 })
call s:h("CursorLine",    {                     "bg": s:lightblack2 })
call s:h("NonText",       { "fg": s:lightgrey })
call s:h("StatusLine",    { "fg": s:warmgrey,   "bg": s:black,        "format": "reverse" })
call s:h("StatusLineNC",  { "fg": s:darkgrey,   "bg": s:warmgrey,     "format": "reverse" })
call s:h("TabLine",       { "fg": s:white,      "bg": s:darkblack,    "format": "reverse" })
call s:h("Visual",        {                     "bg": s:lightgrey })
call s:h("Search",        { "fg": s:black,      "bg": s:yellow })
call s:h("MatchParen",    { "fg": s:black,      "bg": s:purple })
call s:h("Question",      { "fg": s:yellow })
call s:h("ModeMsg",       { "fg": s:yellow })
call s:h("MoreMsg",       { "fg": s:yellow })
call s:h("ErrorMsg",      { "fg": s:black,      "bg": s:red,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:red })
call s:h("VertSplit",     { "fg": s:darkgrey,   "bg": s:darkblack })
call s:h("LineNr",        { "fg": s:grey,       "bg": s:lightblack })
call s:h("CursorLineNr",  { "fg": s:orange,     "bg": s:black })
call s:h("SignColumn",    {                     "bg": s:lightblack })

" misc
call s:h("SpecialKey",    { "fg": s:pink })
call s:h("Title",         { "fg": s:yellow })
call s:h("Directory",     { "fg": s:aqua })

" diff
call s:h("DiffAdd",       { "fg": s:addfg,      "bg": s:addbg })
call s:h("DiffDelete",    { "fg": s:black,      "bg": s:delbg })
call s:h("DiffChange",    { "fg": s:changefg,   "bg": s:changebg })
call s:h("DiffText",      { "fg": s:black,      "bg": s:aqua })

" fold
call s:h("Folded",        { "fg": s:warmgrey,   "bg": s:darkblack })
call s:h("FoldColumn",    {                     "bg": s:darkblack })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:lightblack, "bg": s:white })
call s:h("PmenuSel",      { "fg": s:aqua,       "bg": s:black,        "format": "reverse,bold" })
call s:h("PmenuThumb",    { "fg": s:lightblack, "bg": s:grey })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:purple, "format":"bold" })
call s:h("Number",        { "fg": s:purple, "format":"bold" })
call s:h("Float",         { "fg": s:purple, "format":"bold" })
call s:h("Boolean",       { "fg": s:purple, "format":"bold" })
call s:h("Character",     { "fg": s:yellow, "format":"bold" })
call s:h("String",        { "fg": s:yellow, "format":"bold,italic" })
call s:h("Type",          { "fg": s:aqua })
call s:h("Structure",     { "fg": s:aqua })
call s:h("StorageClass",  { "fg": s:aqua })
call s:h("Typedef",       { "fg": s:aqua })

call s:h("Identifier",    { "fg": s:orange, "format":"bold,italic"})
call s:h("Function",      { "fg": s:green, "format":"bold"})

call s:h("Statement",     { "fg": s:pink, "format":"bold" })
call s:h("Operator",      { "fg": s:aqua })
call s:h("Label",         { "fg": s:pink })
call s:h("Keyword",       { "fg": s:aqua  })
call s:h("Conditional",   { "fg": s:pink, "format":"bold" })
call s:h("Repeat",        { "fg": s:green, "format":"bold" })
call s:h("Exception",     { "fg": s:green })

call s:h("PreProc",       { "fg": s:green })
call s:h("Include",       { "fg": s:pink })
call s:h("Define",        { "fg": s:pink })
call s:h("Macro",         { "fg": s:green })
call s:h("PreCondit",     { "fg": s:green })

call s:h("Special",       { "fg": s:purple })
call s:h("SpecialChar",   { "fg": s:pink })
call s:h("Delimiter",     { "fg": s:pink })
call s:h("SpecialComment",{ "fg": s:aqua })
call s:h("Tag",           { "fg": s:pink })
"        Debug"

call s:h("Todo",          { "fg": s:orange,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:warmgrey, "format": "italic" })

call s:h("Underlined",    { "fg": s:green })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:red, "bg": s:darkred })

" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:yellow })
call s:h("NERDTreeClosable",        { "fg": s:yellow })
call s:h("NERDTreeHelp",            { "fg": s:yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:pink })
call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
call s:h("NERDTreeCWD",             { "fg": s:pink })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:grey })
call s:h("NERDTreeDir",             { "fg": s:grey })

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:lightblack, "bg": s:orange })

" Language highlight
" ------------------

" Java properties
call s:h("jpropertiesIdentifier",   { "fg": s:pink })

" Vim command
call s:h("vimCommand",              { "fg": s:pink })

" Javascript
call s:h("jsFuncName",          { "fg": s:green })
call s:h("jsThis",              { "fg": s:pink })
call s:h("jsFunctionKey",       { "fg": s:green })
call s:h("jsPrototype",         { "fg": s:aqua })
call s:h("jsExceptions",        { "fg": s:aqua })
call s:h("jsFutureKeys",        { "fg": s:aqua })
call s:h("jsBuiltins",          { "fg": s:aqua })
call s:h("jsArgsObj",           { "fg": s:aqua })
call s:h("jsStatic",            { "fg": s:aqua })
call s:h("jsSuper",             { "fg": s:aqua })
call s:h("jsFuncArgRest",       { "fg": s:purple, "format": "italic" })                                 
call s:h("jsFuncArgs",          { "fg": s:orange, "format": "italic" })
call s:h("jsStorageClass",      { "fg": s:aqua })
call s:h("jsDocTags",           { "fg": s:aqua,   "format": "italic" })
                                 
" Html
call s:h("htmlTag",             { "fg": s:white })
call s:h("htmlEndTag",          { "fg": s:white })
call s:h("htmlTagName",         { "fg": s:pink })
call s:h("htmlArg",             { "fg": s:green })
call s:h("htmlSpecialChar",     { "fg": s:purple })

" Xml
call s:h("xmlTag",              { "fg": s:pink })
call s:h("xmlEndTag",           { "fg": s:pink })
call s:h("xmlTagName",          { "fg": s:orange })
call s:h("xmlAttrib",           { "fg": s:green })

" CSS
call s:h("cssProp",             { "fg": s:yellow })
call s:h("cssUIAttr",           { "fg": s:yellow })
call s:h("cssFunctionName",     { "fg": s:aqua })
call s:h("cssColor",            { "fg": s:purple })
call s:h("cssPseudoClassId",    { "fg": s:purple })
call s:h("cssClassName",        { "fg": s:green })
call s:h("cssValueLength",      { "fg": s:purple })
call s:h("cssCommonAttr",       { "fg": s:pink })
call s:h("cssBraces" ,          { "fg": s:white })
call s:h("cssClassNameDot",     { "fg": s:pink })
call s:h("cssURL",              { "fg": s:orange, "format": "underline,italic" })

" LESS
call s:h("lessVariable",        { "fg": s:green })

" ruby
call s:h("rubyInterpolationDelimiter",  {})
call s:h("rubyInstanceVariable",        {})
call s:h("rubyGlobalVariable",          {})
call s:h("rubyClassVariable",           {})
call s:h("rubyPseudoVariable",          {})
call s:h("rubyFunction",                { "fg": s:green })
call s:h("rubyStringDelimiter",         { "fg": s:yellow })
call s:h("rubyRegexp",                  { "fg": s:yellow })
call s:h("rubyRegexpDelimiter",         { "fg": s:yellow })
call s:h("rubySymbol",                  { "fg": s:purple })
call s:h("rubyEscape",                  { "fg": s:purple })
call s:h("rubyInclude",                 { "fg": s:pink })
call s:h("rubyOperator",                { "fg": s:pink })
call s:h("rubyControl",                 { "fg": s:pink })
call s:h("rubyClass",                   { "fg": s:pink })
call s:h("rubyDefine",                  { "fg": s:pink })
call s:h("rubyException",               { "fg": s:pink })
call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange })
call s:h("rubyRailsARMethod",           { "fg": s:orange })
call s:h("rubyRailsRenderMethod",       { "fg": s:orange })
call s:h("rubyRailsMethod",             { "fg": s:orange })
call s:h("rubyConstant",                { "fg": s:aqua })
call s:h("rubyBlockArgument",           { "fg": s:orange })
call s:h("rubyBlockParameter",          { "fg": s:orange })

" eruby
call s:h("erubyDelimiter",              {})
call s:h("erubyRailsMethod",            { "fg": s:aqua })

" c
call s:h("cLabel",                      { "fg": s:pink })
call s:h("cStructure",                  { "fg": s:pink })
call s:h("cStorageClass",               { "fg": s:pink })
call s:h("cInclude",                    { "fg": s:green })
call s:h("cDefine",                     { "fg": s:green })
