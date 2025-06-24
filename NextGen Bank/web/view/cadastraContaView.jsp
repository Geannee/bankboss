

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="controller.ClienteController"%>
<%@page import="model.persistencia.Endereco"%>
<%@page import="model.persistencia.Cliente"%>
<%@page import="java.util.Enumeration"%>
<%// Dados do cliente
String nome = request.getParameter("nome");
String cpf = request.getParameter("cpf");
String dataStr = request.getParameter("data_nascimento");
// Converte diretamente, sem try-catch
java.sql.Date dataNascimento = java.sql.Date.valueOf(dataStr);
String telefone = request.getParameter("telefone");
String senha = request.getParameter("senha");
String otp = request.getParameter("otp");

// Endereço
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

endereco.setBairro(bairro);
endereco.setCep(cep);
endereco.setCidade(cidade);
endereco.setComplemento(complemento);
endereco.setLocal(local);
endereco.setNumero_casa(numeroCasa);
endereco.setCidade(cidade);

//agora montar o objeto cliente
Cliente cliente = new Cliente();

cliente.setNome(nome);
cliente.setData_nascimento(dataNascimento);
cliente.setCpf(cpf);
cliente.setSenha_hash(senha);
cliente.setOtp_ativo(otp);
cliente.setTelefone(telefone);
cliente.setEndereco(endereco);

//agora vamos passar o objeto cliente para o controller

ClienteController clienteControl = new ClienteController();

cliente = clienteControl.cadastrar(cliente);

    if(cliente == null){
%>
        <script>  
            alert("Não foi possível cadastrar: o CPF informado já está em uso.");
            window.history.back(); // Volta para o formulário
        </script>
<%
    } else {
%>
        <script>
            alert("Cadastro realizado com sucesso!");
            //volta para menus
            window.location.href = "inicio.jsp";
        </script>
        <%= cliente.toString() %>
<%
    }

%>

