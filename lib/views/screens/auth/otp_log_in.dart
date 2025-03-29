import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_pin_code_field.dart';
import 'package:untitled/views/screens/auth/reset_password.dart';
import 'package:untitled/views/screens/topup/payment_details.dart';

class OtpLogin extends StatefulWidget {
  const OtpLogin({super.key});

  @override
  State<OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends State<OtpLogin> {
  late ReceivePort _receivePort;
  late SendPort _sendPort;
  int _start = 60; // Timer starting value (seconds)
  bool _isButtonDisabled = true;
  late Isolate _isolate;
  late TextEditingController _forgotPasswordTEController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _forgotPasswordTEController = TextEditingController();
    _startTimer();
  }

  @override
  void dispose() {
    _receivePort.close();
    _isolate.kill();
    super.dispose();
  }

  // Start the countdown timer using Isolate
  void _startTimer() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_startCountdown, _receivePort.sendPort);

    _receivePort.listen((count) {
      setState(() {
        _start = count;
        if (_start == 0) {
          _isButtonDisabled = false;
        }
      });
    });
  }

  // Function that runs in the isolate
  static void _startCountdown(SendPort sendPort) {
    int _start = 60;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _start--;
      sendPort.send(_start);
      if (_start == 0) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(32, 108, 32, 0) ,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppString.verifyPhone.tr,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 14 ),
                  Text(
                    AppString.pleaseCheckYourPhoneAndEnterTheCode.tr,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 32 ),
                  const CustomPinCodeTextField(),
                  const SizedBox(height: 32 ),
                  // Timer Text
                  Center(
                    child: Row(
                      spacing: 5 ,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.access_time_outlined),
                        Text(
                          _formatTime(_start),
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32 ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const PaymentDetailsPage(fromLoginOTP: true,));
                      },
                      child: Text(
                        AppString.confirm.tr,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32 ),
                  Visibility(
                    visible: !_isButtonDisabled,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppString.didNotReceiveCode.tr,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            _resetTimer(); // Reset and start the timer again
                          },
                          child: Text(
                            AppString.resendIt.tr,
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(fontWeight: FontWeight.bold,color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Format the time in MM:SS
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  // Reset the timer to initial state
  void _resetTimer() {
    setState(() {
      _start = 60;
      _isButtonDisabled = true;
    });
    _startTimer();
  }
}
