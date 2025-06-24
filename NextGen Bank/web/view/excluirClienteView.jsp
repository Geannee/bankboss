<%-- 
    Document   : cadastraFuncionarioForm
    Created on : 13 de jun. de 2025, 08:43:54
    Author     : geanne
--%>

<%@page import="controller.ClienteController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    
int id = Integer.parseInt(request.getParameter("id"));
ClienteController clienteControl = new ClienteController();

clienteControl.excluir(id);


%>
