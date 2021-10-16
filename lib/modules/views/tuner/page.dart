import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tunerplus/core/app_colors.dart';
import 'package:tunerplus/core/app_strings.dart';
import 'package:tunerplus/core/app_text.dart';
import 'bloc.dart';
import 'state.dart';

class TunerPage extends StatefulWidget {
  const TunerPage({Key? key}) : super(key: key);

  @override
  State<TunerPage> createState() => _TunerPageState();
}

class _TunerPageState extends State<TunerPage> {
  late TunerBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<TunerBloc>();
    _bloc.startListen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: AppColors.primary,
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: BlocBuilder<TunerBloc, TunerState>(
          bloc: _bloc,
          builder: (ctx, state) {
            final percent = (state.frequency - state.minFrequency) /
                (state.maxFrequency - state.minFrequency);
            if (state.listening) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 200,
                    height: 48,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.black.withOpacity(0.5),
                    ),
                    alignment: Alignment.center,
                    child: AppText(
                        text:
                            '${AppStrings.frequency}: ${state.frequency.toStringAsFixed(2)} Hz'),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: CircularProgressIndicator(
                              strokeWidth: 10,
                              value: percent,
                              color: AppColors.black.withOpacity(0.5),
                            ),
                          ),
                          Container(
                            width: 145,
                            height: 145,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.black.withOpacity(0.25),
                            ),
                            child: AppText(
                              text: state.note,
                              size: 72,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return const AppText(text: AppStrings.allowMicrophoneUse);
            }
          },
        ),
      ),
    );
  }
}
