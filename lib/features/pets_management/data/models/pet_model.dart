import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vets_project/features/pets_management/domain/entities/pet_entity.dart';

class PetModel extends PetEntity {
  const PetModel({
    required super.id,
    required super.name,
    required super.age,
    required super.species,
    required super.breed,
    required super.color,
    required super.weight,
    required super.gender,
    required super.photoURL,
    required super.ownerID,
    required super.doctorsID,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'],
      name: json['name'],
      age: (json['age'] as Timestamp).toDate(),
      species: json['species'],
      breed: json['breed'],
      color: json['color'],
      weight: json['weight'],
      gender: json['gender'],
      photoURL: json['photoURL'],
      ownerID: json['ownerID'],
      doctorsID: json['doctorsID'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'age': age,
        'species': species,
        'breed': breed,
        'color': color,
        'weight': weight,
        'gender': gender,
        'photoURL': photoURL,
        'ownerID': ownerID,
        'doctorsID': doctorsID,
      };


}
