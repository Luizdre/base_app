
# Projeto base de aplicação

Um projeto desenvolvido para ser uma base consistente de uma aplicação de grande porte, aqui serão encontrados métodos padrões, implementações de classes customizadas para que seja necessário se preocupar somente com a escalabilidade do projeto, alguns padrões de arquitetura serão adotados e mencionados abaixo em suas devidas seções.

Esse projeto faz utilização do Firebase, sendo assim, quando fizer a criação de um novo projeto, criar um projeto dentro do firebase e trocar arquivo "google-services.json" dentro de android/app/

Assim como é necessário rodar o comando flutter pub run change_app_package_name:main {{Novo package name}} para que seja gerado um novo bundleId

## Arquitetura

Inicialmente temos o seguinte padrão de arquitetura onde trabalharemos com módulos na aplicação, ficando a critério do projeto utilizar mono ou multi repos, o projeto foi baseado na ideia onde cada pasta é responsável **SOMENTE** pelo seu tipo entidade, ex: pastas de repositories, conterão **APENAS** repositories, assim como models, etc.

## Padrões de Projeto

**Singleton** - Adotamos o Singleton para classes que serão utilizadas apenas uma vez na aplicação como um todo, buscando assim uma maior performance e economia de memória, assim como uma menor repetição de códigos.

**Factory** - Para criação de novas instâncias, utilizaremos o padrão Factory para um melhor entendimento do que está sendo realizado.

**Abstract Contract** - Se baseia no princípio onde, sempre que necessário, utilizar de implementações de classes abstratas para que métodos essenciais não sejam esquecidos e maior consistência nos métodos da classe.

## Formatação do código

Para uma melhor visualização e padronização do código, buscaremos sempre seguir a seguinte ordem de fatores:

**Primeiro** - Declaramos as variáveis;
**Segundo** - Construímos as classes e declaramos as dependências, assim como um método de construção, se necessário;
**Terceiro** - Implementamos os métodos, buscando sempre que possível utilizarmos contratos abstratos.

## ADENDO

Buscaremos sempre manter um padrão nos nomes de variáveis e métodos onde: **SEJA CLARO E CONDIZENTE** o nome que está sendo utilizado

Buscaremos declarar variáveis agrupando por tipo de variáveis.

Teremos um controle dentro desse repositório base onde nem mesmo os warnings serão tolerados e serão barrados no github actions, então cuidado.

**VARIÁVEIS SEM TIPAGEM NÃO SERÃO PERDOADAS**

```
Implementar exemplo de código
```

## Bibliotecas de terceiros que foram utilizadas

**Flutter Modular** - Para nos permitir modularizar a aplicação, realizar a injeção de dependências de cada módulo e ter um controle maior de memória sempre que um módulo for iniciado ou finalizado;

**Mobx e Flutter Mobx** - Para realizarmos o gerenciamento de estado de cada tela, podendo ser implementado qualquer outro a critério do usuário;

**Dio** - Cliente utilizado para realizar as requisições HTTP que forem necessárias dentro da aplicação;

**Dio Cache Interceptor** - Utilizado para controle de cache, caso uma versão WEB for implementada para a aplicação;

**Dio Smart Retry** - Utilizado para definir estratégias de retry dentro das requisições;

**Pretty Dio Logger** - Utilizado para interceptar todas as requisições e termos um log atraente de tudo que está se passando para um melhor debug;

**Flutter Local Notifications** - Utilizado para apresentar as pushes notifications que o firebase envia, assim como sendo possível definir notificações periódicas para um marketing da aplicação.

**Firebase Analytics** - Utilizado para definir estratégias de análise dentro da aplicação e enviar logs específicos para o firebase;

**Firebase Core** - Utilizado para inicializar o firebase dentro da aplicação;

**Firebase Crashlytics** - Utilizado para enviar logs de crashes para o firebase, isso auxilia em uma manutenção consistente da aplicação buscando sempre uma melhor usabilidade pelo usuário.

**Firebase Messaging** - Utilizado para receber pushes notifications do firebase dentro da aplicação;

**Firebase Performance** - Utilizado para definir estratégias de acompanhamento dentro do firebase, tais como definir tempo máximo para execução de X tarefa;

**Build Runner** - Para criar códigos on demand e trabalhar em conjunto com o Mobx.

**Change App Package Name** - Utilizado para alterar o nome do package e gerar a aplicação com o bundleId necessário.

**Flutter Secure Storage** - Utilizado para salvar dados na memória interna do device de forma encriptada nativamente e segura.

## Classes customizadas

**DioClient** - Classe base para o dio, onde estão sendo implementados todos os interceptors, loggers, retries, dentre muitos outros;

## Reatividade

Toda reatividade fica pelo trabalho da package MobX, sendo assim, todos os controllers/repositories que precisarão ser atualizados deverão segui o padrão do MobX onde uma classe abstrata devera extender uma Store, temos um exemplo de Notificações recebidas, o valor da variável é alterada no **NotificationRepository**, esse exemplo conecta ao **CloudMessagingRepository** e ao módulo inicial

## Comandos básicos

Para essa seção temos o arquivo Makefile que serve como um facilitador no momento de gerar os códigos.

**watch-code** - Executa o comando onde assiste todas as alterações do códigos e faz as devidas alterações necessárias nas stores;

**basic-tests** - Executa a formatação do código e verifica se não existe nenhum warning, recomendado executar antes de lançar um commit;

**format-code** - Apenas formata o código;

**adb-restart** - Reinicia o ADB (caso esteja testando em um device android físico);

**clean** - Limpa as bibliotecas e faz o carregamento das mesmas;

**cache-repair** - Limpa o cache do flutter e carrega novamente;

**apply-lint** - Busca problemas no código e aplica as devidas correções.

**flutter pub run change_app_package_name:main {{Novo bundle}}** - Gera um novo bundleId para a aplicação

## Github

O projeto busca algumas facilidades com o github, como implementar algumas actions e templates para que a configuração das mesmas seja a menor possível.

**Pull Request Template** - Arquivo utilizado por definir um template padrão na abertura de uma pull request, pode ser alterado para atender as necessidades.

## Github Actions

**cache-gradle-dep** - Verifica se nenhum daemon do Gradle está em execução quando o fluxo estiver concluído. Criar o pacote de cache pode falhar devido a bloqueios mantidos pelo Gradle.

**cache-pods-dep** - Verifica se nenhum daemon do Pod está em execução quando o fluxo estiver concluído. Criar o pacote de cache pode falhar devido a bloqueios mantidos pelo Pod.

**create-github-release** - Cria uma release da aplicação, pega sempre da branch com o nome "release/versao-app", buscar seguir esse padrão ou alterar o arquivo.

**delete-ios-certs** - Deleta certificados do ios.

**firebase-push-app-dist** - Responsável por publicar a aplicação no firebase.

**setup-flutter-app** - Faz o build da aplicação.

**setup-ios-certs** - Faz a instalação do certificado do iOS.

## Github workflows

**delete-branch-caches** - Deleta os caches de branches do github e necessida de um token em uma variável de ambiente chamada "TOKEN"

**pr-develop** - Responsável por realizar testes assim que uma PR é aberta dentro da branch develop