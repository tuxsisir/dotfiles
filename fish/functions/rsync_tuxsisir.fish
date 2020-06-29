function rsync_tuxsisir
    rsync -arv --exclude=.DS_Store ~/vimwiki/wiki/cheatsheet-pages/ ~/projects/portfolio/src/cheatsheet-pages/
    rsync -arv --exclude=.DS_Store ~/vimwiki/wiki/blog-pages/ ~/projects/portfolio/src/blog-pages/
end
