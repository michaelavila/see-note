" Note: [example note]
" ~~~~~~~~~~~~~~~~~~
" This note is used to show some of the stuff going on here.

function! NoteFromToCommand(from, to)
  let note = matchstr(getline("."), a:from . ': \[\zs.*\ze\]')
  if empty(note)
    echom 'No note on this line.'
  else
    call NoteNoteToCommand(note, a:to)
  endif
endfunction

function! NoteNoteToCommand(note, to)
  execute 'vimgrep /' . a:to . ': \[' . a:note . '\]/ **'
endfunction

" - popluate quickfix list with note on line under cursor in source
" See: [example note]
function! FindNote()
  call NoteFromToCommand('note', 'see')
endfunction

" - goto definition of note on line under cursor
" See: [example note]
function! GotoNote()
  call NoteFromToCommand('see', 'note')
endfunction

" - populate quickfix list with all notes
" See: [example note]
function! ListNotes()
  call NoteNoteToCommand('.*', 'note')
endfunction
