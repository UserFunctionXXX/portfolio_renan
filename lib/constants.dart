import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Colors
const Color kPrimaryColor = Color(0xff512DA8);
const String linkLinkedin = "https://www.linkedin.com/in/renan-qsantos/";

// Social Media
const kSocialIcons = [
  "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
  "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
  "https://img.icons8.com/metro/308/ffffff/linkedin.png",
  "https://img.icons8.com/material-rounded/384/ffffff/github.png",
];

const kSocialLinks = [
  "https://www.facebook.com/renan.gomes.923724",
  "https://www.instagram.com/renan_qsantos/?hl=pt-br",
  linkLinkedin,
  "https://github.com/UserFunctionXXX",
];

// URL Launcher
void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

// Community
final kCommunityLogo = [

];

final kCommunityLinks = [

];

// Tools & Tech
final kTools = [
  "Flutter",
  "Dart",
  "Advpl",
  "Java",
  "Android",
  "Kotlin",
  "Angular",
  "Firebase",
  "AWS"
];

// services
final kExperiencesIcons = [
  "assets/services/app.png",
  "assets/services/ui.png",
  "assets/services/erp.png",
  /*"assets/services/open.png",*/
];

final kExperiencesTitles = [
  "Desenvolvimento Mobile",
  "Desenvolvimento Web",
  "Desenvolvimento Protheus",
  /*"GitHub",*/
];

final kExperiencesDescriptions = [
  "Desenvolvimento Mobile\n- Flutter\n- Kotlin\n- Java"+
  "\n- Design UI/UX com o Figma"+
  "\n- Splash Screen\n-API Rest e Firebase",
  "Desenvolvimento Web\n- Sites com design responsivo\n- Aplicações Web com Flutter \n- MVP rápido com AWS S3\n- Landing page\n- Hospedagem com HTTPS",
  "Desenvolvimento Protheus\n- Criação de dashboards\n- Customização de processos\n- Integração de sistemas com o Protheus\n- Atualização de versão\n- Criação de relatórios"
];

final kExperiencesLinks = [
  "",
  "",
  ""/*"https://github.com/UserFunctionXXX"*/
];

// projects
final kProjectsBanner = [
  "assets/projects/stop_project.png",
  "assets/projects/editora_project.png",
  "assets/projects/escambo_project.png",
  "assets/projects/florestal_project.png",
  
];

final kProjectsIcons = [
  "assets/projects/dic.png",
  "assets/projects/book.png",
  "assets/projects/barter.png",
  "assets/projects/florest.png",
  
];

final kProjectsTitles = [
  "Stop Universitário",
  "APP Estoque",
  "Escambo",
  "Controle Florestal",
  
  
];

final kProjectsDescriptions = [
  "Sua ferramenta indispensável para jogar Stop com os amigos.",
  "Com este aplicativo é possível gerenciar sua carteira de clientes e visualizar o catálogo de produtos de forma simples e rápida.",
  "O Escambo conecta usuários que querem realizar trocas de produtos, mercadorias e serviços.",
  "Aplicativo de controle florestal com funcionalidades de inventário e controle de entrada de madeira no pátio.",
  
  
];

final kProjectsLinks = [
  "https://stopuniversitario.com.br/",
  "https://play.google.com/store/apps/details?id=br.com.melhoramentos.editora",
  "https://play.google.com/store/apps/details?id=com.stetter.escambo",
  "https://play.google.com/store/apps/details?id=br.com.melhoramentos.controleflorestal",
  
  
];

// Contact
final kContactIcons = [
  Icons.home,
  Icons.messenger,
  Icons.mail,
];

final kContactTitles = [
  "Localização",
  "Linkedin",
  "Email",
];

final kContactDetails = [
  "São Paulo, Brasil",
  "@renan_qsantos",
  "renangomes09@hotmail.com"
];
final kAboutTitle = "Meu nome é Renan Gomes... Um desenvolvedor Flutter apaixonado por desenvolvimento mobile e multiplataforma.";


final kAboutDescription = "Profissional FullStack Mobile com conhecimentos sólidos em Flutter com Dart e Android Nativo com Java/Kotlin."+
"\nDurante minha trajetória como desenvolvedor ADVPL, adquiri conhecimentos em criação e tuning de querys T-SQL e tenho experiência avançada em desenvolvimento ADVPL, arquitetura e instalação do Protheus e migração de versão."
"\nAtualmente venho trabalhando em projetos de desenvolvimento Web que utilizam a biblioteca open source PO UI, e as tecnologias Angular e Typescript. Além disso, iniciei o processo de certificação AWS Certified Developer Associete."
"\nNesta minha jornada de desenvolvimento mobile, desenvolvi diversos app em Android nativo JAVA, e para aprimorar ainda mais meus conhecimentos "+
"estou migrando alguns destes app para Flutter e estudando cada vez mais padrões de arquitetura de software.";
final kSoapLetters =  "Scrum, Kanban, Git, Git Flow, MySQL, MS SQL, Postgres, AWS S3, AWS EC2, AWS CloudFront, AWS Route 53, AWS RDS, Google Firebase, API REST, SOAP, Docker, Jira, DIO Http, Flutter, Dart, Advpl, Java, Android,  Kotlin, Angular, POUI, Figma, SOLID, Clean Architecture, MVC, MVVM, Retrofit, UI/UX";
