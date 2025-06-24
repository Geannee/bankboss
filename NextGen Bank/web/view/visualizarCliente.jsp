<%-- 
    Document   : cadastraFuncionarioForm
    Created on : 13 de jun. de 2025, 08:43:54
    Author     : geanne
--%>

<%@page import="model.persistencia.Cliente"%>
<%@page import="controller.ClienteController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ClienteController clienteControl = new ClienteController();
    Cliente cliente = clienteControl.buscarPorId(id); 
  //  out.print(cliente.getEndereco().getId_endereco());
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Visualizar Cliente</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            background-color: #1E71A6;
            color: #ffffff;
            font-family: 'Segoe UI', sans-serif;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .card {
            background-color: #1e293b;
            padding: 30px;
            border-radius: 10px;
            width: 500px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }

        .card h2 {
            color: #60a5fa;
            margin-bottom: 20px;
        }

        .card p {
            margin: 10px 0;
            font-size: 16px;
        }

        .actions {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: 0.3s;
        }

        .btn.edit { background-color: #facc15; color: #000; }
        .btn.edit:hover { background-color: #eab308; }

        .btn.deactivate { background-color: #3b82f6; }
        .btn.deactivate:hover { background-color: #2563eb; }

        .btn.delete { background-color: #ef4444; }
        .btn.delete:hover { background-color: #dc2626; }
        .card {
    background-color: #1e293b;
    padding: 30px;
    border-radius: 12px;
    width: 100%;
    max-width: 600px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

.card h2 {
    margin-top: 0;
    margin-bottom: 20px;
    font-size: 24px;
    color: #f8fafc;
    border-bottom: 1px solid #334155;
    padding-bottom: 10px;
}

.card p {
    margin-bottom: 10px;
    font-size: 16px;
    line-height: 1.5;
}

.card label {
    font-weight: 600;
    display: block;
    margin-bottom: 5px;
    color: #e2e8f0;
}

.card input[type="text"],
.card input[type="number"] {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #334155;
    border-radius: 6px;
    background-color: #0f172a;
    color: #ffffff;
    margin-bottom: 12px;
    font-size: 15px;
    box-sizing: border-box;
}

.card input[type="text"]::placeholder {
    color: #94a3b8;
}

.actions {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 20px;
}

.btn {
    padding: 10px 16px;
    border: none;
    border-radius: 6px;
    text-decoration: none;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s;
    display: inline-flex;
    align-items: center;
    gap: 8px;
}

.btn.edit {
    background-color: #3b82f6;
    color: #ffffff;
}

.btn.edit:hover {
    background-color: #2563eb;
}

.btn.deactivate {
    background-color: #f59e0b;
    color: #ffffff;
}

.btn.deactivate:hover {
    background-color: #d97706;
}

.btn.delete {
    background-color: #ef4444;
    color: #ffffff;
}

.btn.delete:hover {
    background-color: #dc2626;
}


    </style>
</head>
<body>
     <div class="card">
        <h2>Dados do Cliente</h2>
        <p><strong>Nome:</strong> <%= cliente.getNome() %></p>
        <p><strong>CPF:</strong> <%= cliente.getCpf() %></p>
        <p><strong>Telefone:</strong> <%= cliente.getTelefone() %></p>
        <p><strong>Endereço:</strong> 
            <%= cliente.getEndereco().getLocal() %>, 
            nº <%= cliente.getEndereco().getNumero_casa() %>, 
            <%= cliente.getEndereco().getBairro() %> – 
            <%= cliente.getEndereco().getCidade() %> / 
            <%= cliente.getEndereco().getEstado() %> – CEP: 
            <%= cliente.getEndereco().getCep() %>
        </p>

        <div class="actions">
            <a href="formAlterarCliente.jsp?id=<%= cliente.getId_cliente() %>" id="btn-alterar" class="btn edit"><i class="fas fa-edit"></i> Alterar</a>
            <a href="desabilitarCliente.jsp?id=<%= cliente.getId_cliente() %>" class="btn deactivate"><i class="fas fa-user-slash"></i> Desativar</a>
            <a href="excluirCliente.jsp?id=<%= cliente.getId_cliente() %>" class="btn delete"><i class="fas fa-trash"></i> Excluir</a>
        </div>
        
    </div>  
   <footer>
    &copy; 2025 BankBoss — Sistema de Gerenciamento Bancário Seguro
  </footer>
</body>
</html>

