<%-- 
    Document   : cadastraFuncionarioForm
    Created on : 13 de jun. de 2025, 08:43:54
    Author     : geanne
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastro de Cliente - NEXTGENBANK </title>
  <style>
    * {
      box-sizing: border-box;
    }

    body {
       background-image: url(../Prancheta\ 1.png);/* Caminho da sua imagem */
      background-size: cover; /* Garante que a imagem cubra toda a área */
      background-position: center center; /* Centraliza a imagem no fundo */
      background-repeat: no-repeat; /* Impede que a imagem se repita */
      background-attachment: fixed; /* Opcional: Mantém a imagem fixa ao rolar a página */
      font-family: Montserrat, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    header {
   
      padding: 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
    }

    header img {
      height: 20px;
      margin-right: 15px;
    }

    .container {
      flex: 1;
      background-color: #1E71A6;
      padding: 30px;
      margin: 30px auto;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      max-width: 1100px;
      width: 100%;
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #d88509;
    }

    h3 {
      margin-top: 30px;
      color: #d88509;
    }

    label {
      display: block;
      margin-top: 15px;
      font-weight: white;
    }

    input, select {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button {
      margin-top: 25px;
      width: 100%;
      padding: 12px;
      background-color: #d88509;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    button:hover {
      background-color: #1e40af;
    }

    footer {
      background-color: #8d65a2;
      color: #9ca3af;
      text-align: center;
      padding: 15px;
      font-size: 13px;
    }
  </style>
</head>
<body>

  <header>
     
       <img src="../gklogohorizontal.png" alt="gklogohorizontal.png"style="width:300px; height:150px;"/>
    
    
  
  </header>

  <div class="container">
    <h2>Cadastro Cliente</h2>
    <form method="POST" action="cadastraContaView.jsp">

      <!-- Dados do cliente -->
      <label for="nome">Nome Completo:</label>
      <input type="text" id="nome" name="nome" required>

      <label for="cpf">CPF:</label>
      <input type="text" id="cpf" name="cpf" maxlength="14" placeholder="000.000.000-00" required>

      <label for="data_nascimento">Data de Nascimento:</label>
      <input type="date" id="data_nascimento" name="data_nascimento" required>

      <label for="telefone">Telefone:</label>
      <input type="text" id="telefone" name="telefone" placeholder="(00) 00000-0000" required>
      
      <label for="e-mail">E-mail:</label>
      <input type="e-mail" id="e-mail" name="e-mail" required>

      <label for="senha">Senha:</label>
      <input type="password" id="senha" name="senha" required>

      <label for="Confirmar Senha">Confirmar Senha:</label>
      <input type="Confirmar Senha" id="ConfirmarSenha="Confirmar Senha" required>

  

      <button type="submit">Cadastrar Cliente</button>
    </form>
  </div>

  <footer>
    &copy; 2025 BankBoss — Sistema de Gerenciamento Bancário Seguro
  </footer>

</body>
</html>
