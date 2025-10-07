# cntdd_updateR
# 🧩 Atualizador Automático de R, RStudio e Rtools  
**Projeto:** contabiliDados UFERSA  
🔗 [http://contabilidados.com.br](http://contabilidados.com.br)

---

## 📘 Descrição

Este repositório contém um **script em Batch (.bat)** que automatiza todo o processo de **atualização do ambiente R no Windows**, incluindo:

- Atualização do **R** (sistema base)  
- Atualização do **RStudio** (IDE)  
- Atualização do **Rtools** (ferramentas de compilação)  
- Atualização de **todos os pacotes R instalados**  

O script foi desenvolvido pelo projeto **contabiliDados UFERSA**, com o objetivo de facilitar a manutenção de ambientes R acadêmicos e profissionais, eliminando a necessidade de atualização manual.

---

## ⚙️ Funcionalidades

✅ **Verificação automática do Winget**
- Caso o Winget (gerenciador de pacotes do Windows) não esteja instalado, o script realiza:
  - Download do **App Installer** diretamente da Microsoft
  - Instalação automática e orientação para reabrir o terminal

🔄 **Atualização completa do ambiente R**
- Atualiza automaticamente:
  - `RProject.R`
  - `Posit.RStudio`
  - `RProject.Rtools`

📦 **Atualização dos pacotes R**
- Detecta automaticamente a versão mais recente do R instalada
- Executa `update.packages()` com repositório CRAN oficial (`https://cran.r-project.org`)

🎨 **Interface amigável no terminal**
- Exibe arte ASCII e mensagens informativas com progresso da atualização

---

## 🖥️ Como usar

1. **Baixe** o arquivo `atualiza_R.bat`  
2. **Execute** o script como **Administrador**  
3. O script fará automaticamente:
   - Instalação do Winget (se necessário)
   - Atualização de R, RStudio e Rtools
   - Atualização dos pacotes R

---

## 📊 Exemplo de saída

```bash
Winget encontrado! Prosseguindo com atualizacao de R, RStudio e Rtools...
Versao detectada: R-4.4.1
Usando: "C:\Program Files\R\R-4.4.1\bin\Rscript.exe"
Atualizando pacotes do R...
Processo concluido! - contabiliDados UFERSA

