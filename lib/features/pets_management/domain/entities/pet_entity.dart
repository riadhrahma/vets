import 'package:equatable/equatable.dart';

class PetEntity extends Equatable {
  final String id;
  final String name;
  final DateTime age;
  final String species;
  final String breed;
  final String color;
  final double weight;
  final String gender;
  final String photoURL;
  final String ownerID;
  final List doctorsID;

  const PetEntity({
    required this.id,
    required this.name,
    required this.age,
    required this.species,
    required this.breed,
    required this.color,
    required this.weight,
    required this.gender,
    required this.photoURL,
    required this.ownerID,
    required this.doctorsID,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        age,
        species,
        breed,
        color,
        weight,
        gender,
        photoURL,
        ownerID,
        doctorsID,
      ];
}
