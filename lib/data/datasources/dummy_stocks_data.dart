import '../models/stock_model.dart';

class DummyStockData {
  static List<Stock> getStocks() {
    return [
      Stock(name: "RELIANCE", exchange: "NSE | EQ", price: 1374.10, change: -4.40, percent: -0.32),
      Stock(name: "HDFCBANK", exchange: "NSE | EQ", price: 966.85, change: 0.85, percent: 0.09),
      Stock(name: "ASIANPAINT", exchange: "NSE | EQ", price: 2537.40, change: 6.60, percent: 0.26),
      Stock(name: "NIFTY IT", exchange: "IDX", price: 35187.30, change: 876.86, percent: 2.56),
      Stock(name: "RELIANCE SEP 1880 CE", exchange: "NSE | Monthly", price: 0.00, change: 0.00, percent: 0.00),
      Stock(name: "RELIANCE SEP 1370 PE", exchange: "NSE | Monthly", price: 19.20, change: 1.00, percent: 5.49),
      Stock(name: "MRF", exchange: "NSE | EQ", price: 147625.00, change: 550.00, percent: 0.37),
      Stock(name: "MRF", exchange: "BSE | EQ", price: 147439.45, change: 463.80, percent: 0.32),
    ];
  }
}