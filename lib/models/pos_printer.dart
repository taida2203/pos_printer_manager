import 'package:pos_printer_manager/enums/bluetooth_printer_type.dart';
import 'package:pos_printer_manager/enums/connection_type.dart';

class POSPrinter {
  String? id;
  String? name;
  String? address;
  int? deviceId;
  int? vendorId;
  int? productId;
  bool connected;
  int type;
  BluetoothPrinterType get bluetoothType => type.printerType();
  ConnectionType? connectionType;

  factory POSPrinter.instance() => POSPrinter();

  POSPrinter({
    this.id,
    this.name,
    this.address,
    this.deviceId,
    this.vendorId,
    this.productId,
    this.connected = false,
    this.type = 0,
    this.connectionType,
  });

  factory POSPrinter.fromJson(Map<String, dynamic> json) {
    return POSPrinter(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      deviceId: json['deviceId'],
      vendorId: json['vendorId'],
      productId: json['productId'],
      connected: json['connected'] ?? false,
      type: json['type'] ?? 0,
      connectionType: json['connectionType'] != null
          ? ConnectionType.values[json['connectionType']]
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'deviceId': deviceId,
      'vendorId': vendorId,
      'productId': productId,
      'connected': connected,
      'type': type,
      'connectionType': connectionType?.index,
    };
  }
}

extension on int {
  BluetoothPrinterType printerType() {
    BluetoothPrinterType value;
    switch (this) {
      case 1:
        value = BluetoothPrinterType.classic;
        break;
      case 2:
        value = BluetoothPrinterType.le;
        break;
      case 3:
        value = BluetoothPrinterType.dual;
        break;
      default:
        value = BluetoothPrinterType.unknown;
    }
    return value;
  }
}
