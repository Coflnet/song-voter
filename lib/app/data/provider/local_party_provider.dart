import 'package:song_voter/app/data/db/party_database.dart';
import 'package:song_voter/app/data/models/party.dart';

class LocalPartyProvider {
  static final LocalPartyProvider instance = LocalPartyProvider._init();

  final PartyDatabase _db = PartyDatabase.instance;

  LocalPartyProvider._init();

  Future<List<Party>> readAllParties() async {
    return _db.readAllParties();
  }
}
