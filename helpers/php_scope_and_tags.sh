#!/bin/bash
cd $1 && ~/bin/ctags --langmap=php:.engine.inc.module.theme.install.php.test --php-kinds=cdfi --languages=php --recurse
find $1 -iname *.inc -o -iname *.module -o -iname *.theme -o -iname *.php -o -iname *.install > $1/cscope.files
cd $1 && cscope -b
