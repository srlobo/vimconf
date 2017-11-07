vimconf
=======

Vim configuration

Incluye:
* jedi-vim: autocompletion para python
* nerdtree: Gestor de archivos (pulsar F7)
* pytest.vim: Corre tus tests desde vim. <ESC><SPACE>f por ejemplo
* tagbar: Listado de funciones (pulsar F8)
* vim-git: Mejora del formato de mensajes de commit git
* vim-javascript: syntax higlight e indentación para JS
* vim-py-encoding: Codificación de archivos vim según pep263
* vim-python-pep8-indent: Indentación python según pep8

Para usarlo:
```shell
git clone https://github.com/srlobo/vimconf.git
ln -s vimconf/vim .vim
ln -s vimconf/vimrc .vimrc
cd vimconf
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
```

Cosas a mirar:
http://www.sontek.net/blog/2011/05/07/turning_vim_into_a_modern_python_ide.html
http://www.raditha.com/blog/archives/good-bye-python-mode/
https://www.google.es/search?q=refacyor+esitor+python&ie=UTF-8&oe=UTF-8&hl=es&client=safari#hl=es&q=refactor+editor+python
