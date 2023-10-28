import pandas as pd


def main():
    data = pd.read_csv('EDGE_GEOCODE_PUBLICLEA_1718.csv')
    print(data.columns)


if __name__ == '__main__':
    main()
