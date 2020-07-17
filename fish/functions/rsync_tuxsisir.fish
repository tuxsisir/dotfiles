function rsync_tuxsisir
    rsync -arv --exclude=.DS_Store ~/vimwiki/wiki/cheatsheet-pages/ ~/projects/portfolio/src/cheatsheet-pages/
    rsync -arv --exclude=.DS_Store ~/vimwiki/wiki/notes-pages/ ~/projects/portfolio/src/notes-pages/
end
