import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_update_delete_pets_state.dart';

class AddUpdateDeletePetsCubit extends Cubit<AddUpdateDeletePetsState> {

  AddUpdateDeletePetsCubit() : super(AddUpdateDeletePetsInitial());


}
