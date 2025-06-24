<%-- 
    Document   : cadastraFuncionarioForm
    Created on : 13 de jun. de 2025, 08:43:54
    Author     : geanne
--%>

<%@page import="controller.ClienteController"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.persistencia.Cliente"%>
<%@page import="model.persistencia.Endereco"%>

<%// Dados do cliente
int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
String nome = request.getParameter("nome");
String cpf = request.getParameter("cpf");
//String dataNascimentoStr = request.getParameter("data_nascimento");
//Date dataNascimento = null;

String telefone = request.getParameter("telefone");
String senha = request.getParameter("senha");
String otp = request.getParameter("otp");

// Endereço
int id_endereco = Integer.parseInt(request.getParameter("id_endereco"));
String cep = request.getParameter("cep");
String local = request.getParameter("local");
int numeroCasa = Integer.parseInt(request.getParameter("numero_casa"));
String bairro = request.getParameter("bairro");
String cidade = request.getParameter("cidade");
String estado = request.getParameter("estado");
String complemento = request.getParameter("complemento");

//Teste para verificar se os dados estão nas variaveis
//out.print(complemento);

Endereco endereco = new Endereco();

endereco.setId_endereco(id_endereco);
endereco.setBairro(bairro);
endereco.setCep(cep);
endereco.setCidade(cidade);
endereco.setComplemento(complemento);
endereco.setLocal(local);
endereco.setNumero_casa(numeroCasa);
endereco.setCidade(cidade);

//agora montar o objeto cliente
Cliente cliente = new Cliente();

cliente.setId_cliente(id_cliente);
cliente.setId_usuario(id_usuario);
cliente.setNome(nome);
//cliente.setData_nascimento(dataNascimento);
cliente.setCpf(cpf);
cliente.setSenha_hash(senha);
cliente.setOtp_ativo(otp);
cliente.setTelefone(telefone);
cliente.setEndereco(endereco);

//agora vamos passar o objeto cliente para o controller

ClienteController clienteControl = new ClienteController();

cliente = clienteControl.alterarCliente(cliente);


%>


