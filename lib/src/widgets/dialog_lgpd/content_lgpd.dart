import 'package:church_app/src/controllers/auth-controller.dart';
import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/src/util/launchApp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentLgpdDialog extends StatefulWidget {
  final String? mensagem;
  bool? isChecked;
  final VoidCallback? okTap;
  final VoidCallback? cancelTap;
  ContentLgpdDialog(
      {Key? key,
      this.mensagem,
      this.isChecked,
      this.okTap,
      @required this.cancelTap})
      : super(key: key);

  @override
  State<ContentLgpdDialog> createState() => _ContentLgpdDialogState();
}

class _ContentLgpdDialogState extends State<ContentLgpdDialog> {
  @override
  Widget build(BuildContext context) {
    final AuthController authController =
        Provider.of<AuthController>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Termo de consentimento - LGPD',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: AppColorLight.greyColor.withOpacity(.8))),
          SizedBox(height: 10),
          Container(
            child: Text(widget.mensagem!,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 17, color: AppColorLight.blackColor)),
          ),
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isChecked = !widget.isChecked!;
                    });
                    authController.setIschecked = widget.isChecked!;
                  },
                  icon: !widget.isChecked!
                      ? Icon(Icons.check_box_outline_blank_rounded,
                          color: AppColorLight.blackColor)
                      : Icon(Icons.check_box_outlined,
                          color: AppColorLight.blackColor),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Estou ciente dos',
                                style: TextStyle(
                                    color: AppColorLight.greyColor,
                                    fontSize: 13),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Termos',
                                      style: TextStyle(
                                          color: AppColorLight.blueColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launchLink(
                                              url:
                                                  'https://politicas.dm10.com.br/');
                                        }),
                                  TextSpan(
                                    text: ' de Uso e da ',
                                  ),
                                  TextSpan(
                                      text: 'Política de Privacidade',
                                      style: TextStyle(
                                          color: AppColorLight.blueColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launchLink(
                                              url:
                                                  'https://politicas.dm10.com.br/');
                                        }),
                                  TextSpan(
                                    text: ' do App Church Digital ',
                                  ),
                                ]))))
              ]),
          SizedBox(height: 20),
          InkWell(
              onTap: widget.okTap,
              child: Container(
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColorLight.greenColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text('Continuar',
                          style: TextStyle(
                              color: AppColorLight.pureWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))))),
          SizedBox(height: 10),
          InkWell(
              onTap: widget.cancelTap,
              child: Container(
                width: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Voltar',
                    style: TextStyle(
                        color: AppColorLight.pureWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
