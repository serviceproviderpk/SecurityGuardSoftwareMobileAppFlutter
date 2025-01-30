class HelpMeModel {
  final String message;
  final String address;
  final int lat;
  final int long;

  // Constructor
  HelpMeModel({
    required this.message,
    required this.address,
    required this.lat,
    required this.long,
  });

  factory HelpMeModel.fromJson(Map<String, dynamic> json) {
    return HelpMeModel(
      message: json['Message'] ?? '',
      address: json['address'] ?? '',
      lat: json['lati'] ?? 0,
      long: json['longi'] ?? 0,
    );
  }

  // Method to convert PostResponse to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'Message': message,
      'address': address,
      'lati': lat,
      'longi': long,
    };
  }
}
