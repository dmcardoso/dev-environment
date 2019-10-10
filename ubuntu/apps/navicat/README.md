# Instalando e crackeando Navicat no linux


### Video Tutorial
https://www.youtube.com/watch?v=kTybqg9oxEc&feature=youtu.be

### Baixe a versão mais recente do navicat para linux e extraia  
https://www.navicat.com/en/download/navicat-premium

### Baixe a versão mais recente do crack e extraia  
https://github.com/DoubleLabyrinth/navicat-keygen/releases

### Copie a pasta extraida para o diretorio "opt" e coloque o nome dela como navicat  
> sudo cp -r "navicat121_premium_en_x64/" "/opt/navicat"

Para os proximos passos é necessario entrar em modo root(Comando "su").

**Execute como wine o arquivo "navicat-patcher.exe" extraido na pasta do crack indicando o diretório de libs do Navicat.**  
> wine navicat-patcher.exe "/opt/navicat/Navicat"

**Um registro pem com nome "RegPrivateKey.pem" será gerado no diretório atual, depois executar o comando:**  
> wine navicat-keygen.exe -text RegPrivateKey.pem

### Opções:
Selecionar premium: 1  
Selecionar ingles: 0(portugues não vai funcionar)  
Mantenha o CMD aberto e inicie o navicat  

* Desligar a conexão com a internet e adicionar o serial gerado, depois selecionar "ativar manualmente"  
* Copie o codigo e cole no CMD  
* Depois inserira a nova licença e confirme a ativação no navicat  