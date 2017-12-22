" Vim color file
" Converted from Textmate theme Bongzilla using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Bongzilla"

hi Cursor ctermfg=234 ctermbg=249 cterm=NONE guifg=#1f1f1f guibg=#b1b1b1 gui=NONE
hi Visual ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#253b76 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#353535 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#353535 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#353535 gui=NONE
hi LineNr ctermfg=245 ctermbg=236 cterm=NONE guifg=#8b8b8b guibg=#353535 gui=NONE
hi VertSplit ctermfg=240 ctermbg=240 cterm=NONE guifg=#5e5e5e guibg=#5e5e5e gui=NONE
hi MatchParen ctermfg=221 ctermbg=NONE cterm=underline guifg=#ffcc66 guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=240 cterm=bold guifg=#f8f8f8 guibg=#5e5e5e gui=bold
hi StatusLineNC ctermfg=231 ctermbg=240 cterm=NONE guifg=#f8f8f8 guibg=#5e5e5e gui=NONE
hi Pmenu ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff6400 guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#253b76 gui=NONE
hi IncSearch ctermfg=234 ctermbg=114 cterm=NONE guifg=#1f1f1f guibg=#78ce91 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi Folded ctermfg=249 ctermbg=234 cterm=NONE guifg=#aeaeae guibg=#1f1f1f gui=NONE

hi Normal ctermfg=231 ctermbg=234 cterm=NONE guifg=#f8f8f8 guibg=#1f1f1f gui=NONE
hi Boolean ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi Character ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi Comment ctermfg=249 ctermbg=NONE cterm=NONE guifg=#aeaeae guibg=NONE gui=NONE
hi Conditional ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi Constant ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi Define ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f8 guibg=#45810b gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#890606 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f8 guibg=#203553 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f8 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi Function ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff6400 guibg=NONE gui=NONE
hi Identifier ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi Keyword ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi Label ctermfg=114 ctermbg=NONE cterm=NONE guifg=#78ce91 guibg=NONE gui=NONE
hi NonText ctermfg=240 ctermbg=235 cterm=NONE guifg=#575757 guibg=#2a2a2a gui=NONE
hi Number ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi Operator ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi PreProc ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f8 guibg=NONE gui=NONE
hi SpecialKey ctermfg=240 ctermbg=236 cterm=NONE guifg=#575757 guibg=#353535 gui=NONE
hi Statement ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi StorageClass ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi String ctermfg=114 ctermbg=NONE cterm=NONE guifg=#78ce91 guibg=NONE gui=NONE
hi Tag ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff6400 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo ctermfg=249 ctermbg=NONE cterm=inverse,bold guifg=#aeaeae guibg=NONE gui=inverse,bold
hi Type ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff6400 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi rubyFunction ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff6400 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi rubyConstant ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=114 ctermbg=NONE cterm=NONE guifg=#78ce91 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bef895 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bef895 guibg=NONE gui=NONE
hi rubyInclude ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bef895 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=114 ctermbg=NONE cterm=NONE guifg=#78ce91 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=114 ctermbg=NONE cterm=NONE guifg=#78ce91 guibg=NONE gui=NONE
hi rubyEscape ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi rubyControl ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bef895 guibg=NONE gui=NONE
hi rubyOperator ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi rubyException ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bef895 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=249 ctermbg=NONE cterm=NONE guifg=#aeaeae guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi htmlTag ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7f90aa guibg=NONE gui=NONE
hi htmlEndTag ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7f90aa guibg=NONE gui=NONE
hi htmlTagName ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7f90aa guibg=NONE gui=NONE
hi htmlArg ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7f90aa guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffcc66 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff6400 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bef895 guibg=NONE gui=NONE
hi yamlAlias ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bef895 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=114 ctermbg=NONE cterm=NONE guifg=#78ce91 guibg=NONE gui=NONE
hi cssURL ctermfg=156 ctermbg=NONE cterm=NONE guifg=#bef895 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi cssColor ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff6400 guibg=NONE gui=NONE
hi cssClassName ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff6400 guibg=NONE gui=NONE
hi cssValueLength ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff593e guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=110 ctermbg=NONE cterm=NONE guifg=#8da6ce guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE