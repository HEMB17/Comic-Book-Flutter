import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

final keepAnalysisHappy = Intl.defaultLocale;

typedef MessageIfAbsent(String messageStr, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "titleScreenHome":
            MessageLookupByLibrary.simpleMessage("Libros de Historietas"),
        "titleCharacters": MessageLookupByLibrary.simpleMessage("Caracteres"),
        "titleTeams": MessageLookupByLibrary.simpleMessage("Equipos"),
        "titleLocalization":
            MessageLookupByLibrary.simpleMessage("Localización"),
        "titleConcepts": MessageLookupByLibrary.simpleMessage("Conceptos"),
      };
}
