import 'package:church_app/src/widgets/dialog_lgpd/content_lgpd.dart';
import 'package:church_app/assets/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

enum AlertType { DANGER, SUCCESS, ERROR }

mensagemAlerta(BuildContext context, AlertType typeDialog,
    {String? mensagem, @required VoidCallback? okTap}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColorLight.pureWhite,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                typeDialog == AlertType.DANGER
                    ? Icon(Icons.warning_rounded,
                        color: Colors.orangeAccent, size: 100)
                    : typeDialog == AlertType.SUCCESS
                        ? Icon(Icons.check,
                            color: AppColorLight.greenColor, size: 100)
                        : typeDialog == AlertType.ERROR
                            ? Icon(Icons.cancel,
                                color: AppColorLight.redColor, size: 100)
                            : Container(),
                typeDialog == AlertType.DANGER
                    ? Text('Atenção!',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: AppColorLight.greyColor))
                    : typeDialog == AlertType.SUCCESS
                        ? Text('Sucesso!',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: AppColorLight.greyColor))
                        : typeDialog == AlertType.ERROR
                            ? Text('Error!',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: AppColorLight.greyColor))
                            : Container(),
                SizedBox(height: 10),
                Text(mensagem!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: AppColorLight.blackColor)),
                SizedBox(height: 20),
                InkWell(
                    onTap: okTap,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              color: AppColorLight.fontButtonsColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        );
      });
}

mensagemAlertaLGPD(BuildContext context,
    {String? mensagem,
    @required VoidCallback? cancelTap,
    @required VoidCallback? okTap,
    @required bool? isChecked}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            backgroundColor: AppColorLight.pureWhite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: ContentLgpdDialog(
              isChecked: isChecked!,
              okTap: okTap!,
              cancelTap: cancelTap!,
              mensagem: mensagem!,
            ));
      });
}

modalRemoverConta(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Deseja mesmo excluir sua conta?',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColorLight.fontSelectedIndexColor)),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                        'A exclusão dos seus dados apenas será feita após a avaliação do nosso time.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        )),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Toast.show(
                            'Solicitação de remoção de conta realizado com sucesso, por favor aguarde!',
                            /*context,*/
                            duration: Toast.lengthLong,
                            gravity: Toast.top,
                            backgroundColor: AppColorLight.lightCardColor);
                      },
                      child: Container(
                          width: 150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColorLight.greenColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text('Continuar',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))))),
                  SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.error,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                                color: AppColorLight.fontButtonsColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ))
                ],
              ),
            ));
      });
}
