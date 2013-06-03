"ensures we only load once
if !exists("project_configuration")
  let project_configuration = 1
  execute "set tags=" . g:project_root . "/tags"
  execute "cs add " . g:project_root . "/cscope.out"
  echomsg "Project root set to " . g:project_root . ". Project type set to " . g:project_type
endif
