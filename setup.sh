#!/bin/sh

# update and upgrade package
pkg update -y
pkg upgrade -y

# install cmake dan golang
pkg install git cmake build-essential golang -y

# goto root
cd ~/

#clone ollama
git clone --depth 1 https://github.com/ollama/ollama.git

# go to directory ollama
cd ollama

# generate ollama
go generate ./...

# build ollama
go build .

# clean up go
chmod -R 700 ~/go
rm -r ~/go

# set up bin ollama
cp ~/ollama/ollama $PREFIX/bin/

# create started
cat << EOF > $PREFIX/bin/startollama
#!/bin/sh
export OLLAMA_HOST=0.0.0.0:11434
export OLLAMA_ORIGINS='*'
nohup ollama serve > /dev/null 2>&1&
EOF

chmod +x $PREFIX/bin/startollama

echo "Sekarang anda bisa menjalankan ollama dengan startollama dan cek ollama dengan ollama list";
echo "install module ollama yang anda inginkan"
