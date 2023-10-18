import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/api/dicebear_api.dart';

part 'dicebear_event.dart';
part 'dicebear_state.dart';

class DicebearBloc extends Bloc<DicebearEvent, DicebearState> {
  DicebearBloc() : super(DicebearInitial()) {
    on<GenerateButtonPressedEvent>((event, emit) async{
      try {
        print("Query Param : ${event.query}");
        print("ArtStyle : ${event.artStyle}");
        emit(DicebearDataLoading());
        final getData = await DicebearApi().getDicebear(
          artStyle: event.artStyle,
          query: event.query
        );
        emit(
          DicebearGetSuccess(
            imageData: getData
          )
        );
        print("GET data berhasil");
      } catch (e) {
        emit(
          const DicebearDataFailed(
            errorMessage: "Gagal melakukan GET"
          )
        );
      }
    });

    on<PageChangedDicebearEvent>((event, emit) {
      emit(DicebearInitial());
    });
  }
}
