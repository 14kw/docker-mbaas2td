FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y apt-utils git vim
RUN curl -o ~/.vimrc -L https://gist.githubusercontent.com/14kw/5141131/raw/29e83b46950b8d1a1002812731fedaca71f6014d/vimrc 
RUN curl -o ~/.vim/colors/wombat.vim --create-dirs -L https://raw.githubusercontent.com/vim-scripts/Wombat/master/colors/wombat.vim

RUN curl -L git.io/nodebrew | perl - setup && echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bashrc
RUN . ~/.bashrc && nodebrew install-binary stable

RUN curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar" && chmod +x ~/.embulk/bin/embulk && echo 'export PATH="$HOME/.embulk/bin:$PATH"' >> ~/.bashrc
RUN curl -o ~/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest" && chmod +x ~/bin/digdag && echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
RUN . ~/.bashrc && embulk gem install embulk-filter-eval && embulk gem install embulk-filter-column && embulk gem install embulk-parser-jsonl