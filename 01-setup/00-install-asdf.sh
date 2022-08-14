#! /bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch release-v0.10.2

. ~/.asdf/asdf.sh

sudo apt-get install -y dirmngr gpg curl gawk unzip

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

