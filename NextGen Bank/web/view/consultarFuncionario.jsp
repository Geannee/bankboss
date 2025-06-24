<%-- 
    Document   : consultarDados
    Created on : 22 de jun. de 2025, 20:51:06
    Author     : geanne
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.persistencia.Funcionario"%>
<%@page import="controller.FuncionarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

String busca = request.getParameter("tipoBusca");

FuncionarioController funcionarioControl = new FuncionarioController();
List<Funcionario> todosFuncionario = new ArrayList<>();
    if(busca != null){
        if(busca.equals("todos")){//busca todos
            todosFuncionario = funcionarioControl.buscarTodos();
           /* for (Cliente cliente : todosClientes) {
                out.print(cliente.getNome());
                out.print(cliente.getCpf());
                out.print(cliente.getTelefone());
                out.print("<br>");
            }*/
       }else if(busca.equals("nome")){//busca por nome
            String nomeCliente = request.getParameter("nomeCliente");
            todosFuncionario = funcionarioControl.buscarPorNome(nomeCliente);
        }
    }else{
     //adicoinar logica caso busca invalida
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Consulta de Funcionario</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <style>
    body {
      background-image: url(../Prancheta\ 1.png);
        background-size: cover; /* Garante que a imagem cubra todo o fundo */
        background-position: center center; /* Centraliza a imagem */
        background-repeat: no-repeat; /* Impede que a imagem se repita */
        background-attachment: fixed; 
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', sans-serif;
        display: flex; /* Define o body como um container flexível */
        flex-direction: column; /* Empilha os itens verticalmente */
        justify-content: center; /* Centraliza os itens verticalmente no espaço restante */
        align-items: center; /* Centraliza os itens horizontalmente */
        height: 100vh; /* Garante que o body ocupe toda a altura da viewport */
    }

    h1 {
      color: #F28706;
      margin-bottom: 20px;
    }

    .container-busca {
      background-color: #1E71A6;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0,0,0,0.3);
      width: 460px;
    }

    .field-group {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
    }

    .field-group label {
      width: 100px;
      font-size: 15px;
    }

    .field-group input {
      flex: 1;
      padding: 8px;
      border-radius: 5px 0 0 5px;
      border: none;
      font-size: 15px;
    }

    .field-group button {
      padding: 8px 12px;
      font-size: 15px;
      background-color: #F28706;
      color: white;
      border: none;
      border-radius: 0 5px 5px 0;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .field-group button:hover {
      background-color: #1d4ed8;
    }

    .full-width {
      display: block;
      width: 100%;
      margin-top: 15px;
      padding: 10px;
      font-size: 15px;
      background-color: #2563eb;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .full-width:hover {
      background-color: #1d4ed8;
    }

    .results {
      margin-top: 30px;
      background-color: #1E71A6;
      padding: 20px;
      border-radius: 8px;
      width: 700px;
    }
    .list-all-btn {
        padding: 10px 20px;
        font-size: 15px;
        background-color: #2563eb;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-right: 10px;
     }

     .list-all-btn:hover {
        background-color: #1d4ed8;
    }
      #exit-btn {
      background-color: #c0392b;
    }
    .table-container {
        width: 100%;
        overflow-x: auto;
        border-radius: 8px;
}

.funcionario-table {
    width: 100%;
    border-collapse: collapse;
    background-color: #1e293b;
    color: white;
    min-width: 600px;
}

.funcionario-table th, .funcionario-table td {
    padding: 10px;
    border: 1px solid #334155;
    text-align: left;
}

.funcionario-table thead {
    background-color: #2563eb;
}

.center {
    text-align: center;
}

.icon-link {
    margin: 0 5px;
    font-size: 16px;
    text-decoration: none;
}

.icon-link.blue { color: #60a5fa; }
.icon-link.yellow { color: #facc15; }
.icon-link.red { color: #ef4444; }

.icon-link:hover {
  opacity: 0.8;
}

  </style>
</head>
<body>

  <h1>Consulta de Funcionario</h1>
<div class="container-busca">
<div class="container-form">
  <!-- Buscar por Nome -->
  <form method="get" action="consultaFuncionario.jsp">
    <div class="field-group">
      <label for="nome">Nome:</label>
      <input type="text" id="nome" name="nomeFuncionario" placeholder="Digite o nome">
      <button type="submit" name="tipoBusca" value="nome">Buscar</button>
    </div>
  </form>

  <!-- Buscar Todos -->
  <form method="get" action="consultaFuncionario.jsp">
    <div class="field-group" style="justify-content: center;">
      <button type="submit" name="tipoBusca" value="todos" class="list-all-btn">Buscar Todos</button>
    </div>
  </form>

  <!-- Botão Voltar -->
  <form method="get" action="inicio.jsp">
    <div class="field-group" style="justify-content: center;">
      <button type="submit" id="exit-btn">Voltar</button>
    </div>
  </form>

</div>
</div>

<!-- Resultados -->
<div class="results">
  <h3>Resultados:</h3>

  <div class="table-container">
    <table class="funcionario-table">
      <thead>
        <tr>
          <th>Nome</th>
          <th>CPF</th>
          <th>Telefone</th>
          <th class="center">Ações</th>
        </tr>
      </thead>
      <tbody>
        <%
          for (Funcionario funcionario:todosFuncionario) {
        %>
        <tr>
          <td><%= funcionario.getNome() %></td>
          <td><%= funcionario.getCpf() %></td>
          <td><%= funcionario.getTelefone() %></td>
          <td class="center">
            <a href="visualizarFuncionario.jsp?id=<%= funcionario.getId_funcionario() %>" title="Visualizar" class="icon-link blue"><i class="fas fa-eye"></i></a>
            <a href="editarFuncionario.jsp?id=<%= funcionario.getId_funcionario() %>" title="Editar" class="icon-link yellow"><i class="fas fa-edit"></i></a>
            <a href="desabilitarFuncionario.jsp?id=<%= funcionario.getId_funcionario() %>" title="Desabilitar" class="icon-link red"><i class="fas fa-user-slash"></i></a>
          </td>
        </tr>
        <%
          }
        %>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>

