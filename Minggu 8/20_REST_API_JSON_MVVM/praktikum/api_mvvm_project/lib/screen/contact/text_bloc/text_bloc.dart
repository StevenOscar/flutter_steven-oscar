import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/api/text_api.dart';
import '../../../model/text_model.dart';

part 'text_event.dart';
part 'text_state.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextInitial()) {
    on<PutTextEvent>((event, emit) async {
      try {
        emit(TextDataLoading());
        final putData = await TextApi().putText(event.textItem);
        emit(
          TextPutSuccess(
            textData: putData
          )
        );
        print("PUT data berhasil");
      } catch (e) {
        emit(
          const TextDataFailed(
            errorMessage: "Gagal melakukan PUT"
          )
        );
      }
    });
  }
}
