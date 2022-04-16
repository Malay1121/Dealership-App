class EmployeeModel {
  String? image;
  String? department;
  String? dateOfJoining;
  String? role;
  String? location;
  String? salary;
  String? fullName;

  EmployeeModel(
      {this.department,
      this.role,
      this.salary,
      this.location,
      this.image,
      this.dateOfJoining,
      this.fullName});

  factory EmployeeModel.fromMap(map) {
    return EmployeeModel(
      department: map['department'],
      role: map['role'],
      salary: map['salary'],
      location: map['location'],
      image: map['image'],
      dateOfJoining: map['dateOfJoining'],
      fullName: map['fullName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'department': department,
      'role': role,
      'salary': salary,
      'location': location,
      'dateOfJoining': dateOfJoining,
      'image': image,
      'fullName': fullName,
    };
  }
}
