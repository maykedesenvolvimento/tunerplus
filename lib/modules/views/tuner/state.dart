class TunerState {
  double frequency;
  double minFrequency;
  double maxFrequency;
  String note;
  int octave;
  bool listening;
  String? error;

  TunerState({
    required this.frequency,
    required this.minFrequency,
    required this.maxFrequency,
    required this.note,
    required this.octave,
    required this.listening,
    this.error,
  });

  TunerState copyWith({
    double? frequency,
    double? minFrequency,
    double? maxFrequency,
    String? note,
    int? octave,
    bool? listening,
    String? error,
  }) {
    return TunerState(
      frequency: frequency ?? this.frequency,
      minFrequency: minFrequency ?? this.minFrequency,
      maxFrequency: maxFrequency ?? this.maxFrequency,
      note: note ?? this.note,
      octave: octave ?? this.octave,
      listening: listening ?? this.listening,
      error: error ?? this.error,
    );
  }
}

final initialState = TunerState(
  frequency: 0,
  minFrequency: 0,
  maxFrequency: 0,
  note: '',
  octave: 0,
  listening: false,
);
