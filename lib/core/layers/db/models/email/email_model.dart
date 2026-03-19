class EmailModel {
  String? id;
  String? title;
  List<Recipient>? recipients;
  Status status;

  EmailModel({
    this.id,
    this.title,
    this.recipients,
    this.status = Status.pending,
  });

  factory EmailModel.fromJson(Map<String, dynamic>? json) {
    return EmailModel(
      id: json?['id'] as String?,
      title: json?['title'] as String?,
      recipients: (json?['recipients'] as List?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: _statusFromString(json?['status'] as String?) ?? Status.pending,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'recipients': recipients?.map((e) => e.toJson()).toList(),
      'status': status.name, // Dart enum name
    };
  }

  static Status? _statusFromString(String? value) {
    if (value == null) return null;
    return Status.values.firstWhere(
      (e) => e.name == value,
      orElse: () => Status.pending,
    );
  }
}

class Recipient {
  String? name;
  String? address;

  Recipient({this.name, this.address});

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(
      name: json['name'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'address': address};
  }
}

enum Status { draft, pending, sent }
