# Aplicarivo de chat em grupo

## Sobre

O aplicativo Chat, é um aplicativo de bate papo simples desenvolvido utilizado Flutter e fireBase. 
Seu funcionamento ocorre através da conexão ao e-mail do google e conversando por um grupo já cadastrado. Todas as conversas são feitas somente através dos grupos.


O projeto segue a arquitetura ``MVC`` (Model, View, Controller). Estando organizado no seguinte estilo de pastas: 


```bash
    📁chat
     ┗ 📁lib
        ┗ 📁controller
        ┗ 📁models
        ┗ 📁page
            ┗ 📁route
        ┗ 📜main.dart
```


## Demonstração


Uma demostração do aplicativo pode ser visto a seguir.


![](screen/demonstracao.gif)


## Clone do projeto


Para utilizar é necessário realizar o clone do repositório e instalar suas dependências


```
git clone https://github.com/RToramaru/chat.git
cd chat
flutter pub get
```


## Configuração do projeto

Após instalado as dependências é necessário realizar algumas configurações em relação ao Firebase.


1 - Para tal é necessário inicialmente criar um projeto no Firebase, que pode ser acessado através do link [Firebase](https://console.firebase.google.com/).


2 - Após o projeto criado habilitar a opção ``Authentication``


3 - No método de autenticação selecionar ``Provedor Google`` e configurar.


4 - Autenticação feita o próximo passo é habilitar o ``Cloud Firestore`` que servirá como o banco de dados do projeto.


5 - Feito isso a próxima etapa é adicionar o projeto do Firebase ao aplicativo Flutter.Para isso existe duas maneiras possíveis.


    1 - Através do console do Firebase, para isso é necessário seguir uma etapas.


        1 - Acessar as configurações do projeto.


        2 - Selecionar opção ``Adicionar aplicativo``


        3 - Registrar o App


        4 - Fazer o download do arquivo ``google-services`` e adicionar ao caminho ``android/app/``


        5 - Adicionar o SDK do Firebase no caminho ``android/build.gradle`` e no caminho ``android/app/build.gradle``


    2 - Através do FIrebase CLI, para isso é necessário seguir uma etapas


        1 - Caso não tenha o FIrebase CLI instalado, pode se instalar através de duas formas


            1 - Binários do CLI para Windows através do link [Firebase CLI](https://firebase.tools/bin/win/instant/latest)


            2 - Através do npm 


            ```
            npm install -g firebase-tools 
            ```


        2 - Após intalado é necessário ativar o Firebase CLI e configurar no projeto.


        ```
        dart pub global activate flutterfire_cli
        flutterfire configure
        ```


    **OBS** Caso utilize a primeira opção o arquivo ``lib/main.dart`` deve ser alterado de 


    ```
    await Firebase.initializeApp(
    name: 'chat-app',
    options: DefaultFirebaseOptions.currentPlatform,
    );
    ```


    para 


    ```
    await Firebase.initializeApp(
    name: 'chat-app',
    );
    ```


6 - Concluida todas essas etapas o projeto ja pode ser executado através do comando ``flutter run``



## Versão Release


Caso deseje testar o aplicativo com o banco de dados ja configurado, pode baixar o apk de release e instalar no dispositivo, através do link [APK](https://github.com/RToramaru/chat/releases/download/app-use/chat.apk) 


``@author Rafael Almeida``