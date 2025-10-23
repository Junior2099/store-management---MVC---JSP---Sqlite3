# Sistema de Gestão de Materiais - Paraíso Gráfica Rápida

Sistema web desenvolvido em Java JSP para gerenciar materiais de uma gráfica, utilizando o template Gentelella e banco de dados SQLite.

## Características

- **Interface moderna**: Baseada no template Gentelella Bootstrap
- **Sistema de autenticação**: Login com usuário admin/senha admin
- **CRUD completo**: Criar, listar, editar e excluir materiais
- **Dashboard informativo**: Estatísticas e relatórios
- **Banco SQLite**: Banco de dados leve e portável
- **Responsivo**: Interface adaptável para diferentes dispositivos

## Tecnologias Utilizadas

- **Java 11**
- **JSP (JavaServer Pages)**
- **Servlets**
- **SQLite 3**
- **Maven**
- **Bootstrap 4**
- **jQuery**
- **DataTables**

## Estrutura do Projeto

```
sistema-materiais/
├── src/main/java/com/paraisografica/
│   ├── model/          # Modelos de dados
│   ├── dao/            # Data Access Objects
│   ├── servlet/        # Servlets
│   └── util/           # Utilitários
├── src/main/webapp/
│   ├── WEB-INF/views/  # Páginas JSP
│   └── assets/        # Recursos estáticos
├── database/           # Banco SQLite
└── pom.xml            # Configuração Maven
```

## Pré-requisitos

- Java 11 ou superior
- Maven 3.6 ou superior
- Navegador web moderno

## Como Executar

### Opção 1: Scripts Automáticos (Recomendado)

**Para Teste Rápido:**
```bash
testar-sistema.bat
```

**Para Tomcat:**
```bash
executar.bat
```

**Para Jetty:**
```bash
executar-jetty.bat
```

**Para Debug:**
```bash
executar-debug.bat
```

### Opção 2: Comandos Manuais

**1. Compilar o Projeto**
```bash
mvn clean compile
```

**2. Executar com Tomcat**
```bash
mvn tomcat7:run
```

**3. Executar com Jetty**
```bash
mvn jetty:run
```

### 3. Acessar o Sistema

Abra o navegador e acesse: `http://localhost:8080/sistema-materiais`

### 4. Fazer Login

- **Usuário**: admin
- **Senha**: admin

## Funcionalidades

### Dashboard
- Estatísticas gerais dos materiais
- Materiais com estoque baixo
- Distribuição por categoria
- Ações rápidas

### Gerenciamento de Materiais
- **Listar**: Visualizar todos os materiais em tabela
- **Adicionar**: Cadastrar novos materiais
- **Editar**: Modificar dados existentes
- **Excluir**: Remover materiais
- **Buscar**: Filtrar por nome ou categoria

### Campos do Material
- Nome
- Descrição
- Categoria (Papel, Tinta, Acessórios, Equipamentos, Outros)
- Quantidade em estoque
- Preço unitário
- Fornecedor
- Data de cadastro e atualização

## Banco de Dados

O sistema utiliza SQLite com as seguintes tabelas:

### Tabela `usuarios`
- id (INTEGER PRIMARY KEY)
- username (TEXT UNIQUE)
- password (TEXT)
- nome (TEXT)
- email (TEXT)
- role (TEXT)

### Tabela `materiais`
- id (INTEGER PRIMARY KEY)
- nome (TEXT)
- descricao (TEXT)
- categoria (TEXT)
- quantidade (INTEGER)
- preco_unitario (REAL)
- fornecedor (TEXT)
- data_cadastro (TEXT)
- data_atualizacao (TEXT)

## Dados de Exemplo

O sistema já vem com alguns materiais de exemplo:
- Papel A4 75g
- Tinta Preta HP
- Cartão 300g
- Tinta Colorida Canon
- Envelope A4

## Estrutura de Arquivos

### Modelos (Model)
- `Material.java`: Representa um material
- `Usuario.java`: Representa um usuário

### DAOs (Data Access Object)
- `MaterialDAO.java`: Operações com materiais
- `UsuarioDAO.java`: Operações com usuários

### Servlets
- `LoginServlet.java`: Autenticação
- `LogoutServlet.java`: Logout
- `DashboardServlet.java`: Dashboard principal
- `MaterialServlet.java`: CRUD de materiais
- `AuthFilter.java`: Filtro de autenticação

### Páginas JSP
- `login.jsp`: Página de login
- `dashboard.jsp`: Dashboard principal
- `materiais.jsp`: Lista de materiais
- `material-form.jsp`: Formulário de material
- `erro.jsp`: Página de erro

## Personalização

### Adicionar Novas Categorias
Edite o arquivo `material-form.jsp` e adicione novas opções no select de categoria.

### Modificar Layout
Os arquivos CSS estão em `src/main/webapp/assets/css/` e podem ser personalizados.

### Adicionar Novos Campos
1. Modifique a classe `Material.java`
2. Atualize o `MaterialDAO.java`
3. Edite as páginas JSP correspondentes

## Solução de Problemas

### Erro de Conexão com Banco
- Verifique se o diretório `database/` existe
- Confirme as permissões de escrita

### Erro de Compilação
- Verifique se o Java 11 está instalado
- Execute `mvn clean` antes de compilar

### Página não carrega
- Verifique se o Tomcat está rodando na porta 8080
- Confirme se todas as dependências foram baixadas

## Desenvolvimento

### Adicionar Novas Funcionalidades
1. Crie o modelo de dados
2. Implemente o DAO
3. Crie o Servlet
4. Desenvolva as páginas JSP
5. Teste a funcionalidade

### Estrutura de Pacotes
- `com.paraisografica.model`: Modelos de dados
- `com.paraisografica.dao`: Acesso a dados
- `com.paraisografica.servlet`: Controllers
- `com.paraisografica.util`: Utilitários

## Licença

Este projeto foi desenvolvido para fins educacionais (projeto integrador) e também para utilização própria.

## Suporte

Para dúvidas ou problemas, verifique:
1. Logs do servidor
2. Console do navegador
3. Banco de dados SQLite
4. Configurações do Maven
