from conexao import criar_conexao


def main():
    print("Climate Intelligence Pipeline - projeto inicial")
    conexao = criar_conexao()
    if conexao:
        print("Tudo certo!")


if __name__ == "__main__":    
    main()