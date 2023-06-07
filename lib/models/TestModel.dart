class TestModel {
  final String id;
  final String description;
  final String phoneNumber;
  final String imageURL;
  final bool adminApproved;
  final DateTime timestamp;

  TestModel({
    required this.id,
    required this.description,
    required this.phoneNumber,
    required this.imageURL,
    required this.adminApproved,
    required this.timestamp,
  });
}
