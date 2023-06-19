# QI-WEB_III-PROJETO_FINAL

Esse projeto tem como objetivo aplicar os conhecimentos adquiridos na disciplina de Web III no curso Têcnico em Informática das Escolas e Faculdades QI.

O projeto se baseia na criação de um site para automatizar os procedimentos de uma biblioteca de uma instituição de ensino.

# Índice

- [QI-WEB\_III-PROJETO\_FINAL](#qi-web_iii-projeto_final)
- [Índice](#índice)
  - [Conhecimentos desenvolvidos](#conhecimentos-desenvolvidos)
  - [Para execução do programa](#para-execução-do-programa)
    - [Bibliotecas Java](#bibliotecas-java)
    - [Banco de dados](#banco-de-dados)
    - [Programas e versões utilizados](#programas-e-versões-utilizados)

## Conhecimentos desenvolvidos

Para o desenvolvimento do projeto foram utilizados os conceitos e ferramentas abaixo:

**Tecnologias:**

- `Java JSP`: Para criação da lógica do site;
- `HTML`: Para criação do esqueleto;
- `CSS`: Para a criação e ajuste de layouts;
- `Bootstrap`: Usado para layout;

**Programas:**

- `Xampp`: Usado para criação do Banco de Dados através do MySQL;
- `Apache Tomcat`: Usado para hospedagem do site;
- `Netbenas`: IDE utilizada para criação de todo código.

## Para execução do programa

A pasta `"projeto_biblioteca"` possui todo código que permite ser importado dentro do Netbeans através da opção file -> open project.

Para utilizar o programa é necessário instalar e configurar os arquivos conforme abaixo.

### Bibliotecas Java

É necessário configurar as seguintes bibliotecas Java nas respectivas versões, localizadas na pasta `bibliotecas_java`, para que o projeto funcione.

- `javax.servlet.jar versão 2.5`;
- `MySQL Connector versão 8.0.33`

### Banco de dados

Para configurar o banco de dados corretamente respeitando os atributos, utilizar os arquivos dentro da pasta `banco_de_dados` conforme instruções abaixo:

- Utilizar arquivo `banco_de_dados_final.sql`: Para a importação do banco de dados com alguns dados de exemplo.
- Ou utilizar comando SQL no arquivo `criação_banco_dados.txt` -> Para criar o banco de dados sem dados preenchidos.

### Programas e versões utilizados

Foram utilizados os programas abaixos nas respectivas versões para a criação do projeto:

- `Netbeans na versão 18`;
- `Java Jakarta EE 10 Web`;
- `Java JDK na versão 20`;
- `Apache Tomcat na versão 10.1.7`: configurado com o usuário "admin" e senha "admin";
- `XAMPP na versão 3.3.0`: A porta utilizada para acessar o MySQL via servidor XAMPP Apache foi 3307
