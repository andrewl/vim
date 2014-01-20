"ensures we only load once
if !exists("project_configuration")
  let project_configuration = 1
  execute "set tags=" . g:project_root . "/tags"
  execute "cs add " . g:project_root . "/cscope.out"

  if (g:project_type == 'drupal') 
    autocmd BufWritePre g:project_root . "/*" :%s/\s\+$//e
  endif

  nmap <leader>T :!~/.vim/helpers/php_scope_and_tags.sh g:project_root
endif
