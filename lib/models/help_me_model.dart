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

  // Factory method to create a PostResponse object from JSON
  factory HelpMeModel.fromJson(Map<String, dynamic> json) {
    return HelpMeModel(
      message: json['Message'] ?? '', // Handle null or missing fields
      address: json['address'] ?? '', // Handle null or missing fields
      lat: json['lati'] ?? 0, // Default value for lat
      long: json['longi'] ?? 0, // Default value for long
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
