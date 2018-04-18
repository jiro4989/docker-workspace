FROM ubuntu

RUN mkdir $HOME/tmp
RUN mkdir $HOME/go
RUN echo 'export GOPATH=$HOME/go' >> ~/.bashrc
RUN echo 'export GOBIN=$GOPATH/bin' >> ~/.bashrc
RUN echo 'export PATH=$PATH:$GOPATH:$GOBIN' >> ~/.bashrc

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y zsh
RUN apt-get install -y golang
#RUN go get -u github.com/alecthomas/gometalinter
#RUN go get -u github.com/golang/dep/cmd/dep

RUN apt-get install -y git build-essential ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev

RUN cd /opt/ \
&& git clone https://github.com/vim/vim  \ 
&& cd vim/ \
&& ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic  \
&& make \
&& make install

RUN mkdir -p ~/.config
RUN git clone https://github.com/jiro4989/dotfiles.git ~/dotfiles
RUN git clone https://github.com/Shougo/dein.vim.git ~/dotfiles/vim/dein
RUN ln -sf ~/dotfiles/vim ~/.vim
RUN ln -sf ~/dotfiles/vim/rc/.vimrc ~/.vimrc
RUN ln -sf ~/dotfiles/vim/rc ~/.config/vim

CMD ["/bin/zsh"]
