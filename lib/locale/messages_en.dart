import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

final keepAnalysisHappy = Intl.defaultLocale;

typedef MessageIfAbsent(String messageStr, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "titleScreenHome": MessageLookupByLibrary.simpleMessage("Comic Books"),
        "titleCharacters": MessageLookupByLibrary.simpleMessage("Characters"),
        "titleTeams": MessageLookupByLibrary.simpleMessage("Teams"),
        "titleLocalization":
            MessageLookupByLibrary.simpleMessage("Localization"),
        "titleConcepts": MessageLookupByLibrary.simpleMessage("Concepts"),
      };
}
