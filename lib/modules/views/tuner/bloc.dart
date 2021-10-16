import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:tunerplus/modules/models/note.dart';
import 'state.dart';

// 33 >= first octave > 66;
final List<NoteModel> notes = [
  NoteModel('C', 33),
  NoteModel('C#', 34.947),
  NoteModel('D', 37.026),
  NoteModel('D#', 39.237),
  NoteModel('E', 41.58),
  NoteModel('F', 44.055),
  NoteModel('F#', 46.662),
  NoteModel('G', 49.434),
  NoteModel('G#', 52.371),
  NoteModel('A', 55.506),
  NoteModel('A#', 58.806),
  NoteModel('B', 62.304),
];

class TunerBloc extends Cubit<TunerState> {
  final FlutterFft _flutterFft = FlutterFft();

  TunerBloc() : super(initialState);

  Future<void> startListen() async {
    while (!(await _flutterFft.checkPermission())) {
      _flutterFft.requestPermission();
    }
    await _flutterFft.startRecorder();
    final data = state.copyWith();
    data.listening = _flutterFft.getIsRecording;
    _flutterFft.onRecorderStateChanged.listen(_changeState);
    emit(data);
  }

  void _changeState(List<Object> event) {
    final data = state.copyWith();
    data.frequency = event[1] as double;
    data.octave = event[5] as int;
    final idx = notes.indexWhere((e) => e.name == event[2] as String);
    data.note = notes[idx].name;
    final factor = data.octave == 1 ? 1 : pow(2, data.octave - 1);
    data.minFrequency = notes[idx].frequency * factor;
    data.maxFrequency = idx == notes.length - 1
        ? notes[0].frequency * factor
        : notes[idx + 1].frequency * factor;
    emit(data);
  }
}
