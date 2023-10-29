import pandas as pd


def main():
    data = pd.read_csv('Advanced_Mathematics.csv', encoding='gbk')
    print(data.columns)


if __name__ == '__main__':
    main()
