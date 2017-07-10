FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y apt-utils git vim
RUN curl -o ~/.vimrc -L https://gist.githubusercontent.com/14kw/5141131/raw/29e83b46950b8d1a1002812731fedaca71f6014d/vimrc 
RUN curl -o ~/.vim/colors/wombat.vim --create-dirs -L http://files.werx.dk/wombat.vim
RUN curl -o ~/.vim/plugin/guicolorscheme.vim --create-dirs -L https://raw.githubusercontent.com/vim-scripts/guicolorscheme.vim/master/plugin/guicolorscheme.vim

RUN curl -L git.io/nodebrew | perl - setup && echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bashrc
RUN . ~/.bashrc
RUN ~/.nodebrew/current/bin/nodebrew install-binary stable

RUN curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar"
RUN chmod +x ~/.embulk/bin/embulk
RUN echo 'export PATH="$HOME/.embulk/bin:$PATH"' >> ~/.bashrc
RUN curl -o ~/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest"
RUN chmod +x ~/bin/digdag
RUN echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
RUN . ~/.bashrc