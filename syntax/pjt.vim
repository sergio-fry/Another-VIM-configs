" Bail if our syntax is already loaded.
if exists('b:current_syntax') && b:current_syntax == 'pjt'
  finish
endif

syn keyword Keyword HIS FCX End Screen
syn keyword SpecialKey Server ServerOPC IP LOGIN PASSWORD MAXNUMFRAME REFRESHTIME TypeScreen  COMMENT KEY OBJECT NAME Caption FRAME COLOR FORMAT NODE IN DI OPNCLS POZT Z
syn keyword Constant LineView
