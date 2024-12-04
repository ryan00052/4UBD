-- Tabela Condominio
CREATE TABLE Condominio (
    idCondominio VARCHAR2(8) PRIMARY KEY,
    nome VARCHAR2(50) NOT NULL,
    endereco VARCHAR2(50),
    num NUMBER,
    cep VARCHAR2(15),
    bairro VARCHAR2(30),
    cidade VARCHAR2(20),
    estado VARCHAR2(15),
    proprietario VARCHAR2(45),
    cnpj VARCHAR2(15)
);

-- Tabela Morador
CREATE TABLE Morador (
    idMorador NUMBER PRIMARY KEY,
    bloco VARCHAR2(10) NOT NULL,
    numApart NUMBER NOT NULL,
    valorAluguel FLOAT NOT NULL,
    Condominios_idCondominio VARCHAR2(8) NOT NULL,
    CONSTRAINT fk_Morador_Condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES Condominio(idCondominio)
);

-- Tabela Sindico
CREATE TABLE Sindico (
    inicioMandato DATE NOT NULL,
    fimMandato DATE,
    Condominios_idCondominio VARCHAR2(8) NOT NULL,
    CONSTRAINT fk_Sindico_Condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES Condominio(idCondominio)
);

-- Tabela Condominos
CREATE TABLE Condominos (
    idCondomino VARCHAR2(10) PRIMARY KEY,
    nome VARCHAR2(50) NOT NULL,
    cpf VARCHAR2(15) UNIQUE NOT NULL,
    email VARCHAR2(50),
    senha VARCHAR2(50) NOT NULL,
    tipo VARCHAR2(15) UNIQUE NOT NULL,
    Condominios_idCondominio VARCHAR2(8) NOT NULL,
    CONSTRAINT fk_Condominos_Condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES Condominio(idCondominio)
);

-- Tabela Tarefas
CREATE TABLE Tarefas (
    idTarefa NUMBER PRIMARY KEY,
    nome VARCHAR2(45) NOT NULL,
    status VARCHAR2(15),
    dataConclusao DATE,
    descricao VARCHAR2(45),
    Condominios_idCondominio VARCHAR2(8) NOT NULL,
    CONSTRAINT fk_Tarefas_Condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES Condominio(idCondominio)
);

-- Tabela Portaria
CREATE TABLE Portaria (
    idPortaria NUMBER PRIMARY KEY,
    porteiro VARCHAR2(45) NOT NULL,
    Condominios_idCondominio VARCHAR2(8) NOT NULL,
    CONSTRAINT fk_Portaria_Condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES Condominio(idCondominio)
);

-- Tabela Mensagem
CREATE TABLE Mensagem (
    idMensagem NUMBER PRIMARY KEY,
    destinatario VARCHAR2(50) NOT NULL,
    mensagem VARCHAR2(50) NOT NULL,
    Condominios_idCondominio VARCHAR2(8) NOT NULL,
    Portarias_idPortaria NUMBER,
    CONSTRAINT fk_Mensagem_Condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES Condominio(idCondominio),
    CONSTRAINT fk_Mensagem_Portaria FOREIGN KEY (Portarias_idPortaria)
        REFERENCES Portaria(idPortaria)
);

-- Tabela Solicitacoes
CREATE TABLE Solicitacoes (
    idSolicitacao NUMBER PRIMARY KEY,
    solicitacao VARCHAR2(50) NOT NULL,
    justificativa VARCHAR2(60),
    Condominios_idCondominio VARCHAR2(8) NOT NULL,
    CONSTRAINT fk_Solicitacoes_Condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES Condominio(idCondominio)
);
