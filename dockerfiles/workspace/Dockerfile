FROM golang

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y zsh
RUN apt-get install -y vim
RUN apt-get install -y mysql-client

RUN go get -u github.com/alecthomas/gometalinter
RUN go get -u github.com/golang/dep/cmd/dep
RUN /go/bin/gometalinter --install

RUN apt-get install -y git build-essential ncurses-dev lua5.2 lua5.2-dev

CMD ["/bin/zsh"]
