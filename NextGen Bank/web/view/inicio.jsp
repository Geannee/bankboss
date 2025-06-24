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
  <title>Menu do Funcionário - bankBoss</title>
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
    
    .logo-container { /* Adicionado o ponto para referenciar a classe */
        text-align: center; /* Centraliza o logo */
        margin-bottom: 20px; /* Adiciona algum espaço abaixo do logo */
        /* Remova height: 100px; e width: 300px; daqui se eles estiverem. Eles devem estar na imagem. */
    }

    .logo-container img {
        width: 300px;
        height: 100px;
    }

    .container {
      background-color: #1E71A6;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 30px rgba(0,0,0,0.3);
      width: 1100px;
      text-align: center;
    }

    h1 {
      margin-bottom: 30px;
      color: #fffffff;
    }

    .menu-link {
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      font-size: 16px;
      color: #000000;
      background-color: #ffffff;
      text-decoration: none;
      border-radius: 6px;
      transition: background-color 0.3s ease;
      cursor: pointer;
    }

    .menu-link:hover {
      background-color: #1E71A6;
    }

    .menu-link.sair {
      background-color: #d88509;
    }

    .menu-link.sair:hover {
      background-color: #33A8D0;
    }

    .submenu {
      max-height: 0;
      overflow: hidden;
      transition: max-height 0.4s ease;
      text-align: left;
    }

    .submenu.open {
      max-height: 500px;
    }

    .submenu a {
      display: block;
      padding: 8px 12px;
      margin: 4px 0;
      background-color: #d88509;
      color: #ffffff;
      text-decoration: none;
      border-radius: 4px;
      font-size: 14px;
      transition: background-color 0.2s ease;
    }

    .submenu a:hover {
      background-color: #fffff;
    }

    .icon {
      margin-left: 8px;
    }
  </style>
</head>
<body>
    <div class="logo-container">
        <img src="../gklogohorizontal.png" alt="gklogohorizontal.png"style="width:300px; height:150px;"/>
    
    </div>

    <div class="container">
        <h1>Menu do Funcionário</h1>
        <a href="FormCadastroUsuario.jsp" class="menu-link">Cadastrar Usuários</a>
        
       

        <div class="menu-link" onclick="toggleSubmenu(this)">
          Consulta de Dados <i class="fas fa-chevron-down icon"></i>
        </div>
        <div class="submenu">
          <a href="consultaCliente.jsp">Cliente</a>
          <a href="consultarFuncionario.jsp">Funcionario</a>
         
        </div>

        <div class="menu-link" onclick="toggleSubmenu(this)">
          Relatórios Avançados <i class="fas fa-chevron-down icon"></i>
        </div>
        <div class="submenu">
          <a href="#">...</a>
          <a href="#">...</a>
          <a href="#">...</a>
        </div>

        <div class="menu-link" onclick="toggleSubmenu(this)">
          Análise de Riscos <i class="fas fa-chevron-down icon"></i>
        </div>
        <div class="submenu">
          <a href="#">Risco de Transações</a>
          <a href="#">Alerta de Fraudes</a>
          <a href="#">Score de Crédito</a>
        </div>

        <a href="/alteracoes" class="menu-link">Alteração de Dados</a>
        <a href="/relatorios" class="menu-link">Geração de Relatórios</a>
        <a href="/logout" class="menu-link sair">Sair</a>
    </div>

    <script>
      function toggleSubmenu(clickedElement) {
        const submenu = clickedElement.nextElementSibling;
        const icon = clickedElement.querySelector('.icon');
        const isOpen = submenu.classList.contains('open');

        // Fecha todos os submenus
        document.querySelectorAll('.submenu').forEach(sm => sm.classList.remove('open'));
        document.querySelectorAll('.icon').forEach(ic => {
          ic.classList.remove('fa-chevron-up');
          ic.classList.add('fa-chevron-down');
        });

        // Se estava fechado, abre o submenu clicado
        if (!isOpen) {
          submenu.classList.add('open');
          icon.classList.remove('fa-chevron-down');
          icon.classList.add('fa-chevron-up');
        }
      }
    </script>
</body>
</html>