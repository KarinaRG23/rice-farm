import 'package:farm_rice_web_flutter/app_level/extentions/textstyle_extension.dart';
import 'package:farm_rice_web_flutter/app_level/utilies/screen_size.dart';
import 'package:farm_rice_web_flutter/class/classUserTable.dart';

import 'package:flutter/material.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails({Key key, @required this.data})
      : assert(data != null),
        super(key: key);

  final UserTable data;

  Iterable<MapEntry<String, String>> get _fieldValues =>
      _onGenerateFields(data).entries;

  @override
  Widget build(BuildContext context) {
    //

    final width = ScreenQueries.instance.width(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CloseButton(),
        for (final fieldValue in _fieldValues) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: width * 0.1,
                  child: Text(fieldValue.key),
                ),
                SizedBox(
                  width: width * 0.1,
                  child: Text(
                    fieldValue.value,
                    style: const TextStyle().bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ],
    );
  }

  Map<String, String> _onGenerateFields(UserTable data) {
    final fieldValues = {
      'idpersona': data.userID.toString(),
      'cedula' : data.dni,
      'nombres': data.name,
      'apellidos': data.lastname,
      'telefono': data.phone,
      'email': data.email,
      'nombrefiscal': data.fiscalName,
      'direccionfiscal': data.direction,
      'rolid': data.rolId,
      'status': data.status
    };

    return fieldValues;
  }
}
