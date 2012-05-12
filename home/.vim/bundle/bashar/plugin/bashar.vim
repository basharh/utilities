
if exists("loaded_bashar")
  finish
endif
let loaded_bashar = 1

augroup bashar
  "load all bashar plugin parts after vim starts
  autocmd VimEnter * runtime! bashar_parts/**/*.vim
augroup END
