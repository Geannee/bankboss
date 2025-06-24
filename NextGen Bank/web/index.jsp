<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Área do Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../styles/bootstrap.css">
    <link rel="stylesheet" href="../styles/index.css">
    <style>
 /* Configuração da tela dividida */
        .container-fluid {
            display: flex;
            height: 100vh;
        }

        /* Logo à esquerda */
        .logo-container {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Formulário à direita */
        .form-container {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* Adicionando uma pequena margem ao conteúdo do formulário */
        .form-content {
            width: 100%;
            max-width: 400px;
            display: flex;
            flex-direction: column;
        }

        /* Estilização do título */
        h1 {
           
            font-family: myfonte, progressive soul;
            src: url('./https://www.dafont.com/progressive-soul.font');
            font-size: 42px;
            color: #F28706;
            font-weight: bold;
            margin-bottom: -150px; /* Espaçamento entre o título e o formulário */
        }

        /* Fundo azulado do formulário */
        .form-background {
            background-color: #1E71A6; /* Cor azul escura */
            padding: 20px; /* Espaçamento interno ao redor do formulário */
            border-radius: 8px; /* Deixa o fundo com bordas arredondadas */
        }
        .form-background .form-label {
            color: #1E71A6; /* Cor branca para as labels */
        }
        /* Adicionar um fundo de cor ou gradiente se necessário */
       .container-fluid {
            display: flex;
            height: 100vh; /* Garante que o container ocupe a altura total da viewport */
            width: 100vw; /* Garante que o container ocupe a largura total da viewport */
            
            /* -------- AQUI VOCÊ VAI INSERIR SEU PNG COMO BACKGROUND -------- */
            background-image: url('Prancheta 1.png');
            background-size: cover; /* Faz a imagem cobrir todo o elemento, cortando se necessário */
            background-position: center center; /* Centraliza a imagem no elemento */
            background-repeat: no-repeat; /* Evita que a imagem se repita */
            background-attachment: fixed; /* Opcional: fixa a imagem de background para que ela não role com o conteúdo */
            
            background-color: #112E4F; 
        }
         button {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #F28706;
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
            background-color: #111827;
            color: #9ca3af;
            text-align: center;
            padding: 15px;
            font-size: 13px;
          }
    </style>
</head>
<body>
    <div class="container-fluid min-vh-150 d-flex">
        
        
        <div class="logo-container d-flex flex-column justify-content-center align-items-center">
            
            <div class="logo-container d-flex flex-column justify-content-center align-items-center">
                <img src="Bankboss.png" alt="Bankboss.png"class="img-fluid" style="max-width: 600px;"/>
   
</div>
     
              
        </div>
        <!-- Formulário à direita -->
        <div class="form-container d-flex justify-content-center align-items-center">
            <div class="form-content">
                <!-- Título -->
                <h1 class="text-center mb-4">BankBoss </h1>
                
                <!-- Fundo azulado do formulário -->
                <div class="form-background">
                    <form id="CPF" style="width: 100%; max-width: 400px;" class="mb-3">
                        <div class="mb-3">
                            <label for="cpf" class="form-label">CPF</label>
                            <input type="text" class="form-control" id="cpf" placeholder="Digite seu CPF" maxlength="14" name="cpf  ">
                        </div>
                        <div class="mb-3">
                            <label for="senha" class="form-label">SENHA</label>
                            <input type="senha" class="form-control" id="senha" placeholder="informe sua senha">
                        </div>
                        <button type="submit"><a href="view/inicio.jsp">Cadastrar Cliente</button>
                        
                       <button type="button" class="exit-btn" onclick="window.close()">Sair</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>