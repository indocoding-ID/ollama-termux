#!/bin/sh

# update and upgrade package
pkg update -y
pkg upgrade -y

# install tur repo
pkg install tur-repo -y
# install ollama
pkg install ollama -y
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
